import 'package:app/Helpers/date_utils.dart';
import 'package:app/app/app.dart';
import 'package:app/components/Common/labeled_value.dart';
import 'package:app/pages/SmokeSession/pipe_accesory_widget.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
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

  @override
  initState() {
    super.initState();
    start =
        new DateTime.fromMillisecondsSinceEpoch(widget.session.statistic.start);
    var id = widget.session.id;
    App.http.getPufs(id).then((data) => this.pufs.add(data));
    App.http.getFinishedData(id).then((data) => this.data.add(data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: <Widget>[],
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
                new SessionMetadataDetail(snapshot.data.metaData),
                new SessionStatisticDetail(snapshot.data.statistics),
              ]);
            },
          ),
          StreamBuilder<List<SmartHookahModelsDbPuf>>(
            stream: this.pufs,
            initialData: null,
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == null) return Container();

              return Text(snapshot.data.length.toString());
            },
          ),
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
  final SmokeSessionStatisticsDto statistic;

  const SessionStatisticDetail(
    this.statistic, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sessionDuration = DateUtils.parseDuration(statistic.sessionDuration);
    var smokeDuration = DateUtils.parseDuration(statistic.smokeDuration);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text('Statistic', style: Theme.of(context).textTheme.display1),
        ),
        LabeledValue(
          statistic.pufCount.toString(),
          label: 'Puf count: ',
          icon: Icon(Icons.cloud),
          padding: EdgeInsets.only(),
        ),
        LabeledValue(
          '${DateUtils.toStringDate(statistic.start)} ${DateUtils.toStringShortTime(statistic.start)}',
          label: 'Session start: ',
          icon: Icon(Icons.hourglass_empty),
          padding: EdgeInsets.only(),
        ),
        LabeledValue(
          DateUtils.toStringDuration(sessionDuration),
          label: 'Session duration: ',
          icon: Icon(Icons.hourglass_full),
          padding: EdgeInsets.only(),
        ),
        LabeledValue(
          DateUtils.toStringDuration(smokeDuration),
          label: 'Smoke duration: ',
          icon: Icon(Icons.cloud_download),
          padding: EdgeInsets.only(),
        )
      ],
    );
  }
}
