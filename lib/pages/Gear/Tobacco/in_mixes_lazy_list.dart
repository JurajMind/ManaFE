import 'package:app/app/app.dart';
import 'package:app/components/LazyScroll/lazy_load_scroll_view.dart';
import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/module/mixology/mix_card_expanded_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class InMixesLazyList extends StatefulWidget {
  final PipeAccesorySimpleDto tobacco;
  final List<TobaccoMixSimpleDto> initInMixes;

  const InMixesLazyList({Key key, this.tobacco, this.initInMixes})
      : super(key: key);

  @override
  _InMixesLazyListState createState() => _InMixesLazyListState();
}

class _InMixesLazyListState extends State<InMixesLazyList> {
  BehaviorSubject<List<TobaccoMixSimpleDto>> inMixes;
  bool endOfPage = false;
  int maxPage = 0;
  int pageSize = 10;

  bool loadMore(List<TobaccoMixSimpleDto> mixes) {
    if (mixes.last == null) return false;
    return !endOfPage;
  }

  Future<dynamic> loadMoreMixes(List<TobaccoMixSimpleDto> mixes,
      {bool refresh = false}) async {
    if (!loadMore(mixes)) return true;

    var mock = inMixes.value;
    mock.addAll(List.generate(10, (_) => null));
    inMixes.add(mock);
    if (refresh) {
      maxPage = 0;
      inMixes.add(List.generate(10, (index) => null));
    } else {
      maxPage++;
    }

    var data = await App.http.getTobaccoInMix(widget.tobacco.id, page: maxPage);

    if (data.length < pageSize) endOfPage = true;

    var oldData = inMixes.value;
    oldData.removeWhere((test) => test == null);
    oldData.addAll(data);
    inMixes.add(oldData);
    return true;
  }

  @override
  void initState() {
    inMixes = new BehaviorSubject<List<TobaccoMixSimpleDto>>.seeded(
        widget.initInMixes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            Text(widget.tobacco.brand + ' '),
            Text(widget.tobacco.name),
          ],
        ),
      ),
      body: StreamBuilder<List<TobaccoMixSimpleDto>>(
          stream: inMixes,
          initialData: null,
          builder: (context, snapshot) {
            return LazyLoadScrollView(
              onRefresh: () => loadMoreMixes(snapshot.data, refresh: true),
              onEndOfPage: () => loadMoreMixes(snapshot.data),
              child: ListView.builder(
                  itemCount: (snapshot?.data?.length ?? 0) + 1,
                  itemBuilder: (context, index) {
                    if (index >= snapshot.data.length) {
                      return SizedBox(
                        height: 100,
                      );
                    }

                    var item = snapshot.data[index];
                    if (item == null) {
                      return Container(
                          width: 20,
                          child: MixCardExpandedShimmer(
                            move: false,
                          ));
                    } else {
                      return MixCardExpanded(
                          tobaccoMix: snapshot.data[index],
                          highlightId: widget.tobacco.id);
                    }
                  }),
            );
          }),
    );
  }
}
