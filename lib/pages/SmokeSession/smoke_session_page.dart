import 'dart:async';

import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/models/SmokeSession/smoke_session_meta_data.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/pipe_accesory_widget.dart';
import 'package:app/pages/SmokeSession/tobacco_widget.dart';
import 'package:flutter/material.dart';

class SmokeSessionPage extends StatefulWidget {
  final String sessionId;
  SmokeSessionPage({this.sessionId});

  @override
  State<StatefulWidget> createState() {
    return new _SmokeSessionPage();
  }
}

class StopWatches {
  StopWatches(this.pufStopwatch, this.sessionStopwatch);
  
    final Stopwatch pufStopwatch;
    final Stopwatch sessionStopwatch;
}

class _SmokeSessionPage extends State<SmokeSessionPage> {
  SmokeSessionBloc smokeSessionBloc;
  StopWatches stopWatches;
  Dependencies dependencies;
  int action = 0;
  @override
  void initState() {
    stopWatches = new StopWatches(new Stopwatch(),new Stopwatch());
    dependencies = new Dependencies(stopwatch: stopWatches.pufStopwatch);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    smokeSessionBloc = DataProvider.getSmokeSession(context);
    smokeSessionBloc.joinSession(widget.sessionId);

    smokeSessionBloc.smokeState.stream.listen( (data){
      setState(() {
              action = data;
            });
      if(data == 0){
        this.stopWatches.pufStopwatch.reset();
      }
      else{
        this.stopWatches.pufStopwatch.start();
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
            PipeAccesoryWidget(accesory: asyncSnapshot.data.pipe, type: 'Pipe'),
            PipeAccesoryWidget(accesory: asyncSnapshot.data.bowl, type: 'Bowl'),
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
            '${duration.inHours}:${duration.inMinutes}:${duration.inSeconds % 10}';
        return asyncSnapshot.data != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                new HeaderItem(
                    label: 'Puff count',
                    data: asyncSnapshot.data.pufCount.toString(),
                  ),
                  Column(
                    children: <Widget>[
                      Text('Last puff( sec )', style: TextStyle(color: Colors.grey)),
                      action != 0 ? new PuffTimeText(dependencies: dependencies,completeTime: asyncSnapshot.data.lastPufTime.toString()): Text(asyncSnapshot.data.lastPuf.toString().padRight(3,'0'),style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                    ],
                  ),                  
                  new HeaderItem(
                    label: 'Duration',
                    data: durationString,
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
          new Expanded(            
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[builder, statisticBuilder, metadataBuilder, 
              RaisedButton(child: Text('Start'), onPressed: () {this.stopWatches.pufStopwatch.start(); setState(() {
                              action = 1;
                            });}),
              RaisedButton(child: Text('Stop'), onPressed: () {this.stopWatches.pufStopwatch.start();this.stopWatches.pufStopwatch.reset(); setState(() {
                              action = 0;
                            });}),
              
              ],
              
            ),
          )
        ],
      ),
    );
  }
}

class HeaderItem extends StatelessWidget {
  final String label;
  final String data;
  const HeaderItem({Key key, this.label, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Column(
        children: <Widget>[
          Text(label, style: _labelStyle()),
          Text(
            data,
            style: _textStyle(),
          ),
        ],
      ),
      flex: 1,
    );
  }

  TextStyle _textStyle() {
    return new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  }

  TextStyle _labelStyle() {
    return new TextStyle(color: Colors.grey);
  }
}

class PuffTimeText extends StatefulWidget {
  PuffTimeText({this.dependencies,this.completeTime});
  final Dependencies dependencies;
  final String completeTime;
  @override
  State<StatefulWidget> createState() {
    return new PuffTimeState();
  }
}

class PuffTimeState extends State<PuffTimeText> {  
  Timer timer;
  int milliseconds;

  void initState() {
    timer = new Timer.periodic(
        new Duration(milliseconds: widget.dependencies.timerMillisecondsRefreshRate),
        callback);
    super.initState();
  }

  void callback(Timer timer) {
    if (milliseconds != widget.dependencies.stopwatch.elapsedMilliseconds) {
      milliseconds = widget.dependencies.stopwatch.elapsedMilliseconds;
      final int hundreds = (milliseconds / 10).truncate();
      final int seconds = (hundreds / 100).truncate();
      final int minutes = (seconds / 60).truncate();
      final ElapsedTime elapsedTime = new ElapsedTime(
        hundreds: hundreds,
        seconds: seconds,
        minutes: minutes,
      );
      for (final listener in widget.dependencies.timerListeners) {
        listener(elapsedTime);
      }
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return new  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          new RepaintBoundary(
            child: new SizedBox(
              height: 30.0,
              child: new MinutesAndSeconds(dependencies: widget.dependencies),
            ),
          ),
          new RepaintBoundary(
            child: new SizedBox(
              height: 30.0,
              child: new Hundreds(dependencies: widget.dependencies),
            ),
          ),
      ],
    );
 
}
}

class Dependencies {

Dependencies({this.stopwatch});

  final List<ValueChanged<ElapsedTime>> timerListeners =
      <ValueChanged<ElapsedTime>>[];
  final TextStyle textStyle =
      const TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold);
  final Stopwatch stopwatch;
  final int timerMillisecondsRefreshRate = 30;
}

class ElapsedTime {
  final int hundreds;
  final int seconds;
  final int minutes;

  ElapsedTime({
    this.hundreds,
    this.seconds,
    this.minutes,
  });
}

class Hundreds extends StatefulWidget {
  Hundreds({this.dependencies});
  final Dependencies dependencies;

  HundredsState createState() => new HundredsState(dependencies: dependencies);
}

class HundredsState extends State<Hundreds> {
  HundredsState({this.dependencies});
  final Dependencies dependencies;

  int hundreds = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.hundreds != hundreds) {
      setState(() {
        hundreds = elapsed.hundreds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    return new Text(hundredsStr, style: dependencies.textStyle);
  }
}

class MinutesAndSeconds extends StatefulWidget {
  MinutesAndSeconds({this.dependencies});
  final Dependencies dependencies;

  MinutesAndSecondsState createState() => new MinutesAndSecondsState(dependencies: dependencies);
}

class MinutesAndSecondsState extends State<MinutesAndSeconds> {
  MinutesAndSecondsState({this.dependencies});
  final Dependencies dependencies;
  
  int seconds = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.seconds != seconds) {
      setState(() {
        
        seconds = elapsed.seconds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {    
    String secondsStr = (seconds).toString().padLeft(1, '0');
    return new Text('$secondsStr.', style: dependencies.textStyle);
  }
}
