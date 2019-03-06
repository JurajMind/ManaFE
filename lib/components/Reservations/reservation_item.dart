import 'package:app/pages/Places/Reservations/reservation_detail_page.dart';
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
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) {
                  return new ReservationDetailPage(reservation: reservation);
                },
              )),
          leading: new ReservationStatusIcon(reservation: reservation),
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

class ReservationStatusIcon extends StatelessWidget {
  final ReservationDto reservation;

  const ReservationStatusIcon({
    Key key,
    this.reservation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (reservation.status) {
      // Created
      case 0:
        return Icon(Icons.check_circle_outline, color: Colors.blue);
      // Canceled
      case 1:
        return Icon(Icons.cancel, color: Colors.red);
      // Denied
      case 2:
        return Icon(Icons.cancel, color: Colors.red);
      // Confirmed
      case 3:
        return Icon(Icons.check_circle_outline, color: Colors.green);
      // ConfirmationRequired
      case 6:
        return Icon(Icons.question_answer, color: Colors.orange);
      default:
        return Icon(Icons.check_circle_outline, color: Colors.red);
    }
  }
}

class ReservationItemShimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
