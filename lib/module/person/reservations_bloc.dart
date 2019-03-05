import 'package:app/app/app.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class ReservationBloc {
  static final ReservationBloc _instance = new ReservationBloc._();

  factory ReservationBloc() => ReservationBloc._instance;

  ReservationBloc._() {}

  BehaviorSubject<List<ReservationDto>> reservations =
      new BehaviorSubject<List<ReservationDto>>();

  BehaviorSubject<ReservationDetailDto> reservationDetail =
      new BehaviorSubject<ReservationDetailDto>();

  loadReservations(DateTime from, DateTime to) async {
    this.reservations.add(null);
    var result = await App.http.getReservations(from, to);
    this.reservations.add(result);
  }

    loadReservationDetail(int id) async {
      if(reservationDetail?.value?.reservation?.id != id){
        reservationDetail.add(null);
      }

    var result = await App.http.detailReservation(id);
    this.reservationDetail.add(result);
  }

  Future<ReservationDto> createReservation(
      ReservationDto newReservation) async {
    var createdReservation = await App.http.createReservation(newReservation);
    if (createdReservation != null) {
      var oldReservations = this.reservations.value;
      oldReservations.add(createdReservation);
      this.reservations.add(oldReservations);
    }

    return createdReservation;
  }
}
