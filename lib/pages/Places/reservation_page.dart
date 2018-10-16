import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Callendar/flutter_calendar.dart';
import 'package:app/components/Pickers/WheelPicker/wheelPicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class ReservationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReservationPageState();
  }
}

class _ReservationPageState extends State<ReservationPage> {
  final _textController = TextEditingController();

  DateTime _currentDate = DateTime(2018, 8, 1);
  int peopleCount = 2;
  int selectedTime = 1;
  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  PageController pageController = new PageController(initialPage: 0);
  void _showDatePicker() async {
    final DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: new DateTime(2015, 8),
        lastDate: new DateTime(2101));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.white),
      child: Theme(
        isMaterialAppTheme: true,
        data: ThemeData.light(),
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new AppBar(
              title: new Text('Book place'),
              backgroundColor: Colors.white,
            ),
            Flexible(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        child: new Calendar(
                          isExpandable: true,
                          onDateSelected: (date) {
                            print(date.toString());
                          },
                        ),
                      ),
                      Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 2.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Peoples',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  WheelPicker.integer(
                                    initialValue: peopleCount,
                                    minValue: 1,
                                    maxValue: 10,
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        peopleCount = value;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 2.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Time',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  WheelPicker.string(
                                    initialValue: selectedTime,
                                    minValue: 1,
                                    maxValue: 4,
                                    stringItems: [
                                      "18:00",
                                      "18:30",
                                      "19:00",
                                      "19:30"
                                    ],
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        selectedTime = value;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 0.0),
                        child: new RoundedButton(
                          buttonName: 'Reserve',
                          onTap: () {},
                          buttonColor: Colors.black,
                          borderWidth: 0.0,
                          bottomMargin: 0.0,
                          height: 40.0,
                          width: 200.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
