import 'package:app/components/Callendar/flutter_calendar.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/person/reservations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;

class ReservationsPage extends StatefulWidget {
  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  DateTime _fromDate;
  DateTime _toDate;
  ReservationBloc reservationBloc;

  @override
  void initState() {
    super.initState();
    var today = DateTime.now();
    _fromDate = DateTime(today.year, today.month, 1);
    _toDate = DateTime(today.year, today.month + 1, 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (reservationBloc == null) {
      reservationBloc = DataProvider.getData(context).reservationBloc;
    }
    reservationBloc.loadReservations(_fromDate, _toDate);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          AppBar(),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: new Calendar(
                    initialCalendarDateOverride: DateTime.now(),
                    isExpandable: true,
                    onDateSelected: (date) {},
                  ),
                ),
                Placeholder()
              ],
            ),
          )
        ],
      ),
    );
  }
}
