import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/material.dart';

class SmokeSessionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SmokeSessionPage();
  }
}

class _SmokeSessionPage extends State<SmokeSessionPage> {
  @override
  Widget build(BuildContext context) {

  final smokeSessionBloc = DataProvider.getSmokeSession(context);
StreamBuilder<int> builder = new StreamBuilder(
  stream: smokeSessionBloc.smokeState,
  builder: (context,asyncSnapshot){
    return new Text(asyncSnapshot.data.toString());
  },
);

StreamBuilder<SmokeStatisticDataModel> statisticBuilder = new StreamBuilder(
  stream: smokeSessionBloc.smokeStatistic,
  builder: (context,asyncSnapshot){
    return asyncSnapshot.data !=null ? Column(
      children: <Widget>[
        Text(asyncSnapshot.data.pufCount.toString()),
          Text(asyncSnapshot.data.lastPuf.toString()),
            Text(asyncSnapshot.data.duration.toString())
      ],
    ) : Text('No data');
  },
);
    return new Container(
      
      child: Column(
        children: <Widget>[
            new AppBar(
        title: new Text('Smoke session'),
        backgroundColor: Colors.transparent,
      ),
         new Container(
           height: 300.0,
           child: new Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
                new Text('You are in Gear page!'),
                builder,
                statisticBuilder
             ],
           ),
         )

        ],
      ),
    );
  }
}