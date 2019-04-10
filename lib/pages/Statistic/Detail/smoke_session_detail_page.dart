import 'package:app/Helpers/date_utils.dart';
import 'package:app/app/app.dart';
import 'package:app/components/Common/labeled_value.dart';
import 'package:app/models/SmokeSession/puf_type.dart';
import 'package:app/pages/SmokeSession/pipe_accesory_widget.dart';
import 'package:app/pages/Statistic/Detail/detail_page_helper.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';
import 'package:rxdart/rxdart.dart';

class SmokeSessioDetailPage extends StatefulWidget {
  final SmokeSessionSimpleDto session;
  SmokeSessioDetailPage(this.session, {Key key}) : super(key: key);

  _SmokeSessioDetailPageState createState() => _SmokeSessioDetailPageState();
}

class _SmokeSessioDetailPageState extends State<SmokeSessioDetailPage> {
  DateTime start;

  BehaviorSubject<FinishedSessionDataDto> data =
      new BehaviorSubject<FinishedSessionDataDto>();

  BehaviorSubject<List<SmartHookahModelsDbPuf>> pufs =
      new BehaviorSubject<List<SmartHookahModelsDbPuf>>();

  List<Duration> inDurations = new List<Duration>();
  List<Duration> outDurations = new List<Duration>();
  List<Duration> idleDurations = new List<Duration>();

  @override
  initState() {
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
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
          StreamBuilder<FinishedSessionDataDto>(
            stream: this.data,
            initialData: null,
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == null) return Container();
              return Column(children: <Widget>[
                new SessionMetadataDetail(snapshot.data.metaData)
              ]);
            },
          ),
          StreamBuilder<List<SmartHookahModelsDbPuf>>(
            stream: this.pufs,
            initialData: null,
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == null) return Container();
              return Column(
                children: <Widget>[
                  StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return new SessionStatisticDetail(
                            new Collection(inDurations),
                            new Collection(outDurations),
                            new Collection(idleDurations),
                            this.data);
                      }),
                  Text(snapshot.data.length.toString())
                ],
              );
            },
          ),
          SessionStatisticGraph(pufs: this.pufs)
        ],
      ),
    );
  }
}

class SessionMetadataDetail extends StatelessWidget {
  final SmokeSessionMetaDataDto metaData;

  const SessionMetadataDetail(
    this.metaData, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text('Metadata', style: Theme.of(context).textTheme.display1),
        ),
        PipeAccesoryWidget(
          accesory: metaData.pipe,
          type: 'Pipe',
        ),
        PipeAccesoryWidget(
          accesory: metaData.bowl,
          type: 'Bowl',
        ),
        PipeAccesoryWidget(
          accesory: metaData.heatManagement,
          type: 'H.M.S',
        ),
        PipeAccesoryWidget(
          accesory: metaData.coal,
          type: 'Coals',
        ),
      ],
    );
  }
}

class SessionStatisticDetail extends StatelessWidget {
  final BehaviorSubject<FinishedSessionDataDto> data;
  final Collection<Duration> inDurations;
  final Collection<Duration> outDurations;
  final Collection<Duration> idleDurations;
  const SessionStatisticDetail(
    this.inDurations,
    this.outDurations,
    this.idleDurations,
    this.data, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text('Statistic', style: Theme.of(context).textTheme.display1),
        ),
        StreamBuilder<FinishedSessionDataDto>(
            stream: this.data,
            builder: (context, snapshot) {
              return Column(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Flexible(child: Text('Start at')),
                      Flexible(
                        child: Text(
                            '${DateUtils.toStringShortTime(snapshot.data.statistics.start)}'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Flexible(flex: 1, child: Text('Session duration')),
                      Flexible(
                        flex: 1,
                        child: Text(
                            '${DateUtils.toStringDuration(DateUtils.parseDuration(snapshot.data.statistics.sessionDuration))}'),
                      ),
                    ],
                  ),
                ],
              );
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(children: [
            TableRow(children: [
              Container(),
              Text("Pufs"),
              Text("Blow"),
              Text("Idle"),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text("Count"),
                  Text(this.inDurations.length.toString()),
                  Text(this.outDurations.length.toString()),
                  Container(),
                ]),
            TableRow(children: [
              Text("Duration"),
              Text(DateUtils.toStringDuration(new Duration(
                  milliseconds: this
                      .inDurations
                      .sum$1((s) => s.inMilliseconds)
                      .toInt()))),
              Text(DateUtils.toStringDuration(new Duration(
                  milliseconds: this
                      .outDurations
                      .sum$1((s) => s.inMilliseconds)
                      .toInt()))),
              Text(DateUtils.toStringDuration(new Duration(
                  milliseconds: this
                      .idleDurations
                      .sum$1((s) => s.inMilliseconds)
                      .toInt()))),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text("Longest"),
                  Text(DateUtils.toSecondDuration(new Duration(
                      milliseconds: this
                          .inDurations
                          .max$1((s) => s.inMilliseconds)
                          .toInt()))),
                  Text(DateUtils.toSecondDuration(new Duration(
                      milliseconds: this
                          .outDurations
                          .max$1((s) => s.inMilliseconds)
                          .toInt()))),
                  Text(DateUtils.toSecondDuration(new Duration(
                      milliseconds: this
                          .idleDurations
                          .max$1((s) => s.inMilliseconds)
                          .toInt()))),
                ]),
            TableRow(children: [
              Text("Average"),
              Text(DateUtils.toSecondDuration(new Duration(
                  milliseconds: this
                      .inDurations
                      .average((s) => s.inMilliseconds)
                      .toInt()))),
              Text(DateUtils.toSecondDuration(new Duration(
                  milliseconds: this
                      .outDurations
                      .average((s) => s.inMilliseconds)
                      .toInt()))),
              Text(DateUtils.toSecondDuration(new Duration(
                  milliseconds: this
                      .idleDurations
                      .average((s) => s.inMilliseconds)
                      .toInt()))),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text("Median"),
                  Text(DateUtils.toSecondDuration(this
                      .inDurations
                      .orderBy((s) => s.inMilliseconds)
                      .elementAt(this.inDurations.length ~/ 2))),
                  Text(DateUtils.toSecondDuration(this
                      .outDurations
                      .orderBy((s) => s.inMilliseconds)
                      .elementAt(this.outDurations.length ~/ 2))),
                  Text(DateUtils.toSecondDuration(this
                      .idleDurations
                      .orderBy((s) => s.inMilliseconds)
                      .elementAt(this.idleDurations.length ~/ 2))),
                ]),
          ]),
        )
      ],
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
          var processData =
              DetailPageHelper.createHistogram(snapshot.data, 300);
          return Container(
            child: Column(
              children: <Widget>[Text(processData.length.toString())],
            ),
          );
        },
      ),
    );
  }
}
