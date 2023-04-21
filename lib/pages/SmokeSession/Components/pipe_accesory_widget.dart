import 'package:app/main.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/Gear/pipe_accesory_page.dart';
import 'package:app/pages/SmokeSession/metadata_botom_sheet.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class PipeAccesoryWidget extends StatelessWidget {
  final PipeAccesorySimpleDto? accesory;
  final String? type;
  final DataProvider? dataProvider;
  const PipeAccesoryWidget({Key? key, this.accesory, this.type, this.dataProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (accesory == null) {
      Text(AppTranslations.of(context)!.text('smoke_session.no_data'));
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(right: 4), height: 30, child: Extensions.defaultTypePicture(this.type!)),
                Text(
                  AppTranslations.of(context)!.text("gear.${this.type}"),
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                if (accesory == null) return;
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
                  return PipeAccesoryPage(pipeAccesory: accesory);
                }));
              },
              child: this.accesory?.id != null
                  ? Text("${accesory!.brand} ${accesory!.name}", style: Theme.of(context).textTheme.bodyMedium)
                  : Text(AppTranslations.of(context)!.text('smoke_session.no_data'),
                      style: Theme.of(context).textTheme.bodyMedium),
            ),
            flex: 2,
          ),
          this.dataProvider == null
              ? Container()
              : IconButton(
                  icon: Icon(Icons.add_box),
                  onPressed: () async {
                    Navigator.of(context)
                        .push(new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new MetadataBottomSheet(
                                dataProvider: dataProvider,
                              );
                            },
                            fullscreenDialog: true))
                        .then((value) {
                      getIt.get<SmokeSessionBloc>().saveMetaData();
                    });
                  })
        ],
      ),
    );
  }
}
