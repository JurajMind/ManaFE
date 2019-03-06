import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class ReservationDetailPage extends StatefulWidget {
  final ReservationDto reservation;

  const ReservationDetailPage({Key key, this.reservation}) : super(key: key);

  @override
  State<ReservationDetailPage> createState() => _ReservationDetailState();
}

class _ReservationDetailState extends State<ReservationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              backgroundColor: Colors.black,
              title: Text(widget.reservation.id.toString()),
              centerTitle: true,
            ),
            SliverList(
              delegate: new SliverChildListDelegate(
                  <Widget>[Text(widget.reservation.persons.toString())]),
            )
          ],
        ));
  }
}
