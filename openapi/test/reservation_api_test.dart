import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ReservationApi
void main() {
  final instance = Openapi().getReservationApi();

  group(ReservationApi, () {
    //Future<PlacesReservationsReservationDto> reservationAddLateTime(int id, int time) async
    test('test reservationAddLateTime', () async {
      // TODO
    });

    //Future<PlacesReservationsReservationDto> reservationAddTable(int id, int tableId) async
    test('test reservationAddTable', () async {
      // TODO
    });

    //Future<bool> reservationCancelReservation(int id) async
    test('test reservationCancelReservation', () async {
      // TODO
    });

    //Future<PlacesReservationsReservationDto> reservationCreate(PlacesReservationsReservationDto reservation) async
    test('test reservationCreate', () async {
      // TODO
    });

    //Future<PlacesReservationsReservationManageDto> reservationGetManagereservationsInfo(int id, DateTime date) async
    test('test reservationGetManagereservationsInfo', () async {
      // TODO
    });

    //Future<List<PlacesReservationsReservationDto>> reservationGetPersonReservations() async
    test('test reservationGetPersonReservations', () async {
      // TODO
    });

    //Future<PlacesReservationsReservationDetailDto> reservationGetReservationDetail(int id) async
    test('test reservationGetReservationDetail', () async {
      // TODO
    });

    //Future<SmartHookahServicesPlaceReservationUsageDto> reservationGetReservationUsage(int id, DateTime date) async
    test('test reservationGetReservationUsage', () async {
      // TODO
    });

    //Future<List<PlacesReservationsReservationDto>> reservationGetReservations(DateTime from, DateTime to) async
    test('test reservationGetReservations', () async {
      // TODO
    });

    //Future<PlacesReservationsReservationDto> reservationRemoveTable(int id, int tableId) async
    test('test reservationRemoveTable', () async {
      // TODO
    });

    //Future<bool> reservationUpdateReservationState(int id, String state) async
    test('test reservationUpdateReservationState', () async {
      // TODO
    });

  });
}
