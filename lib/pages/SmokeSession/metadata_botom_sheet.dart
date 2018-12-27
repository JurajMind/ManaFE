import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/models/SmokeSession/smoke_session_meta_data.dart';
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
      height: 800.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new ListView(
          children: <Widget>[
            buildMetadataItem(
                smokeSessionBloc,
                "Pipe",
                'Hookah',
                Icons.refresh,
                smokeSessionBloc.myGear.value != null
                    ? smokeSessionBloc.myGear.value
                        .where((a) => a.type == 'Hookah')
                        .toList()
                    : new List<PipeAccesory>(),
                (a) => a.pipe),
            buildMetadataItem(
                smokeSessionBloc,
                "Bowl",
                'Bowl',
                Icons.refresh,
                smokeSessionBloc.myGear.value != null
                    ? smokeSessionBloc.myGear.value
                        .where((a) => a.type == 'Bowl')
                        .toList()
                    : new List<PipeAccesory>(),
                (a) => a.bowl),
            buildMetadataItem(
                smokeSessionBloc,
                "Heat managment",
                'heatmanagement',
                Icons.refresh,
                smokeSessionBloc.myGear.value != null
                    ? smokeSessionBloc.myGear.value
                        .where((a) => a.type == 'HeatManagement')
                        .toList()
                    : new List<PipeAccesory>(),
                (a) => a.heatManager),
            buildMetadataItem(
                smokeSessionBloc,
                "Coals",
                'coal',
                Icons.account_box,
                smokeSessionBloc.myGear.value != null
                    ? smokeSessionBloc.myGear.value
                        .where((a) => a.type == 'Coal')
                        .toList()
                    : new List<PipeAccesory>(),
                (a) => a.coal),
          ],
        ),
      ),
    );
  }

  StreamBuilder<SmokeSessionMetaDataSelection> buildMetadataItem(
      SmokeSessionBloc bloc,
      String type,
      String searchType,
      IconData icon,
      List<PipeAccesory> ownedAccesory,
      Function(SmokeSessionMetaDataSelection) selectFunction) {
    return StreamBuilder<SmokeSessionMetaDataSelection>(
      initialData: null,
      stream: bloc.smokeSessionDataSelection,
      builder: (context, snapshot) => snapshot.data == null
          ? new Container()
          : new MetadataItem(
              bloc: bloc,
              type: type,
              searchType: searchType,
              selectedAccesories: selectFunction(snapshot.data),
              icon: icon,
              pipeAccesories: ownedAccesory),
    );
  }
}
