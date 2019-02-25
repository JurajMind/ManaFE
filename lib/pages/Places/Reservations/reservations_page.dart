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
    _fromDate = DateTime(today.year, today.month, 1);
    _toDate = DateTime(today.year, today.month + 1, 0);
    final now = DateTime.now();
    _selectedDay = DateTime(now.year, now.month, now.day);
    _events = {
      DateTime(2019, 2, 22): ['Event A', 'Event B', 'Event C'],
      DateTime(2019, 2, 23): ['Event A'],
      DateTime(2019, 2, 24): ['Event B', 'Event C'],
      DateTime(2019, 3, 1): [
        'Event A',
        'Event B',
        'Event C',
        'Event D',
        'Event E',
        'Event F',
        'Event G'
      ],
      DateTime(2019, 1, 29):
          Set.from(['Event A', 'Event A', 'Event B']).toList(),
      DateTime(2019, 1, 30): ['Event A', 'Event A', 'Event B'],
    };
    _selectedEvents = _events[_selectedDay] ?? [];
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
          AppBar(
            backgroundColor: Colors.black,
          ),
          StreamBuilder<List<ReservationDto>>(
              stream: reservationBloc.reservations,
              builder: (context, snapshot) {
                    var childrens = new List<Widget>();
                childrens.add(_buildTableCalendar());
                childrens.add(
                  const SizedBox(height: 8.0),
                );
                childrens.addAll(_buildEventList(snapshot.data));
                return Expanded(
                  child: ListView(
                    children: childrens,
                  ),
                );
              })
        ],
      ),
    );
  }

  // Configure the calendar here
  Widget _buildTableCalendar() {
    return Calendar(
        isExpandable: true,
        showTodayAction: false,
        showCalendarPickerIcon: false,
        dateStyles: TextStyle(color: Colors.red));
  }

  List<Widget> _buildEventList(List<ReservationDto> data) {
    if(data == null){
      return List<Widget>.generate(10, (int index){return ReservationItemShimer(); })
    }
    return data
        .map((r) => ReservationItem(reservation:r))
        .toList();
  }
}
