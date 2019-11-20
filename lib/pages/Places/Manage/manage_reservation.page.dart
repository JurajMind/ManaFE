import 'package:app/Helpers/date_utils.dart';
import 'package:app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

import 'Components/reservation_cell.dart';

class ManageReservationPage extends StatefulWidget {
  final PlaceDto place;
  ManageReservationPage({Key key, this.place}) : super(key: key);

  @override
  _ManageReservationPageState createState() => _ManageReservationPageState();
}

class _ManageReservationPageState extends State<ManageReservationPage>
    with AutomaticKeepAliveClientMixin<ManageReservationPage> {
  BehaviorSubject<PlacesReservationsReservationManageDto> reservations =
      new BehaviorSubject();

  @override
  void initState() {
    App.http.manageReservation(widget.place.id, DateTime.now()).then((value) {
      this.reservations.add(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlacesReservationsReservationManageDto>(
        stream: reservations,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          }

          var slots = snapshot.data.endTime
                  .difference(snapshot.data.startTime)
                  .inMinutes /
              snapshot.data.timeSlotSize;

              slots ++;

          var startTime = snapshot.data.startTime;

          return Container(
              child: ListView.builder(
            itemCount: widget.place.seats.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return new ReservationRowHeader(
                  slots: slots,
                  startTime: startTime,
                );
              }

              var seat = widget.place.seats[index - 1];
              return new ReservationRow(
                seat: seat,
                slots: slots,
                start: snapshot.data.startTime,
                reservation: snapshot.data.reservations
                    .where((test) => test.seats.contains(seat.id))
                    .toList(),
                slotSize: snapshot.data.timeSlotSize,
              );
            },
          ));
        });
  }

  @override
  bool get wantKeepAlive => true;
}

class ReservationRowHeader extends StatelessWidget {
  const ReservationRowHeader({
    Key key,
    @required this.slots,
    @required this.startTime,
  }) : super(key: key);

  final double slots;
  final DateTime startTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(),
        ),
        ...List.generate(slots.toInt(), (index) {
          return Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              child: Text(
                DateUtils.toStringShortTime(
                    startTime.add(new Duration(minutes: index * 30))),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display4,
              ),
            ),
          );
        })
      ],
    );
  }
}

class ReservationRow extends StatelessWidget {
  const ReservationRow({
    Key key,
    @required this.seat,
    @required this.slots,
    @required this.reservation,
    @required this.start,
    @required this.slotSize,
  }) : super(key: key);

  final SeatDto seat;
  final double slots;
  final List<PlacesReservationsReservationDto> reservation;
  final DateTime start;
  final int slotSize;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cellWidth = size.width / (slots + 1);
    List<ColumnData> slotData = new List<ColumnData>();

    for (int i = 0; i < slots.toInt(); i++) {
      var time = start.add(new Duration(minutes: slotSize * i));
      var timeReservation = reservation.where((r) {
        return r.time.compareTo(time) == 0;
      });

      if (timeReservation.length == 0) {
        slotData.add(new ColumnData()
          ..index = i
          ..size = 1);
      } else {
       var sSize = DateUtils.parseDuration(timeReservation.first.duration)
                  .inMinutes ~/ slotSize;
        slotData.add(new ColumnData()
          ..index = i
          ..reservation = timeReservation.first
          ..size = sSize);
              i = i + sSize -1 ; 
      }
    }

    return Row(
      children: <Widget>[
        Container(
          width: cellWidth,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.white, width: 2.0),
                  right: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  )),
            ),
            constraints: BoxConstraints(maxHeight: 100, minHeight: 40),
            child: Column(
              children: <Widget>[
                Text(seat.name),
                Text(seat.capacity.toString()),
                Text(slotData.length.toString())
              ],
            )),
        ...slotData.map((d) {
          return ReservationCell(
            cellWidth: cellWidth,
            data: d,
            onAccept: (data) {
              print(data.index);
            },
          );
        })
      ],
    );
  }
}

class ColumnData {
  int index;
  int size;
  PlacesReservationsReservationDto reservation;
}
