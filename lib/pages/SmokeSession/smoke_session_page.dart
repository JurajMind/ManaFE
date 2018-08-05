import 'package:app/models/SmokeSession/smoke_session_meta_data.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/pipe_accesory_widget.dart';
import 'package:app/pages/SmokeSession/tobacco_widget.dart';
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
      builder: (context, asyncSnapshot) {
        return asyncSnapshot.data != 0
            ? new CircularProgressIndicator()
            : Container();
      },
    );

    StreamBuilder<SmokeSessionMetaData> metadataBuilder = new StreamBuilder(
      stream: smokeSessionBloc.smokeSessionMetaData,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.data == null) {
          return CircularProgressIndicator();
        }
        return Column(
          children: <Widget>[
            TobaccoWidget(
                tobacco: asyncSnapshot.data.tobacco,
                tobacoMix: asyncSnapshot.data.mix),
            PipeAccesoryWidget(accesory: asyncSnapshot.data.pipe),
            PipeAccesoryWidget(accesory: asyncSnapshot.data.bowl),
          ],
        );
      },
    );

    StreamBuilder<SmokeStatisticDataModel> statisticBuilder = new StreamBuilder(
      stream: smokeSessionBloc.smokeStatistic,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.data == null) {
          return CircularProgressIndicator();
        }

        if (asyncSnapshot.data.duration == null) {
          return Text('NoData');
        }
        var duration = asyncSnapshot.data.duration;
        var durationString =
            '${duration.inHours}:${duration.inMinutes}:${duration.inSeconds}';
        return asyncSnapshot.data != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      Text('Puffs', style: _labelStyle()),
                      Text(
                        asyncSnapshot.data.pufCount.toString(),
                        style: _textStyle(),
                      ),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      Text('Last puff(sec)', style: _labelStyle()),
                      Text(
                        asyncSnapshot.data.lastPuf.toString(),
                        style: _textStyle(),
                      ),
                      Text(asyncSnapshot.data.longestPuf.inSeconds.toString())
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Duration', style: _labelStyle()),
                      Text(
                        durationString,
                        style: _textStyle(),
                      )
                    ],
                  )
                ],
              )
            : Text('No data');
      },
    );
    return new Container(
      child: Column(
        children: <Widget>[
          new AppBar(
            backgroundColor: Colors.transparent,
            actions: <Widget>[Icon(Icons.arrow_drop_down_circle)],
          ),
          new Container(
            height: 300.0,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[builder, statisticBuilder, metadataBuilder],
            ),
          )
        ],
      ),
    );
  }

  TextStyle _textStyle() {
    return new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  }

  TextStyle _labelStyle() {
    return new TextStyle(color: Colors.grey);
  }
}
