import 'package:app/app/app.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class ReservationBloc {
  static final ReservationBloc _instance = new ReservationBloc._();

  factory ReservationBloc() => ReservationBloc._instance;

  ReservationBloc._() {}

  BehaviorSubject<List<ReservationDto>> reservations =
      new BehaviorSubject<List<ReservationDto>>();

  loadReservations(DateTime from, DateTime to) async {
    var result = await App.http.getReservations(from, to);
    this.reservations.add(result);
  }
}
