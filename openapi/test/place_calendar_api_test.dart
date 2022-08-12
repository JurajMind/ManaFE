import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PlaceCalendarApi
void main() {
  final instance = Openapi().getPlaceCalendarApi();

  group(PlaceCalendarApi, () {
    //Future<Dto> placeCalendarCreatePlaceEventFromFacebook(String url) async
    test('test placeCalendarCreatePlaceEventFromFacebook', () async {
      // TODO
    });

    //Future<Dto> placeCalendarDeletePlaceDay(int dayId) async
    test('test placeCalendarDeletePlaceDay', () async {
      // TODO
    });

    //Future<Dto> placeCalendarDeletePlaceEvent(int eventId) async
    test('test placeCalendarDeletePlaceEvent', () async {
      // TODO
    });

    //Future<PlaceEventCollection> placeCalendarFindEventsBy(int placeId, DateTime startsAfter, DateTime endsBefore, { String privacyType }) async
    test('test placeCalendarFindEventsBy', () async {
      // TODO
    });

    //Future<PlaceCalendarDto> placeCalendarGetPlaceCalendar(int placeId, { String privacyType }) async
    test('test placeCalendarGetPlaceCalendar', () async {
      // TODO
    });

    //Future<PlaceDay> placeCalendarGetPlaceDay(int placeId, int dayId, DateTime dayDate, { String privacyType }) async
    test('test placeCalendarGetPlaceDay', () async {
      // TODO
    });

    //Future<PlaceEvent> placeCalendarGetPlaceEvent(int eventId) async
    test('test placeCalendarGetPlaceEvent', () async {
      // TODO
    });

    //Future<Dto> placeCalendarSavePlaceDay(PlaceDay placeDay) async
    test('test placeCalendarSavePlaceDay', () async {
      // TODO
    });

    //Future<Dto> placeCalendarSavePlaceEvent(PlaceEvent placeEvent) async
    test('test placeCalendarSavePlaceEvent', () async {
      // TODO
    });

  });
}
