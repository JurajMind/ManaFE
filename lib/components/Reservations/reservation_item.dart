import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openapi/api.dart';

class ReservationItem extends StatelessWidget {
  final ReservationDto reservation;

  const ReservationItem({Key key, this.reservation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var dateFormater = new DateFormat('d.M.yyyy');
    var timeFormater = new DateFormat('h:mm');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16.0)),
        child: ListTile(
          onTap: () {},
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(child: Text(dateFormater.format(reservation.time))),
              Expanded(child: Text(timeFormater.format(reservation.time))),
              Expanded(child: Text(reservation.duration)),
              Expanded(child: Text(reservation.persons.toString())),
            ],
          ),
          subtitle: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(reservation.placeName ?? ""),
              Text(reservation.text ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}

class ReservationItemShimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
