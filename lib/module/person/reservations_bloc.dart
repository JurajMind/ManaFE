import 'package:app/Helpers/helpers.dart';
import 'package:app/app/app.dart';
import 'package:app/module/signal_bloc.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';
import 'package:rxdart/rxdart.dart';

class ReservationBloc extends SignalBloc {
  static final ReservationBloc _instance = new ReservationBloc._();

  factory ReservationBloc() => ReservationBloc._instance;

  ReservationBloc._() {
    this.connect();

    var date = DateTime.now();
    var _fromDate = DateTime(date.year, date.month, 1);
    var _toDate = DateTime(date.year, date.month + 1, 0);
    loadReservations(_fromDate, _toDate);
  }

  BehaviorSubject<List<PlacesReservationsReservationDto>> reservations =
      new BehaviorSubject<List<PlacesReservationsReservationDto>>();

  BehaviorSubject<List<PlacesReservationsReservationDto>> dynamicReservaions =
      new BehaviorSubject<List<PlacesReservationsReservationDto>>();

  BehaviorSubject<PlacesReservationsReservationDetailDto> reservationDetail =
      new BehaviorSubject<PlacesReservationsReservationDetailDto>();

  DateTime from;
  DateTime to;

  loadReservations(DateTime from, DateTime to) async {
    if (compareDate(from, from) != 0 || compareDate(to, to) != 0) {
      this.reservations.add(null);
    }

    var result = await App.http.getReservations(from, to);
    var order = new Collection(result)
        .orderBy((keySelector) => keySelector.time)
        .toList();

    if (from.month == DateTime.now().month) {
      this.reservations.add(order);
    }

    this.dynamicReservaions.add(order);
  }

  @override
  handleCall(String method, List<dynamic> data) {
    switch (method) {
      case 'ReservationChanged':
        {
          var date = DateTime.now();

          try {
            date = DateTime.parse(data[0]['Time']);
          } on Exception {}
          var from = new DateTime(date.year, date.month, 1);
          var to = new DateTime(date.year, date.month + 1, 1)
              .subtract(new Duration(days: 1));
          this.loadReservations(from, to);
          break;
        }
    }
  }

  loadReservationDetail(int id) async {
    if (reservationDetail?.value?.reservation?.id != id) {
      reservationDetail.add(null);
    }

    var result = await App.http.detailReservation(id);
    this.reservationDetail.add(result);
  }

  Future<PlacesReservationsReservationDto> createReservation(
      PlacesReservationsReservationDto newReservation) async {
    var createdReservation = await App.http.createReservation(newReservation);
    if (createdReservation != null) {
      var oldReservations = this.reservations.value ??
          new List<PlacesReservationsReservationDto>();
      oldReservations.add(createdReservation);
      this.reservations.add(oldReservations);
    }

    return createdReservation;
  }
}
