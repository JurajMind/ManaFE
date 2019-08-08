import 'dart:async';

import 'package:app/app/app.dart';

import 'package:flutter/widgets.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class MixologyBloc {
  static const _mixPerPage = 10;

  final _apiClient = App.http;

  final _cache = Map<int, TobaccoMixSimpleDto>();
  final _downloaders = Map<int, Future<List<TobaccoMixSimpleDto>>>();

  final mixCreator = BehaviorSubject<List<FeatureMixCreatorDto>>();

  final Map<String, BehaviorSubject<List<TobaccoMixSimpleDto>>>
      mixCreatorMixes =
      new Map<String, BehaviorSubject<List<TobaccoMixSimpleDto>>>();

  final Map<String, int> mixCreatorMixesPages = new Map<String, int>();
  final List<String> fullLoaded = new List<String>();
  int maxInt = 0x7fffffff;

  bool haveNext = true;

  static final MixologyBloc _instance = new MixologyBloc._();

  factory MixologyBloc() => MixologyBloc._instance;

  MixologyBloc._() {
    loadMixCreator();
    loadCreatorMixes('me', 0);
    loadFavoriteMixes();
  }

  Future loadMixCreator() async {
    final creators = await _apiClient.getMixCreator();
    this.mixCreator.add(creators);
  }

  Future addToFavorite(TobaccoMixSimpleDto mix) {
    String favorite = "favorite";
    if (this.mixCreatorMixes[favorite] == null) {
      this.mixCreatorMixes[favorite] =
          new BehaviorSubject<List<TobaccoMixSimpleDto>>();
    }

    var old = this.mixCreatorMixes[favorite].value;
    if (old == null) old = new List<TobaccoMixSimpleDto>();
    old.add(mix);
    this.mixCreatorMixes[favorite].add(old);
  }

  Future removeFromFavorite(TobaccoMixSimpleDto mix) {
    String favorite = "favorite";
    if (this.mixCreatorMixes[favorite] == null) {
      this.mixCreatorMixes[favorite] =
          new BehaviorSubject<List<TobaccoMixSimpleDto>>();
    }

    var old = this.mixCreatorMixes[favorite].value;
    if (old == null) old = new List<TobaccoMixSimpleDto>();
    old.remove(mix);
    this.mixCreatorMixes[favorite].add(old);
  }

  Future loadCreatorMixesNextPage(String creatorName) async {
    if (fullLoaded.contains(creatorName)) {
      return;
    }

    if (this.mixCreatorMixesPages[creatorName] == null) return;
    var nextPage = this.mixCreatorMixesPages[creatorName] + 1;
    await this.loadCreatorMixes(creatorName, nextPage);
  }

  Future loadCreatorMixes(String creatorName, int page) async {
    if (this.mixCreatorMixes[creatorName] == null) {
      this.mixCreatorMixes[creatorName] =
          new BehaviorSubject<List<TobaccoMixSimpleDto>>();
    }

    //Data alredy loded
    if (this.mixCreatorMixesPages[creatorName] != null &&
        this.mixCreatorMixesPages[creatorName] > page) {
      return;
    }

    // add fake data
    var fakeMixes = this.mixCreatorMixes[creatorName].value ??
        new List<TobaccoMixSimpleDto>();
    fakeMixes.addAll(Iterable.generate(_mixPerPage, (_) => null));
    this.mixCreatorMixes[creatorName].add(fakeMixes);

    this.mixCreatorMixesPages[creatorName] = page;
    final mixes = await _apiClient.fetchtobacoMix(
        author: creatorName, page: page, pageSize: _mixPerPage);
    var oldMixes = this.mixCreatorMixes[creatorName].value;
    oldMixes.removeWhere((t) => t == null);
    if (mixes.length < _mixPerPage) {
      fullLoaded.add(creatorName);
    }
    if (oldMixes == null) {
      oldMixes = new List<TobaccoMixSimpleDto>();
    }
    oldMixes.addAll(mixes);
    this.mixCreatorMixes[creatorName].add(oldMixes);
  }

  Future<TobaccoMixSimpleDto> saveMix(TobaccoMixSimpleDto mix) async {
    var savedMix = await App.http.saveMix(mix);
    var myMixes = this.mixCreatorMixes['me'].value;
    myMixes.add(savedMix);

    this.mixCreatorMixes['me'].add(myMixes);
    return savedMix;
  }

  Future deleteMix(TobaccoMixSimpleDto mix) async {
    await App.http.deleteMix(mix);
    var myMixes = this.mixCreatorMixes['me'].value;
    myMixes.removeWhere((m) => m.id == mix.id);

    this.mixCreatorMixes['me'].add(myMixes);
  }

  void loadFavoriteMixes() {
    this.mixCreatorMixes["favorite"] =
        new BehaviorSubject<List<TobaccoMixSimpleDto>>();

    this.mixCreatorMixes["favorite"].add(new List<TobaccoMixSimpleDto>());
  }
}

class MixologyProvider extends InheritedWidget {
  final MixologyBloc mixologyBloc;

  MixologyProvider({
    Key key,
    @required MixologyBloc mixology,
    Widget child,
  })  : assert(mixology != null),
        mixologyBloc = mixology,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MixologyBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MixologyProvider)
              as MixologyProvider)
          .mixologyBloc;
}
