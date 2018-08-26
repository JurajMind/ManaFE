import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class ReservationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReservationPageState();
  }
}

class _ReservationPageState extends State<ReservationPage> {
  final _textController = TextEditingController();

  void _showDatePicker() async {
    final DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: new DateTime(2015, 8),
        lastDate: new DateTime(2101));
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new AppBar(
          title: new Text('Place'),
        ),
        Column(
          children: <Widget>[
            Calendar(
              isExpandable: true,
            ),
            Container(
                child: InkWell(
              onTap: () => _showDatePicker(),
              child: IgnorePointer(
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Test',
                    suffixIcon: Icon(Icons.date_range),
                  ),
                ),
              ),
            )),
          ],
        ),
      ],
    );
  }
}
