import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/metadata_botom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PipeAccesoryWidget extends StatelessWidget {
  final PipeAccesorySimple accesory;
  final String type;
  final SmokeSessionBloc smokeSessionBloc;
  const PipeAccesoryWidget(
      {Key key, this.accesory, this.type, this.smokeSessionBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              this.type,
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            flex: 1,
          ),
          Expanded(
            child: this.accesory != null
                ? Text("${accesory.brand} ${accesory.name}")
                : Text('No data'),
            flex: 2,
          ),
          IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () async {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return new MetadataBottomSheet(
                          smokeSessionBloc: this.smokeSessionBloc);
                    }).then((value) {
                  this.smokeSessionBloc.saveMetaData();
                });
              })
        ],
      ),
    );
  }
}
