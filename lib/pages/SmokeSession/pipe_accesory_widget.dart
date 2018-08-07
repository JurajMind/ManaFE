import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PipeAccesoryWidget extends StatelessWidget {
  final PipeAccesory accesory;
  final String type;
  const PipeAccesoryWidget({Key key, this.accesory,this.type}) : super(key: key);

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
            child: this.accesory != null ? Text("${accesory.brand} ${accesory.name}") : Text('No data'),
            flex: 2,
          ),
          IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return new Container(
                          child: new Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: new Text(
                                  'This is the modal bottom sheet. Click anywhere to dismiss.',
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 24.0))));
                    });
              })
        ],
      ),
    );
  }
}
