import 'package:app/components/Common/big_select.dart';
import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/models/SmokeSession/tobacco_edit_model.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/feature_mix.dart';
import 'package:app/module/mixology/mix_card_expanded_shimmer.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/pages/Mixology/mix_detail_page.dart';
import 'package:app/pages/SmokeSession/tobacco_edit.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class MixologyList extends StatefulWidget {
  @override
  MixologyListState createState() {
    return new MixologyListState();
  }
}

class MixologyListState extends State<MixologyList> {
  int curentView = 0;

  static const Map<int, String> labels = {
    0: 'My mixes',
    1: 'Featured mix creators',
    2: 'Mixes wizzard'
  };

  Future showTobaccoDialog(
      {BuildContext context, MixologyBloc mixologyBloc}) async {
    TobaccoEditModel tobacco = await Navigator.of(context)
        .push(new MaterialPageRoute<TobaccoEditModel>(
            builder: (BuildContext context) {
              return new TobaccoEditWidget(
                tobaccoWeight: 0,
                tobacco: null,
                mix: null,
              );
            },
            fullscreenDialog: true));
    if (tobacco.mix != null && tobacco.mix.tobaccos.length > 0)
      mixologyBloc.saveMix(tobacco.mix).then((onValue) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MixDetailPage(mix: onValue)));
      });
  }

  @override
  Widget build(BuildContext context) {
    final mixologyBloc = DataProvider.getMixology(context);

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50.0,
            child: AppBar(
              actions: <Widget>[  
                curentView == 0
                    ? IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => showTobaccoDialog(
                            context: context, mixologyBloc: mixologyBloc),
                      )
                    : Container()
              ],
              title: Center(
                child: BigSelect(curentView: curentView,labels:labels,onSelected: (val){setState(() {
                 curentView =  val;
                });},)
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
          ),
          new Expanded(
            child: getContent(mixologyBloc),
          )
        ],
      ),
    );
  }

  Widget getContent(MixologyBloc mixologyBloc) {
    switch (curentView) {
      case 0:
        return new PaggingMixListView(
            mixologyBloc: mixologyBloc, mixCreator: 'me');
      case 1:
        return FeatureMixCreator();
      case 2:
        return Placeholder();
    }
    return Placeholder();
  }
}

class PaggingMixListView extends StatelessWidget {
  const PaggingMixListView({
    Key key,
    @required this.mixologyBloc,
    this.mixCreator,
  }) : super(key: key);

  final MixologyBloc mixologyBloc;
  final String mixCreator;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TobaccoMixSimpleDto>>(
        stream: mixologyBloc.mixCreatorMixes[mixCreator],
        initialData: null,
        builder: (context, snapshot) {
          return LazyLoadScrollView(
            onEndOfPage: () {
              if (!snapshot.data.contains(null))
                mixologyBloc.loadCreatorMixesNextPage(mixCreator);
            },
            child: ListView.builder(
              itemCount: snapshot.data?.length ?? 10,
              itemBuilder: (context, index) {
                if (snapshot.data != null && snapshot.data[index] != null) {
                  return MixCardExpanded(tobaccoMix: snapshot.data[index]);
                } else {
                  return MixCardExpandedShimmer();
                }
              },
            ),
          );
        });
  }
}
