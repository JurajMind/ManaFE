import 'package:app/app/app.dart';
import 'package:app/components/snap_scroll.dart';
import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/models/SmokeSession/smoke_session_meta_data.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/animation_list.dart';
import 'package:app/pages/SmokeSession/metadata_botom_sheet.dart';
import 'package:app/pages/SmokeSession/pipe_accesory_widget.dart';
import 'package:app/pages/SmokeSession/puff_timer.dart';
import 'package:app/pages/SmokeSession/smoke_color_wheel.dart';
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
  ScrollPhysics physics;

  @override
  void initState() {
    stopWatches = new StopWatches(new Stopwatch(), new Stopwatch());
    dependencies = new Dependencies(stopwatch: stopWatches.pufStopwatch);
    scrollController = new ScrollController(
      initialScrollOffset: 1000.0,
    );
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
    var size = MediaQuery.of(context).size;
    StreamBuilder<int> builder = new StreamBuilder(
      stream: smokeSessionBloc.smokeState,
      builder: (context, asyncSnapshot) {
        return asyncSnapshot.data != 0
            ? new CircularProgressIndicator()
            : Container();
      },
    );

    StreamBuilder<SmokeSessionMetaData> tobaccoMetaDataBuilder =
        new StreamBuilder(
      stream: smokeSessionBloc.smokeSessionMetaData,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.data == null) {
          return CircularProgressIndicator();
        }
        return Column(
          children: <Widget>[
            TobaccoWidget(
              tobacco: asyncSnapshot.data.tobacco,
            )
          ],
        );
      },
    );

    StreamBuilder<SmokeSessionMetaDataSelection> metadataBuilder =
        new StreamBuilder(
      stream: smokeSessionBloc.smokeSessionDataSelection,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.data == null) {
          return CircularProgressIndicator();
        }
        return Column(
          children: <Widget>[
            PipeAccesoryWidget(
              accesory: asyncSnapshot.data.pipe,
              type: 'Pipe',
              smokeSessionBloc: smokeSessionBloc,
            ),
            PipeAccesoryWidget(
                accesory: asyncSnapshot.data.bowl,
                type: 'Bowl',
                smokeSessionBloc: smokeSessionBloc),
            PipeAccesoryWidget(
                accesory: asyncSnapshot.data.heatManager,
                type: 'H.M.S',
                smokeSessionBloc: smokeSessionBloc),
            PipeAccesoryWidget(
                accesory: asyncSnapshot.data.coal,
                type: 'Coals',
                smokeSessionBloc: smokeSessionBloc),
            emptyPipeAccesoryWidget(asyncSnapshot.data)
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

        var longestString =
            '${asyncSnapshot.data.longestPuf.inMinutes}:${asyncSnapshot.data.longestPuf.inSeconds}:${asyncSnapshot.data.longestPuf.inMilliseconds}';
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
                      Text(longestString)
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
          new Expanded(
            child: CustomScrollView(
              controller: scrollController,
              physics: new SnapScrollPhysic(snaps: [
                size.height * 0.75,
                size.width + 40,
                size.height * 0.75 + 40
              ]),
              shrinkWrap: false,
              slivers: <Widget>[
                new SliverList(
                  delegate: new SliverChildListDelegate(<Widget>[
                    AnimationsPicker(),
                    GestureDetector(
                      onPanUpdate: (value) => scrollController
                          .jumpTo(scrollController.offset - value.delta.dy),
                      child: Container(
                        color: Colors.transparent,
                        height: 40.0,
                        width: size.width,
                        child: Center(
                            child: Text(
                          '...',
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.w700),
                        )),
                      ),
                    ),
                    SizedBox(
                        height: size.width,
                        child: SmokeColorWheel(
                          onColorChanged: (color) {
                            smokeSessionBloc.setColor(color.toColor());
                          },
                          color: HSVColor.fromColor(Colors.red),
                        )),
                    GestureDetector(
                      onPanUpdate: (value) => scrollController
                          .jumpTo(scrollController.offset - value.delta.dy),
                      child: Container(
                        color: Colors.transparent,
                        height: 40.0,
                        width: size.width,
                        child: Center(
                            child: Text(
                          '...',
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.w700),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.75,
                      child: ListView(
                        children: <Widget>[
                          statisticBuilder,
                          tobaccoMetaDataBuilder,
                          metadataBuilder,
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  emptyPipeAccesoryWidget(SmokeSessionMetaDataSelection md) {
    if (md.pipe == null ||
        md.bowl == null ||
        md.coal == null ||
        md.heatManager == null)
      return RaisedButton(
        child: Text('Fill metadata'),
        onPressed: () async {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return new MetadataBottomSheet(
                    smokeSessionBloc: this.smokeSessionBloc);
              }).then((value) {
            this.smokeSessionBloc.saveMetaData();
          });
        },
      );
    return Container();
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
