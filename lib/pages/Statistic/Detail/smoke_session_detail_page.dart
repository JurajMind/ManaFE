import 'dart:math';

import 'package:app/Helpers/date_utils.dart';
import 'package:app/app/app.dart';
import 'package:app/components/SmokeSession/tobacco_widget.dart';
import 'package:app/models/SmokeSession/puf_type.dart';
import 'package:app/pages/SmokeSession/Components/pipe_accesory_widget.dart';
import 'package:app/pages/Statistic/Detail/detail_page_helper.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';
import 'package:rxdart/rxdart.dart';

import 'Components/session_metadata_detail.dart';
import 'Components/session_statistic_detail.dart';
import 'Components/smoke_progress_graph.dart';

class SmokeSessioDetailPage extends StatefulWidget {
  final SmokeSessionSimpleDto session;
  SmokeSessioDetailPage(this.session, {Key key}) : super(key: key);

  _SmokeSessioDetailPageState createState() => _SmokeSessioDetailPageState();
}

class _SmokeSessioDetailPageState extends State<SmokeSessioDetailPage>
    with TickerProviderStateMixin {
  DateTime start;
  AnimationController animationController;

  BehaviorSubject<FinishedSessionDataDto> data =
      new BehaviorSubject<FinishedSessionDataDto>();

  BehaviorSubject<List<SmartHookahModelsDbPuf>> pufs =
      new BehaviorSubject<List<SmartHookahModelsDbPuf>>();

  List<Duration> inDurations = new List<Duration>();
  List<Duration> outDurations = new List<Duration>();
  List<Duration> idleDurations = new List<Duration>();

  @override
  initState() {
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 1000),
    );
    animationController.forward();

    start =
        new DateTime.fromMillisecondsSinceEpoch(widget.session.statistic.start);
    var id = widget.session.id;
    App.http.getPufs(id).then((data) {
      this.pufs.add(data);
      this.inDurations =
          DetailPageHelper.getDuration((p) => p.T == PufType.IN.index, data);
      this.outDurations =
          DetailPageHelper.getDuration((p) => p.T == PufType.OUT.index, data);
      this.idleDurations =
          DetailPageHelper.getDuration((p) => p.T == PufType.IDLE.index, data);
    });
    App.http.getFinishedData(id).then((data) => this.data.add(data));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor.withAlpha(160),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            )
          ],
          title: Text(
              "${DateUtils.toStringDate(start)} - ${DateUtils.toStringShortTime(start)} ${widget.session.sessionId}")),
      body: ListView(
        children: <Widget>[
          AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                return FadeTransition(
                  opacity: animationController,
                  child: Transform(
                    transform: new Matrix4.translationValues(
                        0.0, 30 * (1.0 - animationController.value), 0.0),
                    child: StreamBuilder<FinishedSessionDataDto>(
                      stream: this.data,
                      initialData: null,
                      builder: (BuildContext context, snapshot) {                    
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              elevation: 7,
                              color: Colors.black.withOpacity(0.2),
                              margin: EdgeInsets.all(4),
                              child: new SessionMetadataDetail(
                                  snapshot?.data?.metaData)),
                        );
                      },
                    ),
                  ),
                );
              }),
          SizedBox(
            height: 16,
          ),
          AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                return FadeTransition(
                  opacity: animationController,
                  child: Transform(
                    transform: new Matrix4.translationValues(
                        0.0, 30 * (1.0 - animationController.value), 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 7,
                        color: Colors.black.withOpacity(0.2),
                        child: StreamBuilder<List<SmartHookahModelsDbPuf>>(
                          stream: this.pufs,
                          initialData: null,
                          builder: (BuildContext context, snapshot) {
                            if (snapshot.data == null) {
                              return SessionStatisticShimer();
                            }
                            return new SessionStatisticDetail(
                                new Collection(inDurations),
                                new Collection(outDurations),
                                new Collection(idleDurations),
                                this.data);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              }),
                   AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                return FadeTransition(
                  opacity: animationController,
                  child: Transform(
                    transform: new Matrix4.translationValues(
                        0.0, 30 * (1.0 - animationController.value), 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 7,
                        color: Colors.black.withOpacity(0.2),
                        child: StreamBuilder<List<SmartHookahModelsDbPuf>>(
                          stream: this.pufs,
                          initialData: null,
                          builder: (BuildContext context, snapshot) {
                         return SmokeProgressGraph(
                          snapshot.data
                         );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              }),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}


class HrWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var random = new Random();
    var haveData = random.nextBool();
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Heart rate monitor',
                  style: Theme.of(context).textTheme.display1),
              SizedBox(width: 8),
              Icon(FontAwesomeIcons.heartbeat)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Resting HR',
                    style: Theme.of(context).textTheme.display2,
                  ),
                  Text(
                    haveData ? '${60 + random.nextInt(12)} bpm' : '--- bpm',
                    style: Theme.of(context)
                        .textTheme
                        .display2
                        .apply(color: Colors.red),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Buzz HR',
                    style: Theme.of(context).textTheme.display2,
                  ),
                  Text(
                    haveData ? '${80 + random.nextInt(30)} bpm' : '--- bpm',
                    style: Theme.of(context)
                        .textTheme
                        .display2
                        .apply(color: Colors.red),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SessionStatisticGraph extends StatefulWidget {
  final BehaviorSubject<List<SmartHookahModelsDbPuf>> pufs;

  SessionStatisticGraph({Key key, this.pufs}) : super(key: key);

  _SessionStatisticGraphState createState() => _SessionStatisticGraphState();
}

class _SessionStatisticGraphState extends State<SessionStatisticGraph> {
  List<List<SmartHookahModelsDbPuf>> data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<SmartHookahModelsDbPuf>>(
        stream: widget.pufs,
        initialData: null,
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == null) return Container();

          var processData =
              DetailPageHelper.createHistogram(snapshot.data, 300);
          return Container(
            child: Column(
              children: <Widget>[],
            ),
          );
        },
      ),
    );
  }
}
