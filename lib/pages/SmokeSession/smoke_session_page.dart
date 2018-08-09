import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/models/SmokeSession/smoke_session_meta_data.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/pipe_accesory_widget.dart';
import 'package:app/pages/SmokeSession/puff_timer.dart';
import 'package:app/pages/SmokeSession/tobacco_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
  ScrollController scrollController;

  @override
  void initState() {
    stopWatches = new StopWatches(new Stopwatch(), new Stopwatch());
    dependencies = new Dependencies(stopwatch: stopWatches.pufStopwatch);
    scrollController = new ScrollController(initialScrollOffset: 200.0);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    smokeSessionBloc = DataProvider.getSmokeSession(context);
    smokeSessionBloc.joinSession(widget.sessionId);
    dependencies.smokeSessionBloc = smokeSessionBloc;
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
                      Text('Last puff( sec )',
                          style: TextStyle(color: Colors.grey)),
                      new PuffTimeText(
                          dependencies: dependencies,
                          completeTime: asyncSnapshot.data.toString()),
                      Text(asyncSnapshot.data.longestPuf.toString())
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
            child: SingleChildScrollView(
              controller: scrollController,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new SmokeColorWheel(),
                  builder,
                  statisticBuilder,
                  metadataBuilder,
                  Container(
                    height: 200.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SmokeColorWheel extends StatefulWidget {
  const SmokeColorWheel({
    Key key,
  }) : super(key: key);

  @override
  SmokeColorWheelState createState() {
    return new SmokeColorWheelState();
  }
}

class SmokeColorWheelState extends State<SmokeColorWheel> {
  List<Color> rainbow;
 Offset position = new Offset(100.0, 100.0);
  double top;
  double bottom;

  @override
  void initState() {
    rainbow = new List<Color>.generate(
        255,
        (int index) => HSVColor
            .fromAHSV(index + .0, 255.0, index + .0, index + .0)
            .toColor()); // [0, 1, 4]

    top = 100.0;
    bottom = 100.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 30.0),
      child: Stack(children: <Widget>[
        new Container(
          height: width - 40,
          width: width - 40,
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage("images/color_wheel.png"),
                  fit: BoxFit.fill),
              borderRadius: new BorderRadius.all(Radius.circular(width / 2)),
              border: new Border.all(
                  color: const Color.fromRGBO(221, 221, 221, 1.0), width: 2.5)),
        ),
        new Positioned(
          top: position.dy,
          left: position.dx,
          child: Draggable(
            feedback: Container(
              child: colorPickerCircle(),
            ),
            onDraggableCanceled: (velocity, offset){
               setState(() => position = offset);
            },
            childWhenDragging: Container(),
            child: colorPickerCircle(),
          ),
        )
      ]),
    );
  }

  SizedBox colorPickerCircle() {
    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(Radius.circular(25.0)),
            border: new Border.all(
                color: const Color.fromRGBO(221, 221, 221, 1.0), width: 4.0)),
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
