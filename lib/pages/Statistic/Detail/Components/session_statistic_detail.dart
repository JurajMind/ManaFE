import 'package:app/Helpers/date_utils.dart' as dateUtils;
import 'package:app/pages/Statistic/Detail/Components/smoke_duration_grap.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/openapi.dart';
import 'package:rxdart/rxdart.dart';
import 'package:darq/darq.dart';

class SessionStatisticDetail extends StatelessWidget {
  final BehaviorSubject<FinishedSessionDataDto> data;
  final List<Duration> inDurations;
  final List<Duration> outDurations;
  final List<Duration> idleDurations;
  const SessionStatisticDetail(
    this.inDurations,
    this.outDurations,
    this.idleDurations,
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Statistic', style: Theme.of(context).textTheme.headline6),
              SizedBox(width: 8),
              Icon(FontAwesomeIcons.chartBar),
            ],
          ),
        ),
        StreamBuilder<FinishedSessionDataDto>(
            stream: this.data,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(flex: 1, child: Text('Start :', style: Theme.of(context).textTheme.headline6)),
                        Expanded(
                          flex: 1,
                          child: Text(
                              snapshot.data != null
                                  ? '${dateUtils.DateUtils.toStringDate(snapshot.data!.statistics!.start!)} ${dateUtils.DateUtils.toStringShortTime(snapshot.data!.statistics!.start!)}'
                                  : '...',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(flex: 1, child: Text('Duration :', style: Theme.of(context).textTheme.headline6)),
                        Expanded(
                          flex: 1,
                          child: Text(
                              snapshot.data != null
                                  ? '${dateUtils.DateUtils.toStringDuration(dateUtils.DateUtils.parseDuration(snapshot.data!.statistics!.sessionDuration!))}'
                                  : '...',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
        SizedBox(
          height: 16,
        ),
        new SmokeDurationGraph(
            idleDurations: this.idleDurations, inDurations: this.inDurations, outDurations: this.outDurations),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(children: [
            TableRow(children: [
              Container(),
              Text(
                "Pufs",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "Blow",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "Idle",
                style: Theme.of(context).textTheme.headline5,
              ),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text(
                    "Count",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(this.inDurations.length.toString()),
                  Text(this.outDurations.length.toString()),
                  Container(),
                ]),
            TableRow(children: [
              Text(
                "Duration",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(dateUtils.DateUtils.toStringDuration(
                  new Duration(milliseconds: this.inDurations.sum<int>((s) => s.inMilliseconds).toInt()))),
              Text(dateUtils.DateUtils.toStringDuration(
                  new Duration(milliseconds: this.outDurations.sum<int>((s) => s.inMilliseconds).toInt()))),
              Text(dateUtils.DateUtils.toStringDuration(
                  new Duration(milliseconds: this.idleDurations.sum<int>((s) => s.inMilliseconds).toInt()))),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text(
                    "Longest",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(dateUtils.DateUtils.toSecondDuration(new Duration(
                      milliseconds: this.inDurations.isEmpty
                          ? 0
                          : this
                              .inDurations
                              .select((element, index) => (element.inMilliseconds).toInt())
                              .max((a, b) => a.compareTo(b))))),
                  Text(dateUtils.DateUtils.toSecondDuration(new Duration(
                      milliseconds: this.outDurations.isEmpty
                          ? 0
                          : this
                              .outDurations
                              .select((element, index) => (element.inMilliseconds).toInt())
                              .max((a, b) => a.compareTo(b))))),
                  Text(dateUtils.DateUtils.toSecondDuration(new Duration(
                      milliseconds: this.outDurations.isEmpty
                          ? 0
                          : this
                              .idleDurations
                              .select((element, index) => (element.inMilliseconds).toInt())
                              .max((a, b) => a.compareTo(b))))),
                ]),
            TableRow(children: [
              Text(
                "Average",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(dateUtils.DateUtils.toSecondDuration(new Duration(
                  milliseconds:
                      this.inDurations.isEmpty ? 0 : this.inDurations.average((s) => s.inMilliseconds).toInt()))),
              Text(dateUtils.DateUtils.toSecondDuration(new Duration(
                  milliseconds:
                      this.outDurations.isEmpty ? 0 : this.outDurations.average((s) => s.inMilliseconds).toInt()))),
              Text(dateUtils.DateUtils.toSecondDuration(new Duration(
                  milliseconds:
                      this.idleDurations.isEmpty ? 0 : this.idleDurations.average((s) => s.inMilliseconds).toInt()))),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text(
                    "Median",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(dateUtils.DateUtils.toSecondDuration(this.outDurations.length == 0
                      ? new Duration()
                      : this.inDurations.orderBy((s) => s.inMilliseconds).elementAt(this.inDurations.length ~/ 2))),
                  Text(dateUtils.DateUtils.toSecondDuration(this.outDurations.length == 0
                      ? new Duration()
                      : this.outDurations.orderBy((s) => s.inMilliseconds).elementAt(this.outDurations.length ~/ 2))),
                  Text(dateUtils.DateUtils.toSecondDuration(this.outDurations.length == 0
                      ? new Duration()
                      : this.idleDurations.orderBy((s) => s.inMilliseconds).elementAt(this.idleDurations.length ~/ 2))),
                ]),
          ]),
        ),
      ],
    );
  }
}

class SessionStatisticShimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Statistic', style: Theme.of(context).textTheme.headline6),
              SizedBox(width: 8),
              Icon(FontAwesomeIcons.chartBar),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(flex: 1, child: Text('Start :', style: Theme.of(context).textTheme.headline6)),
                  Expanded(
                    flex: 1,
                    child: Text('...', style: Theme.of(context).textTheme.headline6),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(flex: 1, child: Text('Duration :', style: Theme.of(context).textTheme.headline6)),
                  Expanded(
                    flex: 1,
                    child: Text('...', style: Theme.of(context).textTheme.headline6),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        new SmokeDurationGraphShimer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(children: [
            TableRow(children: [
              Container(),
              Text(
                "Pufs",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Blow",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Idle",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text(
                    "Count",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text('...'),
                  Text('...'),
                  Container(),
                ]),
            TableRow(children: [
              Text(
                "Duration",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text('...'),
              Text('...'),
              Text('...'),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text(
                    "Longest",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text('...'),
                  Text('...'),
                  Text('...'),
                ]),
            TableRow(children: [
              Text(
                "Average",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text('...'),
              Text('...'),
              Text('...'),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text(
                    "Median",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text('...'),
                  Text('...'),
                  Text('...'),
                ]),
          ]),
        ),
      ],
    );
  }
}
