import 'package:app/Helpers/day_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openapi/api.dart';

class EditablkeBusinessHour extends BusinessHoursDto {
  static DateFormat df = new DateFormat('HH:mm:ss');
  static DateFormat of = new DateFormat('HH:mm');

  @override
  String get openTine => this.open != null ? EditablkeBusinessHour.df.format(this.open) : 'Closed';
  @override
  String get closeTime => this.close != null ? EditablkeBusinessHour.df.format(this.close) : 'Closed';

  DateTime open;
  DateTime close;

  EditablkeBusinessHour(int day, this.open, this.close) {
    super.id = day;
    super.day = (day + 1) % 7;
  }

  EditablkeBusinessHour.fromDto(BusinessHoursDto bh) {
    this.open = df.parse(bh.openTine);
    this.close = df.parse(bh.closeTime);
    super.day = bh.day;
    super.id = day;
  }
}

class OpeningHoursPage extends StatefulWidget {
  final List<EditablkeBusinessHour> businessHours;
  OpeningHoursPage({Key key, this.businessHours}) : super(key: key);

  _OpeningHoursPageState createState() => _OpeningHoursPageState();
}

class _OpeningHoursPageState extends State<OpeningHoursPage> {
  List<EditablkeBusinessHour> result;

  @override
  void initState() {
    if (widget.businessHours != null) {
      result = List.generate(7, (index) {
        var bh = new EditablkeBusinessHour(index, null, null);
        return bh;
      });

      widget.businessHours.forEach((f) {
        result[f.id] = f;
      });
    } else {
      result = List.generate(7, (index) {
        var bh = new EditablkeBusinessHour(index, new DateTime(1000, 1, 1, 10, 0), new DateTime(100, 1, 1, 22, 0));
        return bh;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opening hours'.toUpperCase()),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(result),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ...result.map((
              f,
            ) {
              return Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: DayEdit(
                      f,
                      onTimePicke: (value) {
                        setState(() {
                          result[f.id] = value;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.white,
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_downward),
                        onPressed: () => f.id < 7
                            ? setState(() {
                                result[f.id + 1].open = result[f.id].open;
                                result[f.id + 1].close = result[f.id].close;
                              })
                            : null,
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => f.id > 1
                            ? setState(() {
                                result[f.id].open = null;
                                result[f.id].close = null;
                              })
                            : null,
                      ),
                    ],
                  ),
                ],
              );
            }),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                    color: Colors.green,
                    child: Text("Submit"),
                    onPressed: () {
                      var popResult = List<EditablkeBusinessHour>();
                      result.forEach((f) {
                        if (f.close != null && f.open != null) {
                          popResult.add(f);
                        }
                      });

                      Navigator.of(context).pop(popResult);
                    }),
                MaterialButton(
                  child: Text("Reset"),
                  onPressed: () {
                    Navigator.of(context).pop(null);
                  },
                ),
              ],
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class DayEdit extends StatelessWidget {
  final ValueChanged<EditablkeBusinessHour> onTimePicke;
  final EditablkeBusinessHour bh;
  const DayEdit(
    this.bh, {
    Key key,
    this.onTimePicke,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(getLongDayName(bh.id + 1, context), style: Theme.of(context).textTheme.headline6),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TimeEdit(
                  true,
                  bh.open,
                  onTimePicke: (value) {
                    this.bh.open = value;
                    if (this.onTimePicke != null) {
                      onTimePicke(bh);
                    }
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: TimeEdit(
                  false,
                  bh.close,
                  onTimePicke: (value) {
                    this.bh.close = value;
                    if (this.onTimePicke != null) {
                      onTimePicke(bh);
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class TimeEdit extends StatelessWidget {
  final bool open;
  final DateTime time;
  final ValueChanged<DateTime> onTimePicke;
  const TimeEdit(this.open, this.time, {Key key, this.onTimePicke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Future<TimeOfDay> selectedTime = showTimePicker(
          initialTime: TimeOfDay.fromDateTime(time ?? DateTime.now()),
          context: context,
        ).then((value) {
          if (this.onTimePicke != null) {
            var dt = new DateTime(1000, 1, 1, value.hour, value.minute);
            this.onTimePicke(dt);
          }
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(open ? 'Open: ' : 'Close: ', style: Theme.of(context).textTheme.headline5),
          Text(time != null ? EditablkeBusinessHour.of.format(time) : 'Closed'),
          Icon(Icons.edit)
        ],
      ),
    );
  }
}
