import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/metadata_botom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class PipeAccesoryWidget extends StatelessWidget {
  final PipeAccesorySimpleDto accesory;
  final String type;
  final DataProvider dataProvider;
  const PipeAccesoryWidget(
      {Key key, this.accesory, this.type, this.dataProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (accesory == null) {
      Text('No data');
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(right: 4),
                    height: 30,
                    child: Extensions.defaultTypePicture(this.type)),
                Text(
                  this.type,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: this.accesory?.id != null
                ? Text("${accesory.brand} ${accesory.name}")
                : Text('No data'),
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
                      this.dataProvider.smokeSessionBloc.saveMetaData();
                    });
                  })
        ],
      ),
    );
  }
}
