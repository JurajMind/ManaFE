import 'package:app/Helpers/date_utils.dart';
import 'package:app/pages/Statistic/Detail/Components/smoke_duration_grap.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';
import 'package:rxdart/rxdart.dart';

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
        SizedBox(
          height: 8,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Statistic', style: Theme.of(context).textTheme.display1),
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
                        Expanded(
                            flex: 1,
                            child: Text('Start :',
                                style: Theme.of(context).textTheme.display1)),
                        Expanded(
                          flex: 1,
                          child: Text(
                              snapshot.data != null
                                  ? '${DateUtils.toStringDate(snapshot.data.statistics.start)} ${DateUtils.toStringShortTime(snapshot.data.statistics.start)}'
                                  : '...',
                              style: Theme.of(context).textTheme.display1),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Text('Duration :',
                                style: Theme.of(context).textTheme.display1)),
                        Expanded(
                          flex: 1,
                          child: Text(
                              snapshot.data != null
                                  ? '${DateUtils.toStringDuration(DateUtils.parseDuration(snapshot.data.statistics.sessionDuration))}'
                                  : '...',
                              style: Theme.of(context).textTheme.display1),
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
            idleDurations: this.idleDurations,
            inDurations: this.inDurations,
            outDurations: this.outDurations),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(children: [
            TableRow(children: [
              Container(),
              Text(
                "Pufs",
                style: Theme.of(context).textTheme.display2,
              ),
              Text(
                "Blow",
                style: Theme.of(context).textTheme.display2,
              ),
              Text(
                "Idle",
                style: Theme.of(context).textTheme.display2,
              ),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text(
                    "Count",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  Text(this.inDurations.length.toString()),
                  Text(this.outDurations.length.toString()),
                  Container(),
                ]),
            TableRow(children: [
              Text(
                "Duration",
                style: Theme.of(context).textTheme.display2,
              ),
              Text(DateUtils.toStringDuration(new Duration(
                  milliseconds: this
                          .inDurations
                          .sum$1((s) => s.inMilliseconds)
                          ?.toInt() ??
                      0))),
              Text(DateUtils.toStringDuration(new Duration(
                  milliseconds: this
                          .outDurations
                          .sum$1((s) => s.inMilliseconds)
                          ?.toInt() ??
                      0))),
              Text(DateUtils.toStringDuration(new Duration(
                  milliseconds: this
                          .idleDurations
                          .sum$1((s) => s.inMilliseconds)
                          ?.toInt() ??
                      0))),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text(
                    "Longest",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  Text(DateUtils.toSecondDuration(new Duration(
                      milliseconds: this
                              .inDurations
                              .max$1((s) => s.inMilliseconds)
                              ?.toInt() ??
                          0))),
                  Text(DateUtils.toSecondDuration(new Duration(
                      milliseconds: this
                              .outDurations
                              .max$1((s) => s.inMilliseconds)
                              ?.toInt() ??
                          0))),
                  Text(DateUtils.toSecondDuration(new Duration(
                      milliseconds: this
                              .idleDurations
                              .max$1((s) => s.inMilliseconds)
                              ?.toInt() ??
                          0))),
                ]),
            TableRow(children: [
              Text(
                "Average",
                style: Theme.of(context).textTheme.display2,
              ),
              Text(DateUtils.toSecondDuration(new Duration(
                  milliseconds: this
                          .inDurations
                          .average((s) => s.inMilliseconds)
                          ?.toInt() ??
                      0))),
              Text(DateUtils.toSecondDuration(new Duration(
                  milliseconds: this
                          .outDurations
                          .average((s) => s.inMilliseconds)
                          ?.toInt() ??
                      0))),
              Text(DateUtils.toSecondDuration(new Duration(
                  milliseconds: this
                          .idleDurations
                          .average((s) => s.inMilliseconds)
                          ?.toInt() ??
                      0))),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text(
                    "Median",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  Text(DateUtils.toSecondDuration(this.outDurations.length == 0
                      ? new Duration()
                      : this
                          .inDurations
                          .orderBy((s) => s.inMilliseconds)
                          .elementAt(this.inDurations.length ~/ 2))),
                  Text(DateUtils.toSecondDuration(this.outDurations.length == 0
                      ? new Duration()
                      : this
                          .outDurations
                          .orderBy((s) => s.inMilliseconds)
                          .elementAt(this.outDurations.length ~/ 2))),
                  Text(DateUtils.toSecondDuration(this.outDurations.length == 0
                      ? new Duration()
                      : this
                          .idleDurations
                          .orderBy((s) => s.inMilliseconds)
                          .elementAt(this.idleDurations.length ~/ 2))),
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
              Text('Statistic', style: Theme.of(context).textTheme.display1),
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
                  Expanded(
                      flex: 1,
                      child: Text('Start :',
                          style: Theme.of(context).textTheme.display1)),
                  Expanded(
                    flex: 1,
                    child: Text('...',
                        style: Theme.of(context).textTheme.display1),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Text('Duration :',
                          style: Theme.of(context).textTheme.display1)),
                  Expanded(
                    flex: 1,
                    child: Text('...',
                        style: Theme.of(context).textTheme.display1),
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
                style: Theme.of(context).textTheme.display2,
              ),
              Text(
                "Blow",
                style: Theme.of(context).textTheme.display2,
              ),
              Text(
                "Idle",
                style: Theme.of(context).textTheme.display2,
              ),
            ]),
            TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                children: [
                  Text(
                    "Count",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  Text('...'),
                  Text('...'),
                  Container(),
                ]),
            TableRow(children: [
              Text(
                "Duration",
                style: Theme.of(context).textTheme.display2,
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
                    style: Theme.of(context).textTheme.display2,
                  ),
                  Text('...'),
                  Text('...'),
                  Text('...'),
                ]),
            TableRow(children: [
              Text(
                "Average",
                style: Theme.of(context).textTheme.display2,
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
                    style: Theme.of(context).textTheme.display2,
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
