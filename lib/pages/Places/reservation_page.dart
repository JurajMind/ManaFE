import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Callendar/flutter_calendar.dart';
import 'package:app/components/Pickers/WheelPicker/wheelPicker.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Places/labeled_value.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:vibrate/vibrate.dart';

class ReservationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReservationPageState();
  }
}

class _ReservationPageState extends State<ReservationPage> {
  final _textController = TextEditingController();

  DateTime currentDate = DateTime.now();
  int selectedPersons = 2;
  int selectedTime = 1;
  int selectedDuration = 2;
  int selectedTimeValue;
  static const durations = ["2:00", "3:00", "4:00", "5:00"];
  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  PageController pageController = new PageController(initialPage: 0);

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
              Flexible(
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
                                          return snapShot.data == null
                                              ? Container()
                                              : WheelPicker.string(
                                                  initialValue: selectedTime,
                                                  minValue: 1,
                                                  maxValue:
                                                      snapShot.data.length,
                                                  stringItems: snapShot.data
                                                      .map((s) => s.text)
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
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              LabeledValue(
                                label: 'Date:',
                                value: currentDate.toString(),
                              ),
                              LabeledValue(
                                label: 'Time:',
                                value: selectedTimeValue.toString(),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
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
                                buttonName: 'Finish',
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
                          )
                        ],
                      ),
                    )
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
