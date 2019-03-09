import 'package:app/app/app.dart';
import 'package:app/module/signal_bloc.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class ReservationBloc extends SignalBloc {
  static final ReservationBloc _instance = new ReservationBloc._();

  factory ReservationBloc() => ReservationBloc._instance;

  ReservationBloc._() {
    this.connect();
  }

  BehaviorSubject<List<ReservationDto>> reservations =
      new BehaviorSubject<List<ReservationDto>>();

  loadReservations(DateTime from, DateTime to) async {
    this.reservations.add(null);
    var result = await App.http.getReservations(from, to);
    this.reservations.add(result);
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

  Future<ReservationDto> createReservation(
      ReservationDto newReservation) async {
    var createdReservation = await App.http.createReservation(newReservation);
    if (createdReservation != null) {
      var oldReservations =
          this.reservations.value ?? new List<ReservationDto>();
      oldReservations.add(createdReservation);
      this.reservations.add(oldReservations);
    }

    return createdReservation;
  }
}
