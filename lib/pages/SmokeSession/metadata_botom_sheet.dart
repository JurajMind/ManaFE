import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/metadata_item.dart';
import 'package:flutter/material.dart';

class MetadataBottomSheet extends StatelessWidget {
  const MetadataBottomSheet({
    Key key,
    @required this.smokeSessionBloc,
  }) : super(key: key);

  final SmokeSessionBloc smokeSessionBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new ListView(
          children: <Widget>[
            new MetadataItem(
              type: "Pipe",
              searchType: 'Hookah',
              icon: Icons.refresh,
              pipeAccesories: smokeSessionBloc.myGear.value != null
                  ? smokeSessionBloc.myGear.value
                      .where((a) => a.type == 'Hookah')
                      .toList()
                  : new List<PipeAccesory>(),
              selected: smokeSessionBloc.smokeSessionMetaData.value.pipeId,
            ),
            new MetadataItem(
              type: "Bowl",
              searchType: 'Bowl',
              icon: Icons.home,
              pipeAccesories: smokeSessionBloc.myGear.value != null
                  ? smokeSessionBloc.myGear.value
                      .where((a) => a.type == 'Bowl')
                      .take(5)
                      .toList()
                  : new List<PipeAccesory>(),
              selected: smokeSessionBloc.smokeSessionMetaData.value.pipeId,
            ),
            new MetadataItem(
              type: "Heat managment",
              searchType: 'heatmanagement',
              icon: Icons.account_box,
              pipeAccesories: smokeSessionBloc.myGear.value != null
                  ? smokeSessionBloc.myGear.value
                      .where((a) => a.type == 'HeatManagement')
                      .take(5)
                      .toList()
                  : new List<PipeAccesory>(),
            ),
            new MetadataItem(
              type: "Coals",
              searchType: 'Coals',
              icon: Icons.account_box,
              pipeAccesories: smokeSessionBloc.myGear.value != null
                  ? smokeSessionBloc.myGear.value
                      .where((a) => a.type == 'Coals')
                      .take(5)
                      .toList()
                  : new List<PipeAccesory>(),
            ),
          ],
        ),
      ),
    );
  }
}
