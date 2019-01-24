import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Callendar/flutter_calendar.dart';
import 'package:app/components/Pickers/WheelPicker/wheelPicker.dart';

import 'package:app/module/data_provider.dart';
import 'package:app/pages/Places/labeled_value.dart';
import 'package:app/utils/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:tuple/tuple.dart';
import 'package:vibrate/vibrate.dart';
import 'package:date_format/date_format.dart';

class ReservationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReservationPageState();
  }
}

class _ReservationPageState extends State<ReservationPage> {
  final _textController = TextEditingController();

  DateTime currentDate;
  int selectedPersons = 2;
  int selectedTime = 1;
  int selectedDuration = 2;
  int selectedTimeValue;
  static const durations = ["2:30", "3:00", "3:30", "4:00"];
  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  PageController pageController = new PageController(initialPage: 0);

  @override
  initState() {
    super.initState();
    currentDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var placeBloc = DataProvider.getData(context).placeSingleBloc;
    return SafeArea(
      child: Theme(
        isMaterialAppTheme: true,
        data: ThemeData.light(),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.0), color: Colors.white),
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new AppBar(
                iconTheme: IconThemeData(
                  color: Colors.black, //change your color here
                ),
                title: new Text(
                  'Book place',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: <Widget>[
                    ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Card(
                              elevation: 2.0,
                              child: new Calendar(
                                initialCalendarDateOverride: currentDate,
                                isExpandable: true,
                                onDateSelected: (date) {
                                  setState(() {
                                    currentDate = date;
                                  });

                                  placeBloc.loadReservationInfo(date);
                                },
                              ),
                            ),
                            Card(
                              elevation: 2.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Peoples',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      WheelPicker.integer(
                                        initialValue: selectedPersons,
                                        minValue: 1,
                                        maxValue: 10,
                                        onChanged: (value) {
                                          print(value);
                                          Vibrate.feedback(FeedbackType.light);
                                          setState(() {
                                            selectedPersons = value;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Time',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      StreamBuilder<List<ReservationsTimeSlot>>(
                                        stream: placeBloc.reservationInfo,
                                        initialData: null,
                                        builder: (context, snapShot) {
                                          if (snapShot.data != null &&
                                              DateHelper.CompareDate(
                                                  currentDate,
                                                  DateTime.now())) {
                                            // selectedTime = 4;
                                          } else {}

                                          return snapShot.data == null
                                              ? Container()
                                              : WheelPicker.tuple(
                                                  initialValue: selectedTime,
                                                  minValue: 1,
                                                  maxValue:
                                                      snapShot.data.length,
                                                  tupleItems: snapShot.data
                                                      .map((s) => new Tuple2(
                                                          s.text, s.reserved))
                                                      .toList(),
                                                  onChanged: (value) {
                                                    Vibrate.feedback(
                                                        FeedbackType.light);
                                                    print(value);
                                                    setState(() {
                                                      selectedTime = value;
                                                      selectedTimeValue =
                                                          snapShot
                                                              .data[value - 1]
                                                              .value;
                                                    });
                                                  },
                                                );
                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Duration',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      WheelPicker.string(
                                        initialValue: selectedDuration,
                                        minValue: 1,
                                        maxValue: 4,
                                        stringItems: durations,
                                        onChanged: (value) {
                                          print(value);
                                          Vibrate.feedback(FeedbackType.light);
                                          setState(() {
                                            selectedDuration = value;
                                          });
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: new RoundedButton(
                                buttonName: 'Next',
                                onTap: () {
                                  pageController.jumpToPage(1);
                                },
                                buttonColor: Colors.black,
                                borderWidth: 0.0,
                                bottomMargin: 0.0,
                                height: 40.0,
                                width: 200.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Card(
                            elevation: 2.0,
                            margin: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    LabeledValue(
                                      label: 'Date:',
                                      value: formatDate(currentDate,
                                          [dd, '.', mm, '.', yyyy]),
                                    ),
                                    LabeledValue(
                                      label: 'Time:',
                                      value: selectedTimeValue.toString(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    LabeledValue(
                                      label: 'Persons:',
                                      value: selectedPersons.toString(),
                                    ),
                                    LabeledValue(
                                      label: 'Duration:',
                                      value: durations[selectedDuration],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(8.0),
                            elevation: 2.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    decoration: new InputDecoration(
                                      labelText: "Name",
                                    ),
                                  ),
                                  TextField(
                                    decoration: new InputDecoration(
                                        labelText: "Reservation note"),
                                    maxLines: 5,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new RoundedButton(
                                buttonName: 'Back',
                                onTap: () {
                                  pageController.jumpToPage(0);
                                },
                                textColor: Colors.red,
                                buttonColor: Colors.transparent,
                                borderWidth: 2.0,
                                bottomMargin: 2.0,
                                height: 40.0,
                                width: 150.0,
                              ),
                              new RoundedButton(
                                buttonName: 'Reserve',
                                onTap: () {
                                  pageController.jumpToPage(2);
                                },
                                buttonColor: Colors.black,
                                borderWidth: 0.0,
                                bottomMargin: 0.0,
                                height: 40.0,
                                width: 150.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
