import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/feature_mix.dart';
import 'package:app/module/mixology/mix_card_expanded_shimmer.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

abstract class MainPage {}

class MixologyList extends StatefulWidget {
  @override
  MixologyListState createState() {
    return new MixologyListState();
  }
}

class MixologyListState extends State<MixologyList> {
  int curentView = 0;
  static const _loadingSpace = 10;
  static const Map<int, String> labels = {
    0: 'My mixes',
    1: 'Featured mix creators',
    2: 'Mixes wizzard'
  };

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Center(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      mixTypeSelector(context, 0),
                      mixTypeSelector(context, 1),
                      mixTypeSelector(context, 2),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  InkWell mixTypeSelector(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          curentView = index;
        });
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(labels[index].toUpperCase(),
            style: Theme.of(context).textTheme.display1),
      ),
    );
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
              title: Center(
                child: InkWell(
                  onTap: () => _showDialog(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(labels[curentView]),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
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
