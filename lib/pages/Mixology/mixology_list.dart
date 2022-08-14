import 'package:app/components/Common/big_select.dart';
import 'package:app/components/LazyScroll/lazy_load_scroll_view.dart';
import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/models/SmokeSession/tobacco_edit_model.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/feature_mix.dart';
import 'package:app/module/mixology/mix_card_expanded_shimmer.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/pages/Mixology/mix_detail_page.dart';
import 'package:app/pages/SmokeSession/tobacco_edit.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import 'mix_search.page.dart';

class MixologyList extends StatefulWidget {
  @override
  MixologyListState createState() {
    return new MixologyListState();
  }
}

class MixologyListState extends State<MixologyList> {
  int curentView = 0;

  static const Map<int, String> labels = {0: 'mix.my_mixes', 1: 'mix.featured_creators', 2: 'mix.favorite_mixes'};

  Future showTobaccoDialog({required BuildContext context, MixologyBloc? mixologyBloc}) async {
    TobaccoEditModel tobacco = await (Navigator.of(context).push(new MaterialPageRoute<TobaccoEditModel>(
        builder: (BuildContext context) {
          return new TobaccoEditWidget(
            tobaccoWeight: 0,
            tobacco: null,
            mix: null,
          );
        },
        fullscreenDialog: true)) as Future<TobaccoEditModel>);
    if (tobacco.mix != null && tobacco.mix!.tobaccos!.length > 0)
      mixologyBloc!.saveMix(tobacco.mix).then((onValue) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MixDetailPage(mix: onValue)));
      });
  }

  @override
  Widget build(BuildContext context) {
    final mixologyBloc = DataProvider.getMixology(context);

    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 55,
              child: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MixSearchPage(),
                        ))),
                actions: <Widget>[
                  curentView == 0
                      ? IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => showTobaccoDialog(context: context, mixologyBloc: mixologyBloc),
                        )
                      : Container()
                ],
                title: Center(
                    child: BigSelect(
                  curentView: curentView,
                  labels: labels,
                  onSelected: (val) {
                    setState(() {
                      curentView = val;
                    });
                  },
                )),
                backgroundColor: Colors.transparent,
                centerTitle: true,
              ),
            ),
            Expanded(child: getContent(mixologyBloc)),
          ],
        ),
      ),
    );
  }

  Widget getContent(MixologyBloc mixologyBloc) {
    switch (curentView) {
      case 0:
        return PaggingMixListView(
          mixologyBloc: mixologyBloc,
          mixCreator: 'me',
          showTobaccoDialog: () => showTobaccoDialog(context: context, mixologyBloc: mixologyBloc),
        );
      case 1:
        {
          mixologyBloc.loadMixCreator();
          return FeatureMixCreator();
        }

      case 2:
        {
          mixologyBloc.loadCreatorMixes('favorite', 0);
          return PaggingMixListView(mixologyBloc: mixologyBloc, mixCreator: 'favorite');
        }
    }
    return Placeholder();
  }
}

class PaggingMixListView extends StatefulWidget {
  const PaggingMixListView({
    Key? key,
    required this.mixologyBloc,
    this.mixCreator,
    this.showTobaccoDialog,
  }) : super(key: key);

  final MixologyBloc mixologyBloc;
  final String? mixCreator;
  final VoidCallback? showTobaccoDialog;

  @override
  _PaggingMixListViewState createState() => _PaggingMixListViewState();
}

class _PaggingMixListViewState extends State<PaggingMixListView> {
  Widget righPanel = Container();
  int? selectedMix;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TobaccoMixSimpleDto?>>(
        stream: widget.mixologyBloc.mixCreatorMixes[widget.mixCreator],
        initialData: null,
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.data!.length == 0) {
            return Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Is empty here :(',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 8,
                ),
                if (widget.mixCreator == "me") ...{
                  Text(
                    'Try add new mix',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  IconButton(icon: Icon(Icons.add), onPressed: () => widget.showTobaccoDialog!())
                },
                if (widget.mixCreator == "favorite")
                  Text(
                    'Try add your mix to favorite',
                    style: Theme.of(context).textTheme.headline6,
                  )
              ],
            ));
          }
          var itemCount = 10;
          if (snapshot.data?.length != null) {
            itemCount = snapshot.data!.length + 1;
          }

          var shortestSide = MediaQuery.of(context).size.shortestSide;
          var useTabletLayout = shortestSide > 600;

          return LazyLoadScrollView(
            onRefresh: () =>
                Future.delayed(Duration.zero, () => {widget.mixologyBloc.loadCreatorMixes(widget.mixCreator, 0)}),
            onEndOfPage: () {
              if (!snapshot.data!.contains(null))
                widget.mixologyBloc.loadCreatorMixesNextPage(widget.mixCreator, false);
            },
            child: useTabletLayout
                ? Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: buildListView(itemCount, snapshot, onTap: (value) {
                          setState(() {
                            this.selectedMix = value.id;
                            this.righPanel = new MixDetailPage(
                              mix: value,
                              key: UniqueKey(),
                              noHero: true,
                            );
                          });
                        }, selectedMixId: this.selectedMix),
                      ),
                      Expanded(
                        flex: 1,
                        child: righPanel,
                      )
                    ],
                  )
                : buildListView(itemCount, snapshot),
          );
        });
  }

  ListView buildListView(int itemCount, AsyncSnapshot<List<TobaccoMixSimpleDto?>> snapshot,
      {ValueChanged<TobaccoMixSimpleDto>? onTap, int? selectedMixId}) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (index == snapshot.data!.length) {
          return const SizedBox(height: 100);
        }

        if (snapshot.data != null && snapshot.data![index] != null) {
          var selectedMix = snapshot.data![index]!;
          return MixCardExpanded(
            tobaccoMix: selectedMix,
            onTap: onTap,
            selected: selectedMix.id == selectedMixId,
          );
        } else {
          return MixCardExpandedShimmer();
        }
      },
    );
  }
}
