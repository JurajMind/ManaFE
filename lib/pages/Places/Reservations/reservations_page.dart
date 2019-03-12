import 'package:app/Helpers/helpers.dart';
import 'package:app/components/Callendar/flutter_calendar.dart';
import 'package:app/components/Reservations/reservation_item.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/person/reservations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

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
  List _selectedEvents;

  @override
  void initState() {
    super.initState();
    var today = DateTime.now();

    final now = DateTime.now();
    _selectedDay = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (reservationBloc == null) {
      reservationBloc = DataProvider.getData(context).reservationBloc;
    }
    loadReservation(DateTime.now());
  }

  void loadReservation(DateTime date) {
    _fromDate = DateTime(date.year, date.month, 1);
    _toDate = DateTime(date.year, date.month + 1, 0);
    reservationBloc.loadReservations(_fromDate, _toDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('RESERVATIONS'),
      ),
      body: SafeArea(
        child: StreamBuilder<List<ReservationDto>>(
            stream: reservationBloc.reservations,
            builder: (context, snapshot) {
              var filteredReservations = _selectedDay == null
                  ? snapshot.data
                  : snapshot.data
                      .where((d) => compareDate(d.time, _selectedDay) == 0)
                      .toList();
              var childrens = new List<Widget>();
              childrens.add(_buildTableCalendar(snapshot.data));
              childrens.add(
                const SizedBox(height: 8.0),
              );
              childrens.addAll(_buildEventList(filteredReservations));
              return ListView(
                children: childrens,
              );
            }),
      ),
    );
  }

  // Configure the calendar here
  Widget _buildTableCalendar(List<ReservationDto> data) {
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
        initialCalendarDateOverride: null,
        onDateSelected: (date) => changeDate(date),
        dateStyles: TextStyle(color: Colors.red));
  }

  List<Widget> _buildEventList(List<ReservationDto> data) {
    if (data == null) {
      return List<Widget>.generate(10, (int index) {
        return ReservationItemShimer();
      });
    }
    return data.map((r) => ReservationItem(reservation: r)).toList();
  }

  void changeDate(DateTime newDate) {
    print(newDate);
    setState(() {
      _selectedDay = newDate;
    });
    if (newDate != null && _selectedDay.month != newDate.month) {
      loadReservation(newDate);
    }
  }
}
