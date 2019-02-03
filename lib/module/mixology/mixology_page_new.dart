import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mix_card_expanded_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class CreatorMixPage extends StatelessWidget {
  final MixCreator creator;

  const CreatorMixPage({Key key, this.creator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mixologyBloc = DataProvider.getData(context).mixologyBloc;
    var mixes = mixologyBloc.mixCreatorMixes[creator.name];

    return StreamBuilder<List<TobaccoMixSimpleDto>>(
        stream: mixes,
        initialData: null,
        builder: (context, snapshot) {
          return SafeArea(
              child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
                child: AppBar(
                  title: Text(creator.displayName),
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                ),
              ),
              Expanded(
                child: snapshot.data == null
                    ? ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return MixCardExpandedShimmer();
                        },
                      )
                    : ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          var item = snapshot.data[index];

                          return MixCardExpanded(tobaccoMix: item);
                        }),
              ),
            ],
          ));
        });
  }
}
