import 'package:app/components/Backgrund.dart';
import 'package:app/helpers.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/pages/enterSmokeSesionCode.page.dart';
import 'package:flutter/material.dart';
import 'package:carousel/carousel.dart';
import 'package:web_socket_channel/io.dart';

class StartSmokeSessionPage extends StatefulWidget {
  final double topWidgetHeight = 200.0;





 var channel;

main() async { 

}
 
  @override
  StartSmokeSessionPageState createState() {
    main();
    return new StartSmokeSessionPageState();
  }

  
}

class StartSmokeSessionPageState extends State<StartSmokeSessionPage> {

  void _openAddEntryDialog(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new EnterSmokeSessionCode();
      },
    fullscreenDialog: true
  ));
}
  @override
  Widget build(BuildContext context) {

    
  final smokeSessionBloc = DataProvider.getSmokeSession(context);

    return new Container(
      child: new Stack(
        children: <Widget>[
          new Positioned(
            child: new Icon(Icons.refresh),
            left: 10.0,
            top: 20.0,
          ),
          new Positioned(
            child: new CircleAvatar(
                radius: getCircleRadius(context),
                backgroundColor: Colors.green,
                child: GestureDetector(
                    onTap: () {
                    _openAddEntryDialog(context);
                    },
                    child: new Container(
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            'START',
                            style: new TextStyle(
                                fontSize: 40.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          new Icon(
                            Icons.play_arrow,
                            size: 60.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ))),
            left: (MediaQuery.of(context).size.width / 2) - getCircleRadius(context),
            top: widget.topWidgetHeight - getCircleRadius(context),
          ),
          new Positioned(
            top: 300.0,
            child: Container(
              width: (MediaQuery.of(context).size.width),
              height: 200.0,
              child: FlatButton(
                child: Text('test'),
                onPressed: () {
                  smokeSessionBloc.testChannel('d');
                },
              )
            ),
          )
        ],
      ),
    );
  }
}
