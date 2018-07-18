import 'dart:async';
import 'dart:math';

import 'package:app/models/tobacco_mix.dart';
import 'package:app/module/mixology/mixology_page.dart';
import 'package:app/module/mixology/mixology_slice.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/services/authorization.dart';
import 'package:app/services/http.service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';

class MixologyBloc {
  static const _mixPerPage = 10;

  final _indexController = PublishSubject<int>();

  final ApiClient _apiClient = new ApiClient();

  final _mixes = <int, MixologyPage>{};

  final _mixesBeinggRequested = Set<int>();

  final _sliceSubject = BehaviorSubject<MixologySlice>();

  int maxInt = 0x7fffffff;

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

  int _getPageStartFromIndex(int index) => (index ~/ _mixPerPage) * _mixPerPage;

  void _handleIndexes(List<int> indexes) {
    final int minIndex = indexes.fold(maxInt, min);
    final int maxIndex = indexes.fold(-1, max);

    final minPageIndex = _getPageStartFromIndex(minIndex);
    final maxPageIndex = _getPageStartFromIndex(maxIndex);

    for (int i = minPageIndex; i <= maxPageIndex; i += _mixPerPage) {
      if (_mixes.containsKey(i)) continue;
      if (_mixesBeinggRequested.contains(i)) continue;

      _mixesBeinggRequested.add(i);
      _requestMix(i).then((page) => _handleNewMixes(page, i, page.count != 0));
    }

    // Remove pages too far from current scroll position.
    _mixes.removeWhere((pageIndex, _) =>
        pageIndex < minPageIndex - _mixPerPage ||
        pageIndex > maxPageIndex + _mixPerPage);
  }

  void _handleNewMixes(MixologyPage page, int index, bool haveNext) {
    _mixes[index] = page;
    _mixesBeinggRequested.remove(index);
    _sendNewSlice(haveNext);

    if (!haveNext) {
      _mixes.removeWhere((pageIndex, _) => pageIndex > _mixes.length - 20);
    }
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

class DataProvider extends InheritedWidget {
  final MixologyBloc mixologyBloc;
  final SmokeSessionBloc smokeSessionBloc;

  DataProvider({
    Key key,
    @required MixologyBloc mixology,
    @required SmokeSessionBloc smokeSession,
    Widget child,
  })  : assert(mixology != null),
        mixologyBloc = mixology,
        smokeSessionBloc = smokeSession,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MixologyBloc getMixology(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(DataProvider) as DataProvider)
          .mixologyBloc;

  static SmokeSessionBloc getSmokeSession(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(DataProvider) as DataProvider)
          .smokeSessionBloc;
}
