import 'dart:math';

import 'package:app/Helpers/date_utils.dart' as dateUtils;
import 'package:app/app/app.dart';
import 'package:app/components/SmokeSession/leave_session_button.dart';
import 'package:app/models/SmokeSession/puf_type.dart';
import 'package:app/pages/Statistic/Detail/detail_page_helper.dart';
import 'package:app/services/share.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/openapi.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share/share.dart';

import 'Components/session_metadata_detail.dart';
import 'Components/session_statistic_detail.dart';
import 'Components/smoke_progress_graph.dart';

class SmokeSessioDetailPage extends StatefulWidget {
  final SmokeSessionSimpleDto? session;
  final int? sessionId;
  SmokeSessioDetailPage({
    Key? key,
    this.sessionId,
    this.session,
  }) : super(key: key);

  _SmokeSessioDetailPageState createState() => _SmokeSessioDetailPageState();
}

class _SmokeSessioDetailPageState extends State<SmokeSessioDetailPage> with TickerProviderStateMixin {
  late DateTime start;
  late AnimationController animationController;
  SmokeSessionSimpleDto? session;

  BehaviorSubject<FinishedSessionDataDto> data = new BehaviorSubject<FinishedSessionDataDto>();

  BehaviorSubject<List<SmartHookahModelsDbPuf>> pufs = new BehaviorSubject<List<SmartHookahModelsDbPuf>>();

  List<Duration> inDurations = <Duration>[];
  List<Duration> outDurations = <Duration>[];
  List<Duration> idleDurations = <Duration>[];

  @override
  initState() {
    session = widget.session;
    var id = session?.id ?? widget.sessionId;
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 1000),
    );
    animationController.forward();

    if (widget.session != null) start = new DateTime.fromMillisecondsSinceEpoch(widget.session!.statistic!.start!);
    App.http!.getPufs(id).then((data) {
      this.pufs.add(data);
      this.inDurations = DetailPageHelper.getDuration((p) => p.T == PufType.IN.index, data);
      this.outDurations = DetailPageHelper.getDuration((p) => p.T == PufType.OUT.index, data);
      this.idleDurations = DetailPageHelper.getDuration((p) => p.T == PufType.IDLE.index, data);
    });
    App.http!.getFinishedData(id).then((data) {
      this.data.add(data);
      if (session == null) {
        setState(() {
          session = data.data;
          start = new DateTime.fromMillisecondsSinceEpoch(data.data!.statistic!.start!);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (session == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background.withAlpha(160),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () async {
                var url = await ShareService.sessionShareLink(session!);
                Share.share(url.toString());
              },
            )
          ],
          title: Text(
              "${dateUtils.DateUtils.toStringDate(start)} - ${dateUtils.DateUtils.toStringShortTime(start)} ${session!.sessionId}")),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 800),
          child: ListView(
            children: <Widget>[
              AnimatedBuilder(
                  animation: animationController,
                  builder: (BuildContext context, Widget? child) {
                    return FadeTransition(
                      opacity: animationController,
                      child: Transform(
                        transform: new Matrix4.translationValues(0.0, 30 * (1.0 - animationController.value), 0.0),
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
                                  child: new SessionMetadataDetail(snapshot.data?.metaData)),
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
                  builder: (BuildContext context, Widget? child) {
                    return FadeTransition(
                      opacity: animationController,
                      child: Transform(
                        transform: new Matrix4.translationValues(0.0, 30 * (1.0 - animationController.value), 0.0),
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
                                return new SessionStatisticDetail(inDurations, outDurations, idleDurations, this.data);
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              AnimatedBuilder(
                  animation: animationController,
                  builder: (BuildContext context, Widget? child) {
                    return FadeTransition(
                      opacity: animationController,
                      child: Transform(
                        transform: new Matrix4.translationValues(0.0, 30 * (1.0 - animationController.value), 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 7,
                            color: Colors.black.withOpacity(0.2),
                            child: StreamBuilder<List<SmartHookahModelsDbPuf>>(
                              stream: this.pufs,
                              initialData: null,
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.data == null) return SmokeProgressGraphShimer();
                                return SmokeProgressGraph(snapshot.data);
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 16,
              ),
              StreamBuilder<FinishedSessionDataDto>(
                  stream: this.data,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) return Container();

                    return FractionallySizedBox(
                        widthFactor: 0.7,
                        child: LeaveSessionButton(
                          sessionId: widget.session!.id,
                          assigned: snapshot.data!.assigned,
                          callback: (value) {
                            var old = this.data.value;
                            old.assigned = value;
                            this.data.add(old);
                          },
                        ));
                  }),
              const SizedBox(height: 100)
            ],
          ),
        ),
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
              Text('Heart rate monitor', style: Theme.of(context).textTheme.titleLarge),
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
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    haveData ? '${60 + random.nextInt(12)} bpm' : '--- bpm',
                    style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.red),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Buzz HR',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    haveData ? '${80 + random.nextInt(30)} bpm' : '--- bpm',
                    style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.red),
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
