import 'package:app/Helpers/date_utils.dart';
import 'package:app/components/Common/labeled_value.dart';
import 'package:app/pages/Places/Reservations/reservation_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openapi/api.dart';

class ReservationItem extends StatelessWidget {
  final ReservationDto reservation;

  const ReservationItem({Key key, this.reservation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Hero(
        tag: 'reservation_${reservation.id.toString()}',
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(16.0)),
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new ReservationDetailPage(reservation: reservation);
                  },
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: new ReservationStatusIcon(reservation: reservation),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                                flex: 2,
                                child: LabeledValue(
                                  Utils.toStringDate(reservation.time),
                                  icon: Icon(Icons.calendar_today),
                                  padding: EdgeInsets.only(),
                                )),
                            Expanded(
                                flex: 2,
                                child: LabeledValue(
                                  Utils.toStringShortTime(reservation.time),
                                  icon: Icon(Icons.timer),
                                  padding: EdgeInsets.only(),
                                )),
                            Expanded(
                                flex: 2,
                                child: LabeledValue(
                                  reservation.duration,
                                  icon: Icon(Icons.timelapse),
                                  padding: EdgeInsets.only(),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: LabeledValue(
                                  reservation.persons.toString(),
                                  icon: Icon(Icons.person),
                                  padding: EdgeInsets.only(),
                                )),
                            Expanded(
                                flex: 5,
                                child: LabeledValue(
                                  reservation.placeName ?? "",
                                  icon: Icon(Icons.place),
                                )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReservationStatusIcon extends StatelessWidget {
  static String stateToText(ReservationDto reservation) {
    switch (reservation.status) {
      // Created
      case 0:
        return "Created";
      // Canceled
      case 1:
        return "Canceled";
      // Denied
      case 2:
        return "Denied";
      // Confirmed
      case 3:
        return "Confirmed";
      // ConfirmationRequired
      case 6:
        return "Confirmation required";
      default:
        return reservation.status.toString();
    }
  }

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
