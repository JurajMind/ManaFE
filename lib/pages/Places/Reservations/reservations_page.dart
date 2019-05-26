import 'package:app/Helpers/helpers.dart';
import 'package:app/components/Callendar/flutter_calendar.dart';
import 'package:app/components/Reservations/reservation_item.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/person/reservations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';

class ReservationsPage extends StatefulWidget {
  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  DateTime _fromDate;
  DateTime _toDate;
  ReservationBloc reservationBloc;
  DateTime _selectedDay;
  Map<DateTime, List> _events;
  int reservationFilter = -1;

  @override
  void initState() {
    super.initState();
    _selectedDay = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (reservationBloc == null) {
      reservationBloc = DataProvider.getData(context).reservationBloc;
    }
  }

  void loadReservation(DateTime date) {
    _fromDate = DateTime(date.year, date.month, 1);
    _toDate = DateTime(date.year, date.month + 1, 0);
    reservationBloc.loadReservations(_fromDate, _toDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(height: 55, color: Colors.transparent),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('RESERVATIONS'),
      ),
      body: SafeArea(
        child: StreamBuilder<List<PlacesReservationsReservationDto>>(
            stream: reservationBloc.dynamicReservaions,
            builder: (context, snapshot) {
              var filteredReservations = _selectedDay == null
                  ? snapshot.data
                  : snapshot.data
                      .where((d) => compareDate(d.time, _selectedDay) == 0)
                      .toList();
              var childrens = new List<Widget>();
              childrens.add(_buildTableCalendar(snapshot.data));

              childrens.add(Center(
                child: new ReservationFilterWidget(
                  reservationFilter: reservationFilter,
                  onChanged: (index) => {
                        setState(() {
                          reservationFilter = index;
                        })
                      },
                ),
              ));
              childrens.addAll(_buildEventList(filteredReservations));
              return Stack(
                children: <Widget>[
                  ListView(
                    children: childrens,
                  ),
                ],
              );
            }),
      ),
    );
  }

  // Configure the calendar here
  Widget _buildTableCalendar(List<PlacesReservationsReservationDto> data) {
    _events = new Map<DateTime, List<String>>();
    if (data != null) {
      data.forEach((f) {
        var date = new DateTime(f.time.year, f.time.month, f.time.day);
        var dateEvent = _events[date] as List<String>;
        if (dateEvent == null) {
          dateEvent = new List<String>.from([f.id.toString()]);
        } else {
          dateEvent.add(f.id.toString());
        }
        _events[date] = dateEvent;
      });
    }

    return Calendar(
        events: _events,
        isExpandable: true,
        showTodayAction: false,
        showCalendarPickerIcon: false,
        highlightToday: true,
        doubleClick: true,
        initialCalendarDateOverride: _selectedDay,
        onDateSelected: (date) => changeDate(date),
        dateStyles: TextStyle(color: Colors.red));
  }

  List<Widget> _buildEventList(List<PlacesReservationsReservationDto> data) {
    if (data == null) {
      return List<Widget>.generate(10, (int index) {
        return ReservationItemShimer();
      });
    }

    var reservations = new Collection(data);
    if (reservationFilter != -1) {
      reservations = reservations
          .where$1((p, _) => p.status == reservationFilter)
          .toCollection();
    }
    return reservations
        .reverse()
        .toList()
        .map((r) => ReservationItem(reservation: r))
        .toList();
  }

  void changeDate(DateTime newDate) {
    print(newDate);
    if (newDate != null &&
        _selectedDay != null &&
        _selectedDay.month != newDate.month) {
      loadReservation(newDate);
    }
    setState(() {
      _selectedDay = newDate;
    });
  }
}

class ReservationFilterWidget extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final int reservationFilter;
  static List<int> reservationFilterSet = [-1, 3, 6, 1];
  const ReservationFilterWidget({
    Key key,
    this.onChanged,
    this.reservationFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16.0)),
      child: new InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ReservationStatusIcon(
              reservationInt: reservationFilter,
            ),
            SizedBox(
              width: 10,
            ),
            Text(ReservationStatusIcon.stateToText(reservationFilter))
          ],
        ),
        onTap: () {
          var index = reservationFilterSet.indexOf(reservationFilter);
          index = (index + 1) % reservationFilterSet.length;
          onChanged(reservationFilterSet[index]);
        },
      ),
    );
  }
}
