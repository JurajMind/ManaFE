import 'package:app/Helpers/date_utils.dart';
import 'package:app/Helpers/type_helper.dart';
import 'package:app/app/app.dart';
import 'package:app/components/Common/labeled_value.dart';
import 'package:app/components/Media/media.widget.dart';
import 'package:app/components/Places/navigate_button.dart';
import 'package:app/components/Places/place_detail.dart';
import 'package:app/components/Places/place_map.dart';
import 'package:app/components/Reservations/reservation_item.dart';
import 'package:app/models/extensions.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class ReservationDetailPage extends StatefulWidget {
  final PlacesReservationsReservationDto reservation;

  const ReservationDetailPage({Key key, this.reservation}) : super(key: key);

  @override
  State<ReservationDetailPage> createState() => _ReservationDetailState();
}

class _ReservationDetailState extends State<ReservationDetailPage> {
  BehaviorSubject<PlacesReservationsReservationDetailDto> reservationDetail =
      new BehaviorSubject<PlacesReservationsReservationDetailDto>();

  ScrollController controller;
  bool lateReservationLoading = false;
  final double _appBarHeight = 150.0;
  @override
  void initState() {
    super.initState();
    controller = new ScrollController();
    App.http
        .reservationDetail(widget.reservation.id)
        .then((data) => this.reservationDetail.add(data));
  }

  @override
  Widget build(BuildContext context) {
    // timeDilation = 12.5;
    return Scaffold(
      body: SafeArea(
          top: false,
          child: Container(
            color: Colors.black,
            child: CustomScrollView(
              controller: controller,
              slivers: <Widget>[
                new SliverAppBar(
                  backgroundColor: Colors.black,
                  centerTitle: true,
                  expandedHeight: _appBarHeight,
                  flexibleSpace: new FlexibleSpaceBar(
                    title: Text(widget.reservation.name),
                    centerTitle: true,
                    background: new Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        StreamBuilder<PlacesReservationsReservationDetailDto>(
                            stream: this.reservationDetail,
                            builder: (context, snapshot) {
                              return snapshot.data == null
                                  ? Container(
                                      height: _appBarHeight,
                                    )
                                  : new Image(
                                      image: new CachedNetworkImageProvider(
                                          Extensions.getFullPlaceImage(
                                              snapshot.data.place,
                                              MediaSize.Large)),
                                      fit: BoxFit.cover,
                                      height: _appBarHeight,
                                    );
                            })
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: new SliverChildListDelegate(<Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Hero(
                      tag: 'reservation_${widget.reservation.id.toString()}',
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: new Border.all(color: Colors.white),
                                borderRadius: new BorderRadius.all(
                                    const Radius.circular(40.0)),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      LabeledValue(
                                        DateUtils.toStringDate(
                                            widget.reservation.time),
                                        icon: Icon(Icons.calendar_today),
                                        label: AppTranslations.of(context)
                                                .text("reservations.date") +
                                            " : ",
                                      ),
                                      LabeledValue(
                                        DateUtils.toStringShortTime(
                                            widget.reservation.time),
                                        icon: Icon(Icons.timer),
                                        label: AppTranslations.of(context)
                                                .text("reservations.time") +
                                            " : ",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      LabeledValue(widget.reservation.duration,
                                          icon: Icon(Icons.timelapse),
                                          label: AppTranslations.of(context)
                                                  .text(
                                                      "reservations.duration") +
                                              " : "),
                                      LabeledValue(
                                        widget.reservation.persons.toString(),
                                        icon: Icon(Icons.person),
                                        label: AppTranslations.of(context)
                                                .text("reservations.persons") +
                                            " : ",
                                      ),
                                    ],
                                  ),
                                  widget.reservation.text == null
                                      ? Container()
                                      : Row(
                                          children: <Widget>[
                                            Text(widget.reservation.text)
                                          ],
                                        ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        widget.reservation.status != 1
                                            ? MainAxisAlignment.spaceAround
                                            : MainAxisAlignment.center,
                                    children: <Widget>[
                                      Flex(
                                        direction: Axis.horizontal,
                                        children: <Widget>[
                                          new ReservationStatusIcon(
                                              reservation: widget.reservation),
                                          Text(
                                            ReservationStatusIcon.stateToText(
                                                widget.reservation.status,
                                                context),
                                            style: Theme.of(context)
                                                .textTheme
                                                .display2,
                                          )
                                        ],
                                      ),
                                      widget.reservation.status == 1
                                          ? Container()
                                          : OutlineButton.icon(
                                              shape: new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          30.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 1),
                                              icon: Icon(Icons.cancel,
                                                  color: Colors.red),
                                              label: Text(
                                                AppTranslations.of(context)
                                                    .text("common.cancel"),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .display2,
                                              ),
                                              onPressed: () => _showDialog(),
                                            )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.all(
                                    const Radius.circular(40.0)),
                              ),
                              child: StreamBuilder<
                                      PlacesReservationsReservationDetailDto>(
                                  stream: this.reservationDetail,
                                  builder: (context, snapshot) {
                                    var simplePlace =
                                        toSimpePlace(snapshot?.data?.place);
                                    return simplePlace == null
                                        ? Container()
                                        : Container(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                Text(simplePlace.name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .display1
                                                        .merge(TextStyle(
                                                            color:
                                                                Colors.black))),
                                                Text(
                                                    Extensions.adress(
                                                        simplePlace.address),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .display2
                                                        .merge(TextStyle(
                                                            color:
                                                                Colors.black))),
                                                new Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: PlaceInfo(
                                                            place: simplePlace),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    Expanded(
                                                        flex: 1,
                                                        child: PlaceMap(
                                                          place: simplePlace,
                                                        ))
                                                  ],
                                                ),
                                                NavigateButton(
                                                    place: simplePlace)
                                              ],
                                            ),
                                          );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (widget.reservation.status != 1)
                      Container(
                        decoration: BoxDecoration(
                          border: new Border.all(color: Colors.white),
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(40.0)),
                        ),
                        child: ExpansionTile(
                          title: Center(
                              child: Text(
                            '${AppTranslations.of(context).text("reservations.i_will_be_late")} ${(widget.reservation.lateDuration != 0 && widget.reservation.lateDuration != null) ? widget.reservation.lateDuration.toString() + ' minutes' : ''}',
                            style: Theme.of(context).textTheme.display2,
                          )),
                          leading: !lateReservationLoading
                              ? Icon(Icons.watch_later, color: Colors.white)
                              : CircularProgressIndicator(),
                          onExpansionChanged: (expansion) {},
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new LateTimeButton(
                                  time: 10,
                                  selectedTime: widget.reservation.lateDuration,
                                  onChanged: (time) => setLateTime(time),
                                ),
                                new LateTimeButton(
                                  time: 15,
                                  selectedTime: widget.reservation.lateDuration,
                                  onChanged: (time) => setLateTime(time),
                                ),
                                new LateTimeButton(
                                  time: 30,
                                  selectedTime: widget.reservation.lateDuration,
                                  onChanged: (time) => setLateTime(time),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    SizedBox(height: 100),
                  ]),
                )
              ],
            ),
          )),
    );
  }

  setLateTime(int time) {
    setState(() {
      lateReservationLoading = true;
    });
    App.http.addLateReservation(widget.reservation.id, time).then((onValue) {
      setState(() {
        widget.reservation.lateDuration = onValue.lateDuration;
        lateReservationLoading = false;
      });
    });
  }

  // user defined function
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Center(
              child:
                  new Text(AppTranslations.of(context).text("common.cancel"))),
          content: new Text(AppTranslations.of(context)
              .text("reservations.cancel_reservation_confirm")),
          actions: <Widget>[
            OutlineButton.icon(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              borderSide: BorderSide(color: Colors.white, width: 1),
              icon: Icon(Icons.cancel, color: Colors.red),
              label: Text(
                AppTranslations.of(context).text("common.cancel"),
                style: Theme.of(context).textTheme.display2,
              ),
              onPressed: () async {
                setState(() {
                  widget.reservation.status = 1;
                });
                await App.http.cancelReservation(widget.reservation.id);
                Navigator.of(context).pop();
              },
            ),
            OutlineButton.icon(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              borderSide: BorderSide(color: Colors.white, width: 1),
              icon: Icon(Icons.check, color: Colors.green),
              label: Text(
                AppTranslations.of(context).text("common.keep"),
                style: Theme.of(context).textTheme.display2,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            // usually buttons at the bottom of the dialog
          ],
        );
      },
    );
  }
}

class LateTimeButton extends StatelessWidget {
  final int time;
  final int selectedTime;
  final ValueChanged<int> onChanged;
  const LateTimeButton({
    Key key,
    this.time,
    this.selectedTime,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = time == selectedTime ? Colors.red : Colors.white;
    return OutlineButton(
        color: Colors.red,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        borderSide: BorderSide(color: color, width: 1),
        child: Text(
          "${time.toString()} min",
          style: Theme.of(context).textTheme.display2.apply(color: color),
        ),
        onPressed: () => time != selectedTime ? onChanged(time) : ({}));
  }
}
