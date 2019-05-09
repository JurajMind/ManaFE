import 'package:app/Helpers/helpers.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Callendar/flutter_calendar.dart';
import 'package:app/components/Common/labeled_value.dart';
import 'package:app/components/Pickers/WheelPicker/wheelPicker.dart';

import 'package:app/module/data_provider.dart';
import 'package:app/module/person/reservations_bloc.dart';
import 'package:app/pages/Places/Reservations/reservation_detail_page.dart';
import 'package:app/utils/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openapi/api.dart';
import 'package:vibrate/vibrate.dart';
import 'package:date_format/date_format.dart';

class ReservationPage extends StatefulWidget {
  final PlaceSimpleDto place;

  const ReservationPage({Key key, this.place}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _ReservationPageState();
  }
}

class _ReservationPageState extends State<ReservationPage> {
  final _textController = TextEditingController();

  DateTime currentDate;
  int selectedPersons = 2;
  int selectedTime;
  int selectedDuration = 2;
  int selectedTimeValue;
  int _cannotReserve = 0;
  String selectedTimeLabel;
  static const durations = [5, 6, 7, 8];
  PageController pageController = new PageController(initialPage: 0);
  TextEditingController nameTextController;
  TextEditingController noteTextController;

  List<String> _disabledTimes;

  @override
  initState() {
    super.initState();
    nameTextController = new TextEditingController();
    noteTextController = new TextEditingController();
    currentDate = DateTime.now();
    _disabledTimes = new List<String>();
  }

  @override
  Widget build(BuildContext context) {
    var placeBloc = DataProvider.getData(context).placeSingleBloc;
    var reservationBloc = DataProvider.getData(context).reservationBloc;
    var personBloc = DataProvider.getData(context).personBloc;
    nameTextController.text = personBloc?.info?.value?.displayName ?? "";
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 55,
      ),
      body: Hero(
        tag: "${widget.place.friendlyUrl}_reservation",
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
                  leading: IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: new Text(
                    "${widget.place.name} reservation",
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
                                  highlightToday: true,
                                  showCalendarPickerIcon: false,
                                  onDateSelected: (date) {
                                    var dateCompare =
                                        compareDate(date, DateTime.now());

                                    if (dateCompare >= 0) {
                                      placeBloc.loadReservationInfo(date);
                                    }

                                    setState(() {
                                      currentDate = date;
                                      _cannotReserve = dateCompare;
                                    });
                                  },
                                ),
                              ),
                              StreamBuilder<List<ReservationsTimeSlot>>(
                                  stream: placeBloc.reservationInfo,
                                  initialData: null,
                                  builder: (context, snapshot) {
                                    if (snapshot.data != null &&
                                        DateHelper.compareDate(
                                            currentDate, DateTime.now())) {
                                      // selectedTime = 4;
                                    } else {}
                                    if (selectedTime == null &&
                                        snapshot.data != null) {
                                      selectTime(
                                          1, snapshot.data, new List<String>());
                                    }

                                    var disabledTimes =
                                        this.disabledTime(snapshot.data);

                                    return Column(
                                      children: <Widget>[
                                        _cannotReserve < 0
                                            ? Container()
                                            : Card(
                                                elevation: 2.0,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: <Widget>[
                                                    buildPeoplesColumn(),
                                                    buildTimeColumn(
                                                        snapshot.data,
                                                        disabledTimes),
                                                    buildDurationColumn(
                                                        snapshot.data,
                                                        disabledTimes),
                                                  ],
                                                ),
                                              ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: buildNextButton(
                                              disabledTimes, _cannotReserve),
                                        ),
                                      ],
                                    );
                                  }),
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
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      LabeledValue(
                                        formatDate(currentDate,
                                            [d, '.', m, '.', yyyy]),
                                        label: 'Date:',
                                      ),
                                      LabeledValue(
                                        selectedTimeLabel,
                                        label: 'Time:',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      LabeledValue(selectedPersons.toString(),
                                          label: 'Persons:'),
                                      LabeledValue(
                                          slotDurationString(
                                              selectedDuration + durations[0]),
                                          label: 'Duration:'),
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
                                      controller: nameTextController,
                                      decoration: new InputDecoration(
                                        labelText: "Name",
                                      ),
                                    ),
                                    TextField(
                                      controller: noteTextController,
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
                                    _createReservations(
                                        context, reservationBloc);
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
      ),
    );
  }

  RoundedButton buildNextButton(
      List<String> disabledTimes, int _cannotReserve) {
    var next =
        disabledTimes.contains(selectedTimeLabel) || (_cannotReserve < 0);
    return new RoundedButton(
      buttonName: 'Next',
      onTap: () => next ? null : pageController.jumpToPage(1),
      buttonColor: next ? Colors.grey : Colors.black,
      borderWidth: 0.0,
      bottomMargin: 0.0,
      height: 40.0,
      width: 200.0,
    );
  }

  Column buildPeoplesColumn() {
    return Column(
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
    );
  }

  Column buildTimeColumn(
      List<ReservationsTimeSlot> data, List<String> disabledTimes) {
    return Column(
      children: <Widget>[
        Text(
          'Time',
          style: TextStyle(color: Colors.grey),
        ),
        data == null || data.length == 0
            ? Container(
              height: 100,
            )
            : WheelPicker.string(
                initialValue: selectedTime,
                stringItems: data.map((s) => s.text).toList(),
                disableItems: disabledTimes,
                onChanged: (value) {
                  Vibrate.feedback(FeedbackType.light);
                  print(value);
                  setState(() {
                    selectTime(value, data, disabledTimes);
                  });
                },
              )
      ],
    );
  }

  Column buildDurationColumn(
      List<ReservationsTimeSlot> data, List<String> disabledTimes) {
    return Column(
      children: <Widget>[
        Text(
          'Duration',
          style: TextStyle(color: Colors.grey),
        ),
        WheelPicker.string(
          initialValue: selectedDuration,
          stringItems: durations.map((s) => slotDurationString(s)).toList(),
          onChanged: (value) {
            print(value);
            Vibrate.feedback(FeedbackType.light);
            setState(() {
              selectedDuration = value;
            });
          },
        )
      ],
    );
  }

  void selectTime(num value, List<ReservationsTimeSlot> snapShot,
      List<String> disabledTimes) {
    selectedTime = value;
    selectedTimeValue = snapShot[value].value;
    selectedTimeLabel = snapShot[value].text;
  } 

  int canGoNext(List<String> disabledTimes) {
    if (disabledTimes.contains(selectedTimeLabel)) {
      return 0;
    } else {
      return 1;
    }
  }

  List<String> disabledTime(List<ReservationsTimeSlot> times) {
    if (times == null) return new List<String>();
    var duration = selectedDuration + durations[0];
    return disabledTimeDuration(times, duration);
  }

  List<String> disabledTimeDuration(
      List<ReservationsTimeSlot> times, int duration) {
    if (times == null) return new List<String>();
    List<String> result = new List<String>();

    if (compareDate(currentDate, DateTime.now()) == 0) {
      final DateFormat of = new DateFormat('HH:mm');
      for (var time in times) {
        var parsedTime = of.parse(time.text);
        var parsedDate = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, parsedTime.hour, parsedTime.minute);
        if (parsedDate.compareTo(DateTime.now()) < 0) {
          result.add(time.text);
        }
      }
    }

    for (int i = 0; i < times.length; i++) {
      for (int j = 0; j < duration; j++) {
        if (i + j >= times.length) {
          result.add(times[i].text);
        } else {
          if (times[i + j].tablesLeft == 0) {
            result.add(times[i].text);
          }
        }
      }
    }
    _disabledTimes = result.toSet().toList();
    return _disabledTimes;
  }

  List<String> confirmRequired(List<ReservationsTimeSlot> times, int duration) {
    if (times == null) return new List<String>();
    List<String> result = new List<String>();
    for (int i = 0; i < times.length; i++) {
      for (int j = 0; j < duration; j++) {
        if (i + j > times.length) {
          result.add(times[i].text);
        }
      }
    }

    return result.toSet().toList();
  }

  List<String> disabledDurations(List<ReservationsTimeSlot> times) {
    if (times == null) return new List<String>();

    var result = new List<String>();
    for (var duration in durations) {
      var disabled = disabledTimeDuration(times, duration);
      if (disabled.length == times.length) {
        result.add(slotDurationString(duration));
      }
    }
    return result;
  }

  _createReservations(BuildContext context, ReservationBloc bloc) async {
    var newReservation = new ReservationDto();
    newReservation.persons = selectedPersons;
    newReservation.placeId = widget.place.id;
    newReservation.name = nameTextController.value.text;
    newReservation.text = noteTextController.value.text;
    newReservation.duration =
        slotDurationString(selectedDuration + durations[0]);
    DateFormat df = new DateFormat('HH:mm');
    var time = df.parse(selectedTimeLabel);
    newReservation.time = new DateTime(currentDate.year, currentDate.month,
        currentDate.day, time.hour, time.minute);

    var result = await bloc.createReservation(newReservation);
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: ((BuildContext context) =>
            ReservationDetailPage(reservation: result))));
  }
}
