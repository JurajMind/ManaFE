import 'package:app/Helpers/date_utils.dart';
import 'package:app/app/app.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Common/since_timer.dart';
import 'package:app/components/Pickers/smoke_color_wheel.dart';
import 'package:app/components/snap_scroll.dart';
import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/SmokeSession/Components/animation_list.dart';
import 'package:app/pages/SmokeSession/Components/pipe_accesory_widget.dart';
import 'package:app/pages/SmokeSession/Components/puff_timer.dart';
import 'package:app/pages/SmokeSession/Experimental/experimental_page.dart';
import 'package:app/pages/SmokeSession/metadata_botom_sheet.dart';

import 'package:app/pages/SmokeSession/tobacco_widget.dart';
import 'package:app/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:openapi/api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

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
    dataProvider.smokeSessionBloc.joinSession(widget.sessionId);
  }

  @override
  dispose() {
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
            TobaccoSessionWidget(
              tobacco: asyncSnapshot.data.tobacco,
              tobaccoMix: asyncSnapshot.data.tobaccoMix,
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
        var durationString =
            DateUtils.toStringDuration(asyncSnapshot.data.smokeDuration);

        var longestString =
            DateUtils.toSecondDuration(asyncSnapshot.data.longestPuf);

        var start = asyncSnapshot.data.start;
        return asyncSnapshot.data != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new HeaderItem(
                    label: 'Puf count',
                    data: asyncSnapshot.data.pufCount.toString(),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('Last puf (sec)',
                            style: TextStyle(color: Colors.grey)),
                        new PuffTimeText(
                            completeTime: asyncSnapshot.data.toString()),
                        Text(longestString)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('Durations', style: TextStyle(color: Colors.grey)),
                        SinceTimer(
                          start: start,
                          pufCount: asyncSnapshot.data.pufCount,
                          style: Theme.of(context).textTheme.body2,
                        ),
                        Text(
                          durationString,
                        )
                      ],
                    ),
                  ),
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
                              if (snapshot.data == null) {
                                return Container();
                              }
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
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: new RoundedButton(
                            child: Text('MORE'),
                            onTap: () => showMoreModal(),
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

  void showMoreModal() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          var code = DataProvider.getData(context).smokeSessionBloc.hookahCode;
          return Container(
            height: 1000,
            child: new Column(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(FontAwesomeIcons.share),
                    title: new Text('Share'),
                    onTap: () => Share.share(
                        'check out my website https://example.com')),
                new ListTile(
                  leading: new Icon(FontAwesomeIcons.vial),
                  title: new Text('Experiments'),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ExperimentalPage())),
                ),
                new ListTile(
                  leading: new Icon(Icons.refresh),
                  title: new Text('Restart stand'),
                  onTap: () => _restartDialog(code),
                ),
                new ListTile(
                  leading: new Icon(FontAwesomeIcons.powerOff),
                  title: new Text('End session'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        }).then((value) {});
  }

  void _restartDialog(String code) {
    // flutter defined function
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Restart device?"),
          content: new Text("Do you want restart this device ?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                "Restart",
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            )
          ],
        );
      },
    ).then((value) {
      if (value) {
        App.http.restartDevice(code);
      }
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
            style: Theme.of(context).textTheme.body2,
          ),
        ],
      ),
      flex: 1,
    );
  }

  TextStyle _labelStyle() {
    return new TextStyle(color: Colors.grey);
  }
}
