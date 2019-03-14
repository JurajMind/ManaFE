import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Pickers/smoke_color_wheel.dart';
import 'package:app/components/snap_scroll.dart';
import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/SmokeSession/animation_list.dart';
import 'package:app/pages/SmokeSession/metadata_botom_sheet.dart';
import 'package:app/pages/SmokeSession/pipe_accesory_widget.dart';
import 'package:app/pages/SmokeSession/puff_timer.dart';

import 'package:app/pages/SmokeSession/tobacco_widget.dart';
import 'package:app/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:openapi/api.dart';

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
  DataProvider dataProvider;
  StopWatches stopWatches;
  PufTimerDependencies dependencies;
  int action = 0;
  ScrollController scrollController;
  ScrollPhysics physics;

  @override
  void initState() {
    stopWatches = new StopWatches(new Stopwatch(), new Stopwatch());

    scrollController = new ScrollController(
      initialScrollOffset: 600.0,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dataProvider = DataProvider.getData(context);
    dependencies = new PufTimerDependencies(
        stopWatches.pufStopwatch, this.dataProvider.smokeSessionBloc);
    dataProvider.smokeSessionBloc.joinSession(widget.sessionId);
    dependencies.smokeSessionBloc = dataProvider.smokeSessionBloc;
  }

  @override
  dispose() {
    this.dependencies.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    StreamBuilder<SmokeSessionMetaDataDto> tobaccoMetaDataBuilder =
        new StreamBuilder(
      stream: dataProvider.smokeSessionBloc.smokeSessionMetaData,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.data == null) {
          return CircularProgressIndicator();
        }
        return Column(
          children: <Widget>[
            TobaccoWidget(
              tobacco: asyncSnapshot.data.tobacco,
              tobacoMix: asyncSnapshot.data.tobaccoMix,
              smokeSessionBloc: dataProvider.smokeSessionBloc,
            )
          ],
        );
      },
    );

    StreamBuilder<SmokeSessionMetaDataDto> metadataBuilder = new StreamBuilder(
      stream: dataProvider.smokeSessionBloc.smokeSessionMetaData,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.data == null) {
          return CircularProgressIndicator();
        }
        return Column(
          children: <Widget>[
            PipeAccesoryWidget(
              accesory: asyncSnapshot.data.pipe,
              type: 'Pipe',
              dataProvider: dataProvider,
            ),
            PipeAccesoryWidget(
                accesory: asyncSnapshot.data.bowl,
                type: 'Bowl',
                dataProvider: dataProvider),
            PipeAccesoryWidget(
                accesory: asyncSnapshot.data.heatManagement,
                type: 'H.M.S',
                dataProvider: dataProvider),
            PipeAccesoryWidget(
                accesory: asyncSnapshot.data.coal,
                type: 'Coals',
                dataProvider: dataProvider),
            emptyPipeAccesoryWidget(asyncSnapshot.data)
          ],
        );
      },
    );

    StreamBuilder<SmokeStatisticDataModel> statisticBuilder = new StreamBuilder(
      stream: dataProvider.smokeSessionBloc.smokeStatistic,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.data == null) {
          return CircularProgressIndicator();
        }

        if (asyncSnapshot.data.duration == null) {
          return Text('NoData');
        }
        var duration = asyncSnapshot.data.duration;
        var durationString =
            '${duration.inHours}:${duration.inMinutes % 60}:${duration.inSeconds % 100}';

        var longestString =
            '${asyncSnapshot.data.longestPuf.inMinutes == 0 ? "" : asyncSnapshot.data.longestPuf.inMinutes.toString() + ':'}${asyncSnapshot.data.longestPuf.inSeconds}.${asyncSnapshot.data.longestPuf.inMilliseconds.toString()}';
        return asyncSnapshot.data != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new HeaderItem(
                    label: 'Puf count',
                    data: asyncSnapshot.data.pufCount.toString(),
                  ),
                  Column(
                    children: <Widget>[
                      Text('Last puf (sec)',
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

    return Column(
      children: <Widget>[
        new Expanded(
          child: CustomScrollView(
            physics: new SnapScrollPhysic(snaps: [
              size.height * 0.75,
              size.width + 40,
              size.height * 0.75 + 40
            ]),
            controller: scrollController,
            shrinkWrap: false,
            slivers: <Widget>[
              new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
                  AnimationsPicker(),
                  SizedBox(
                    height: 30.0,
                    child: Center(
                      child: Icon(Icons.arrow_drop_up),
                    ),
                  ),
                  GestureDetector(
                    child: SizedBox(
                        height: size.width,
                        child: StreamBuilder<StandSettings>(
                            stream: dataProvider.smokeSessionBloc.standSettings,
                            builder: (context, snapshot) {
                              return SmokeColorWheel(
                                onColorChanged: (color) {
                                  dataProvider.smokeSessionBloc
                                      .setColor(color.toColor());
                                },
                                color: snapshot?.data?.idle?.color,
                              );
                            })),
                  ),
                  SizedBox(
                    height: 30.0,
                    child: Center(
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                  SizedBox(
                    height: size.height,
                    child: Column(
                      children: <Widget>[
                        Hero(
                            tag: "${widget.sessionId}_session",
                            child: statisticBuilder),
                        tobaccoMetaDataBuilder,
                        metadataBuilder,
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: new RoundedButton(
                            child: Text('REVIEW'),
                            onTap: () {},
                            buttonColor: Colors.transparent,
                            borderWidth: 1.0,
                            bottomMargin: 1.0,
                            height: 40.0,
                            width: (MediaQuery.of(context).size.width) * 0.8,
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
        )
      ],
    );
  }

  emptyPipeAccesoryWidget(SmokeSessionMetaDataDto md) {
    if (md.pipe == null ||
        md.bowl == null ||
        md.coal == null ||
        md.heatManagement == null)
      return RoundedButton(
        child: Text('Fill metadata'),
        width: 200.0,
        borderWidth: 1.0,
        bottomMargin: 1.0,
        height: 50.0,
        onTap: () async {
          showBottomModal();
        },
      );
    return Container();
  }

  void staticModal() {
    scaffoldKey.currentState
        .showBottomSheet((context) {
          return new Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.greenAccent,
            child: new Center(
              child: new Text("Hi BottomSheet"),
            ),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {});
          }
        });
  }

  void showBottomModal() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new MetadataBottomSheet(
            dataProvider: this.dataProvider,
          );
        }).then((value) {
      this.dataProvider.smokeSessionBloc.saveMetaData();
    });
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
