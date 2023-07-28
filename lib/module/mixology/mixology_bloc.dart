import 'dart:async';

import 'package:app/app/app.dart';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:openapi/openapi.dart';
import 'package:rxdart/rxdart.dart';

class MixologyBloc {
  static const _mixPerPage = 10;
  Box? _cache;
  Future<Box?> get cache async {
    if (_cache == null) {
      _cache = await Hive.openBox('mixes');
    }
    return _cache;
  }

  final _apiClient = App.http;

  final mixCreator = BehaviorSubject<List<FeatureMixCreatorSimpleDto>>();

  final Map<String?, BehaviorSubject<List<TobaccoMixSimpleDto?>>> mixCreatorMixes =
      new Map<String?, BehaviorSubject<List<TobaccoMixSimpleDto?>>>();

  BehaviorSubject<List<TobaccoMixSimpleDto?>>? getCreatorMixes(String key) {
    var result = mixCreatorMixes[key];
    if (result != null) return result;

    mixCreatorMixes[key] = new BehaviorSubject<List<TobaccoMixSimpleDto?>>();
    return mixCreatorMixes[key];
  }

  final Map<String?, int> mixCreatorMixesPages = new Map<String?, int>();
  final List<String?> fullLoaded = <String?>[];
  int maxInt = 0x7fffffff;

  bool haveNext = true;

  static final MixologyBloc _instance = new MixologyBloc._();

  factory MixologyBloc() => MixologyBloc._instance;

  MixologyBloc._() {
    //loadMixCreator();
    loadCreatorMixes('me', 0);
    loadFakeCreatorMixes('favorite', 0);
  }

  Future loadMixCreator() async {
    final creators = await _apiClient!.getMixCreator();
    this.mixCreator.add(creators);
  }

  Future addToFavorite(TobaccoMixSimpleDto mix) async {
    App.http!.voteMix(mix.id, 1);
    String favorite = "favorite";
    if (this.mixCreatorMixes[favorite] == null) {
      this.mixCreatorMixes[favorite] = new BehaviorSubject<List<TobaccoMixSimpleDto?>>();
    }

    var old = this.mixCreatorMixes[favorite]!.value;
    if (old == null) old = <TobaccoMixSimpleDto?>[];
    old.add(mix);
    this.mixCreatorMixes[favorite]!.add(old);
  }

  Future removeFromFavorite(TobaccoMixSimpleDto mix) async {
    App.http!.voteMix(mix.id, -1);
    String favorite = "favorite";
    if (this.mixCreatorMixes[favorite] == null) {
      this.mixCreatorMixes[favorite] = new BehaviorSubject<List<TobaccoMixSimpleDto?>>();
    }

    var old = this.mixCreatorMixes[favorite]!.value;
    if (old == null) old = <TobaccoMixSimpleDto?>[];
    old.remove(mix);
    this.mixCreatorMixes[favorite]!.add(old);
  }

  Future loadCreatorMixesNextPage(String? creatorName, bool featured) async {
    if (fullLoaded.contains(creatorName)) {
      return;
    }

    if (this.mixCreatorMixesPages[creatorName] == null) {
      this.mixCreatorMixesPages[creatorName] = -1;
    }
    var nextPage = this.mixCreatorMixesPages[creatorName]! + 1;
    await this.loadCreatorMixes(creatorName, nextPage, featured: featured);
  }

  Future loadCreatorMixesRefresh(String creatorName, bool featured) async {
    fullLoaded.remove(creatorName);
    if (this.mixCreatorMixesPages[creatorName] == null) {
      this.mixCreatorMixesPages[creatorName] = 0;
    } else {
      this.mixCreatorMixesPages[creatorName] = 0;
    }

    var nextPage = 0;
    this.mixCreatorMixes[creatorName]!.add(<TobaccoMixSimpleDto?>[]);
    await this.loadCreatorMixes(creatorName, nextPage, featured: featured);
  }

  Future<List<TobaccoMixSimpleDto?>?> loadMixesFromCache(String key) async {
    try {
      var fromCache = (await cache)!.get(key);
      if (fromCache == null) {
        return null;
      }
      if (fromCache is List<dynamic>) return fromCache.map((e) => e as TobaccoMixSimpleDto?).toList();

      return null;
    } catch (e) {
      print('error');
      print(e);
      return null;
    }
  }

  Future<void> storeMixesToCache(String key, List<TobaccoMixSimpleDto?> mix) async {
    (await cache)!.put(key, mix);
  }

  Future<void> cleanMixesFromCache(
    String key,
  ) async {
    var keys = (await cache)?.keys.where((e) => e is String && e.contains(key)) ?? [];
    (await cache)!.deleteAll(keys);
  }

  Future loadFakeCreatorMixes(String? creatorName, int page) async {
    if (this.mixCreatorMixes[creatorName] == null) {
      this.mixCreatorMixes[creatorName] = new BehaviorSubject<List<TobaccoMixSimpleDto?>>();
    }

    //Data alredy loded
    if (this.mixCreatorMixesPages[creatorName] != null && this.mixCreatorMixesPages[creatorName]! > page) {
      return;
    }

    var fakeMixes = this.mixCreatorMixes[creatorName]!.valueOrNull ?? <TobaccoMixSimpleDto?>[];
    var fakes = List<TobaccoMixSimpleDto?>.generate(_mixPerPage, (_) => null);

    fakeMixes.addAll(fakes.toList());

    this.mixCreatorMixes[creatorName]!.add(fakeMixes);
  }

  Future<void> refreshCreatorMixes(String? creatorName) async {
    this.mixCreatorMixes[creatorName]?.add([]);
    await this.cleanMixesFromCache(creatorName!);
    this.mixCreatorMixesPages[creatorName] = 0;
    await loadCreatorMixes(creatorName, 0);
  }

  Future loadCreatorMixes(String? creatorName, int page, {bool featured = false}) async {
    loadFakeCreatorMixes(creatorName, page);
    var cacheKey = '${creatorName}_$page';
    if (page == 0) {
      var cacheKey = '${creatorName}_$page';
      loadMixesFromCache(cacheKey).then((value) {
        if (value != null) {
          this.mixCreatorMixes[creatorName]!.add(value);
        }
      });
    }

    this.mixCreatorMixesPages[creatorName] = page;
    final mixes =
        await _apiClient!.fetchtobacoMix(featured: featured, author: creatorName, page: page, pageSize: _mixPerPage);
    await storeMixesToCache(cacheKey, mixes);
    var oldMixes = this.mixCreatorMixes[creatorName]!.value;
    oldMixes.removeWhere((t) => t == null);
    if (mixes.length < _mixPerPage) {
      fullLoaded.add(creatorName);
    }
    if (oldMixes == null) {
      oldMixes = <TobaccoMixSimpleDto?>[];
    }
    oldMixes.addAll(mixes);
    this.mixCreatorMixes[creatorName]!.add(oldMixes);
  }

  Future<TobaccoMixSimpleDto> saveMix(TobaccoMixSimpleDto? mix) async {
    var savedMix = await App.http!.saveMix(mix);
    var myMixes = this.mixCreatorMixes['me']!.value;
    myMixes.add(savedMix);

    this.mixCreatorMixes['me']!.add(myMixes);
    return savedMix;
  }

  Future deleteMix(TobaccoMixSimpleDto mix) async {
    await App.http!.deleteMix(mix);
    var myMixes = this.mixCreatorMixes['me']!.value;
    myMixes.removeWhere((m) => m!.id == mix.id);

    this.mixCreatorMixes['me']!.add(myMixes);
  }

  void loadFavoriteMixes() {
    this.mixCreatorMixes["favorite"] = new BehaviorSubject<List<TobaccoMixSimpleDto?>>();

    this.mixCreatorMixes["favorite"]!.add(<TobaccoMixSimpleDto?>[]);
  }
}

class MixologyProvider extends InheritedWidget {
  final MixologyBloc mixologyBloc;

  MixologyProvider({
    Key? key,
    required MixologyBloc mixology,
    required Widget child,
  })  : mixologyBloc = mixology,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MixologyBloc of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MixologyProvider>()!.mixologyBloc;
}
