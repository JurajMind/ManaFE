import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/theme/theme_widget.dart';

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
    var theme = MTheme.of(context);
    var smokeSessionBloc = dataProvider.smokeSessionBloc;
    var personBloc = dataProvider.personBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text('Metadata'.toUpperCase(), style: theme.appBarStyle),
        backgroundColor: theme.black,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: theme.pageConstrains,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new ListView(
              children: <Widget>[
                new StreamMetadataItem(
                    bloc: smokeSessionBloc,
                    type: "Pipe",
                    searchType: 'Hookah',
                    ownedAccesory: personBloc.myGear.value != null
                        ? personBloc.myGear.value
                            .where((a) => a.type == 'Hookah')
                            .toList()
                        : new List<PipeAccesorySimpleDto>(),
                    selectFunction: (a) => a.pipe),
                Divider(),
                new StreamMetadataItem(
                    bloc: smokeSessionBloc,
                    type: "Bowl",
                    searchType: 'Bowl',
                    ownedAccesory: personBloc.myGear.value != null
                        ? personBloc.myGear.value
                            .where((a) => a.type == 'Bowl')
                            .toList()
                        : new List<PipeAccesorySimpleDto>(),
                    selectFunction: (a) => a.bowl),
                Divider(),
                new StreamMetadataItem(
                    bloc: smokeSessionBloc,
                    type: "hmd",
                    searchType: 'heatmanagement',
                    ownedAccesory: personBloc.myGear.value != null
                        ? personBloc.myGear.value
                            .where((a) => a.type == 'HeatManagement')
                            .toList()
                        : new List<PipeAccesorySimpleDto>(),
                    selectFunction: (a) => a.heatManagement),
                Divider(),
                new StreamMetadataItem(
                    bloc: smokeSessionBloc,
                    type: "Coals",
                    searchType: 'coal',
                    ownedAccesory: personBloc.myGear.value != null
                        ? personBloc.myGear.value
                            .where((a) => a.type == 'Coal')
                            .toList()
                        : new List<PipeAccesorySimpleDto>(),
                    selectFunction: (a) => a.coal),
                Divider(),
                /* buildCoalsCountItem(smokeSessionBloc),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: OutlineButton.icon(
                    borderSide: BorderSide(color: Colors.white),
                    icon: Icon(
                      Icons.save,
                      color: AppColors.colors[0],
                    ),
                    label: Text('Save preset'),
                    onPressed: () async {},
                  ),
                ),*/
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MButton(
                    icon: Icons.save,
                    width: 200,
                    maxWidth: 400,
                    label: "common.save",
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  StreamBuilder<SmokeSessionMetaDataDto> buildCoalsCountItem(
    SmokeSessionBloc bloc,
  ) {
    return StreamBuilder<SmokeSessionMetaDataDto>(
        initialData: null,
        stream: bloc.smokeSessionMetaData,
        builder: (context, snapshot) => snapshot.data == null
            ? new Container()
            : Row(
                children: <Widget>[
                  ...List.generate(10, (a) => Text(a.toString()))
                ],
              ));
  }
}

class StreamMetadataItem extends StatelessWidget {
  const StreamMetadataItem({
    Key key,
    @required this.bloc,
    @required this.type,
    @required this.searchType,
    @required this.ownedAccesory,
    @required this.selectFunction,
  }) : super(key: key);

  final SmokeSessionBloc bloc;
  final String type;
  final String searchType;
  final List<PipeAccesorySimpleDto> ownedAccesory;
  final Function(SmokeSessionMetaDataDto) selectFunction;

  @override
  Widget build(BuildContext context) {
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
              icon: Icons.refresh,
              pipeAccesories: ownedAccesory),
    );
  }
}
