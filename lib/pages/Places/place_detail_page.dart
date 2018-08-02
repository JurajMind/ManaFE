import 'package:app/models/Places/place.dart';
import 'package:flutter/material.dart';

class PlaceDetailPage extends StatefulWidget {

final Place place;
PlaceDetailPage({this.place});

  @override
  State<StatefulWidget> createState() {
    return new _PlaceDetailState(place);
  }
}

class _PlaceDetailState extends State<PlaceDetailPage> {
  
  final Place place;
  _PlaceDetailState(this.place);

  @override
  FocusNode _focusNode = new FocusNode();
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('This is detail page of ${place.name}'),
          new TextFormField(
            focusNode:_focusNode,
          ),
          RaisedButton(
            child: Text('Test'),
            onPressed: () => Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("Sending Message"),
                )),
          ),
          RaisedButton(
            child: Text('Test'),
            onPressed: () => Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("Sending Message"),
                )),
          )
        ],
      )),
    );
  }
}
