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
  }

  BehaviorSubject<List<PlacesReservationsReservationDto>> reservations =
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
    this.reservations.add(order);
  }

  @override
  handleCall(String method, List<dynamic> data) {
    switch (method) {
      case 'reservationChanged':
        {
          this.loadReservations(
              DateTime.now().subtract(Duration(days: 20)), DateTime.now());
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
