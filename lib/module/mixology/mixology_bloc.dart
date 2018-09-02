import 'dart:async';
import 'dart:math';

import 'package:app/app/app.dart';
import 'package:app/module/mixology/mixology_page.dart';
import 'package:app/module/mixology/mixology_slice.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/services/http.service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class MixologyBloc {
  static const _mixPerPage = 10;

  final _indexController = PublishSubject<int>();

  final ApiClient _apiClient = App.http;

  final _mixes = <int, MixologyPage>{};

  final _mixesBeinggRequested = Set<int>();

  final _sliceSubject = BehaviorSubject<MixologySlice>();

  final _loadingSubject = BehaviorSubject<bool>();

  int maxInt = 0x7fffffff;

  bool haveNext = true;

  MixologyBloc() {
    _indexController.stream
        // Don't try to update too frequently.
        .bufferTime(Duration(milliseconds: 500))
        // Don't update when there is no need.
        .where((batch) => batch.isNotEmpty)
        .listen(_handleIndexes);
  }

  Sink<int> get index => _indexController.sink;

  Stream<MixologySlice> get slice => _sliceSubject.stream;

  Stream<bool> get loading => _loadingSubject.stream;

  int _getPageStartFromIndex(int index) => (index ~/ _mixPerPage) * _mixPerPage;

  void _handleIndexes(List<int> indexes) {
    if (!haveNext) {
      return;
    }

    final int minIndex = indexes.fold(maxInt, min);
    final int maxIndex = indexes.fold(-1, max);

    final minPageIndex = _getPageStartFromIndex(minIndex);
    final maxPageIndex = _getPageStartFromIndex(maxIndex);

    for (int i = minPageIndex; i <= maxPageIndex; i += _mixPerPage) {
      if (_mixes.containsKey(i)) continue;
      if (_mixesBeinggRequested.contains(i)) continue;

      _mixesBeinggRequested.add(i);
      _requestMix(i).then((page) {
        _handleNewMixes(page, i, page.count == _mixPerPage);
      });
    }
  }

  void _handleNewMixes(MixologyPage page, int index, bool haveNext) {
    _mixes[index] = page;
    _mixesBeinggRequested.remove(index);
    this.haveNext = haveNext;
    _sendNewSlice(haveNext);
  }

  Future<MixologyPage> _requestMix(int index) async {
    var page = (index / _mixPerPage).round();
    print('page $page pageSize:$_mixPerPage');
    final mixes =
        await _apiClient.fetchtobacoMix(page: page, pageSize: _mixPerPage);
    print('Finish page $page pageSize:$_mixPerPage');
    return MixologyPage(mixes, index);
  }

  void _sendNewSlice(bool hasNext) {
    final pages = _mixes.values.toList(growable: false);

    final slice = MixologySlice(pages, hasNext);
    _sliceSubject.add(slice);
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
