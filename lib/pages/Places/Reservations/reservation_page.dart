import 'package:app/Helpers/helpers.dart';
import 'package:app/app/app.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Callendar/flutter_calendar.dart';
import 'package:app/components/Common/labeled_value.dart';
import 'package:app/components/Pickers/WheelPicker/wheelPicker.dart';
import 'package:app/const/theme.dart';

import 'package:app/module/data_provider.dart';
import 'package:app/module/person/reservations_bloc.dart';
import 'package:app/pages/Places/Reservations/reservation_detail_page.dart';
import 'package:app/utils/date_helper.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';
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

class ParsedTimes {
  final DateFormat of = new DateFormat('HH:mm');
  ParsedTimes.fromTimeSlot(ReservationsTimeSlot timeSlot) {
    this.timeSlot = timeSlot;
    var parsedTime = of.parse(timeSlot.text);
    this.time = parsedTime;
    this.label = timeSlot.text;
  }

  ParsedTimes({this.time, this.label, this.timeSlot});
  DateTime time;
  String label;
  ReservationsTimeSlot timeSlot;
}

class _ReservationPageState extends State<ReservationPage> {
  final _textController = TextEditingController();

  bool loading = false;
  DateTime selectedDate;
  int selectedPersons = 2;
  int selectedTime = 0;
  int selectedDuration = 2;
  int selectedTimeValue;
  int _cannotReserve = 0;
  String selectedTimeLabel;
  static const durations = [5, 6, 7, 8];
  PageController pageController = new PageController(initialPage: 0);
  TextEditingController nameTextController;
  TextEditingController noteTextController;
  BehaviorSubject<List<ParsedTimes>> reservationInfo =
      new BehaviorSubject.seeded(new List<ParsedTimes>());

  List<ParsedTimes> _disabledTimes;

  bool postingReservation = false;
  @override
  initState() {
    super.initState();
    nameTextController = new TextEditingController();
    noteTextController = new TextEditingController();
    selectedDate = DateTime.now();
    _disabledTimes = new List<ParsedTimes>();
    loadReservationInfo(selectedDate).then((data) {
      selectedTimeLabel = data[0].label;
      selectedTimeValue = data[0].timeSlot.capacityLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    
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
                  centerTitle: true,
                  iconTheme: IconThemeData(
                    color: Colors.black, //change your color here
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: new Text(
                    "${widget.place.name.toUpperCase()} RESERVATION",
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.white,
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
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
                                  initialCalendarDateOverride: selectedDate,
                                  isExpandable: true,
                                  highlightToday: true,
                                  showCalendarPickerIcon: false,
                                  onDateSelected: (date) async {
                                    var dateCompare =
                                        compareDate(date, DateTime.now());

                                    if (dateCompare >= 0) {
                                      await loadReservationInfo(date)
                                          .then((data) {
                                        if (data.length == 0) {
                                          return;
                                        }
                                        selectedTimeLabel = data[0].label;
                                        selectedTimeValue =
                                            data[0].timeSlot.capacityLeft;
                                      });
                                    }

                                    setState(() {
                                      selectedDate = date;
                                      _cannotReserve = dateCompare;
                                    });
                                  },
                                ),
                              ),
                              StreamBuilder<List<ParsedTimes>>(
                                  stream: reservationInfo,
                                  initialData: null,
                                  builder: (context, snapshot) {
                                    if (snapshot.data != null &&
                                        DateHelper.compareDate(
                                            selectedDate, DateTime.now())) {
                                      // selectedTime = 4;
                                    } else {}
                                    if (selectedTime == null &&
                                        snapshot.data != null) {
                                      selectTime(1, snapshot.data,
                                          new List<ParsedTimes>());
                                    }

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
                                                    Expanded(
                                                        flex: 1,
                                                        child:
                                                            buildPeoplesColumn()),
                                                    Expanded(
                                                        flex: 1,
                                                        child: buildTimeColumn(
                                                            snapshot.data,
                                                            this._disabledTimes)),
                                                    Expanded(
                                                        flex: 1,
                                                        child: buildDurationColumn(
                                                            snapshot.data,
                                                            this._disabledTimes)),
                                                  ],
                                                ),
                                              ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: buildNextButton(
                                              this._disabledTimes,
                                              _cannotReserve),
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
                                        formatDate(selectedDate,
                                            [d, '.', m, '.', yyyy]),
                                        label: AppTranslations.of(context)
                                                .text('reservations.date') +
                                            " : ",
                                      ),
                                      LabeledValue(
                                        selectedTimeLabel,
                                        label: AppTranslations.of(context)
                                                .text('reservations.time') +
                                            " : ",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      LabeledValue(selectedPersons.toString(),
                                          label: AppTranslations.of(context)
                                                  .text(
                                                      'reservations.persons') +
                                              " : "),
                                      LabeledValue(
                                          slotDurationString(
                                              selectedDuration + durations[0]),
                                          label: AppTranslations.of(context)
                                                  .text(
                                                      'reservations.duration') +
                                              " : "),
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
                                        labelText: AppTranslations.of(context)
                                            .text('reservations.name'),
                                      ),
                                    ),
                                    TextField(
                                      controller: noteTextController,
                                      decoration: new InputDecoration(
                                        labelText: AppTranslations.of(context)
                                            .text(
                                                'reservations.reservation_note'),
                                      ),
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
                                  buttonName: AppTranslations.of(context)
                                      .text("common.back")
                                      .toUpperCase(),
                                  onTap: () {
                                    pageController.animateToPage(0,
                                        curve: Curves.easeIn,
                                        duration:
                                            const Duration(milliseconds: 500));
                                  },
                                  textColor: Colors.red,
                                  buttonColor: Colors.transparent,
                                  borderWidth: 2.0,
                                  bottomMargin: 2.0,
                                  height: 40.0,
                                  width: 150.0,
                                ),
                                postingReservation
                                    ? CircularProgressIndicator()
                                    : new RoundedButton(
                                        buttonName: AppTranslations.of(context)
                                            .text('reservations.reserve')
                                            .toUpperCase(),
                                        onTap: () {
                                          setState(() {
                                            postingReservation = true;
                                          });
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

  Future<List<ParsedTimes>> loadReservationInfo(DateTime date) async {
    setState(() {
      loading = true;
    });
    return await App.http
        .getPlaceReservationInfo(widget.place.id, date)
        .then((data) {
      if (compareDate(selectedDate, date) == 0) {
        setState(() {
          selectedTime = 2;
        });
      }
      var parsed =
          data.timeSlots.map((f) => new ParsedTimes.fromTimeSlot(f)).toList();

      setState(() {
        this._disabledTimes =
            this.disabledTimeDuration(date, parsed, this.selectedDuration);
      });
      setState(() {
        loading = false;
      });
      reservationInfo.add(parsed);
      return parsed;
    });
  }

  Widget buildNextButton(List<ParsedTimes> disabledTimes, int _cannotReserve) {
    var noNext =
        disabledTimes.map((f) => f.label).contains(selectedTimeLabel) ||
            (_cannotReserve < 0);

    if (selectedTimeLabel == null) {
      noNext = true;
    }
    if (loading) {
      return CircularProgressIndicator();
    }
    return new RoundedButton(
      buttonName: AppTranslations.of(context).text("common.next").toUpperCase(),
      onTap: () => noNext
          ? null
          : pageController.animateToPage(1,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 500)),
      buttonColor: noNext ? Colors.grey : Colors.black,
      borderWidth: 0.0,
      bottomMargin: 0.0,
      height: 40.0,
      width: 200.0,
    );
  }

  Widget buildPeoplesColumn() {
    return Column(
      children: <Widget>[
        Text(
          AppTranslations.of(context).text('reservations.persons'),
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

  bool timeBefore(int time) {
    if (selectedDate.isAfter(DateTime.now())) {
      return false;
    }
    return true;
  }

  Widget buildTimeColumn(
      List<ParsedTimes> data, List<ParsedTimes> disabledTimes) {
    return Column(
      children: <Widget>[
        Text(
          AppTranslations.of(context).text('reservations.time'),
          style: TextStyle(color: Colors.grey),
        ),
        data == null || data.length == 0
            ? Container(
                height: 150,
              )
            : WheelPicker.string(
                initialValue: selectedTime,
                stringItems: data.map((s) => s.timeSlot.text).toList(),
                disableItems: disabledTimes.map((d) => d.label).toList(),
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
      List<ParsedTimes> data, List<ParsedTimes> disabledTimes) {
    return Column(
      children: <Widget>[
        Text(
          AppTranslations.of(context).text('reservations.duration'),
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
              this._disabledTimes =
                  this.disabledTimeDuration(selectedDate, data, value);
            });
          },
        )
      ],
    );
  }

  void selectTime(
      num value, List<ParsedTimes> snapShot, List<ParsedTimes> disabledTimes) {
    if (snapShot == null) {
      return;
    }
    selectedTime = value;
    selectedTimeValue = snapShot[value].timeSlot.value;
    selectedTimeLabel = snapShot[value].timeSlot.text;
  }

  List<ParsedTimes> disabledTimeDuration(
      DateTime date, List<ParsedTimes> times, int duration) {
    if (times == null) return new List<ParsedTimes>();
    List<ParsedTimes> result = new List<ParsedTimes>();

    if (compareDate(date, DateTime.now()) == 0) {
      for (var time in times) {
        if (compareTime(time.time, DateTime.now()) < 0) {
          result.add(time);
        }
      }
    }
    var durationOffset = duration + durations[0];
    for (int i = 0; i < times.length; i++) {
      for (int j = 0; j < durationOffset; j++) {
        if (i + j >= times.length) {
          result.add(times[i]);
        } else {
          if (times[i + j].timeSlot.tablesLeft == 0) {
            result.add(times[i]);
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

  _createReservations(BuildContext context, ReservationBloc bloc) async {
    var newReservation = new PlacesReservationsReservationDto();
    newReservation.persons = selectedPersons;
    newReservation.placeId = widget.place.id;
    newReservation.name = nameTextController.value.text;
    newReservation.text = noteTextController.value.text;
    newReservation.duration =
        slotDurationString(selectedDuration + durations[0]);
    DateFormat df = new DateFormat('HH:mm');
    var time = df.parse(selectedTimeLabel);
    newReservation.time = new DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, time.hour, time.minute);

    var result = await bloc.createReservation(newReservation);
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: ((BuildContext context) =>
            ReservationDetailPage(reservation: result))));
  }
}
