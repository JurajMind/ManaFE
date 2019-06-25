import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';

import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

import 'Components/metadata_item.dart';

class MetadataBottomSheet extends StatelessWidget {
  const MetadataBottomSheet({
    Key key,
    @required this.dataProvider,
  }) : super(key: key);

  final DataProvider dataProvider;

  @override
  Widget build(BuildContext context) {
    var smokeSessionBloc = dataProvider.smokeSessionBloc;
    var personBloc = dataProvider.personBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text('Metadata'),
        backgroundColor: AppColors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new ListView(
          children: <Widget>[
            buildMetadataItem(
                smokeSessionBloc,
                "Pipe",
                'Hookah',
                Icons.refresh,
                personBloc.myGear.value != null
                    ? personBloc.myGear.value
                        .where((a) => a.type == 'Hookah')
                        .toList()
                    : new List<PipeAccesorySimpleDto>(),
                (a) => a.pipe),
            buildMetadataItem(
                smokeSessionBloc,
                "Bowl",
                'Bowl',
                Icons.refresh,
                personBloc.myGear.value != null
                    ? personBloc.myGear.value
                        .where((a) => a.type == 'Bowl')
                        .toList()
                    : new List<PipeAccesorySimpleDto>(),
                (a) => a.bowl),
            buildMetadataItem(
                smokeSessionBloc,
                "Heat managment",
                'heatmanagement',
                Icons.refresh,
                personBloc.myGear.value != null
                    ? personBloc.myGear.value
                        .where((a) => a.type == 'HeatManagement')
                        .toList()
                    : new List<PipeAccesorySimpleDto>(),
                (a) => a.heatManagement),
            buildMetadataItem(
                smokeSessionBloc,
                "Coals",
                'coal',
                Icons.account_box,
                personBloc.myGear.value != null
                    ? personBloc.myGear.value
                        .where((a) => a.type == 'Coal')
                        .toList()
                    : new List<PipeAccesorySimpleDto>(),
                (a) => a.coal),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  StreamBuilder<SmokeSessionMetaDataDto> buildMetadataItem(
      SmokeSessionBloc bloc,
      String type,
      String searchType,
      IconData icon,
      List<PipeAccesorySimpleDto> ownedAccesory,
      Function(SmokeSessionMetaDataDto) selectFunction) {
    return StreamBuilder<SmokeSessionMetaDataDto>(
      initialData: null,
      stream: bloc.smokeSessionMetaData,
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
