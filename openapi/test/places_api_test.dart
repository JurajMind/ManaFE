import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PlacesApi
void main() {
  final instance = Openapi().getPlacesApi();

  group(PlacesApi, () {
    //Future<PlaceDto> placesAddFlags(int placeId, List<String> flags) async
    test('test placesAddFlags', () async {
      // TODO
    });

    //Future<PlaceDto> placesAddPlace(PlaceDto importedPlace) async
    test('test placesAddPlace', () async {
      // TODO
    });

    //Future placesFixLocation() async
    test('test placesFixLocation', () async {
      // TODO
    });

    //Future<PlacesPlaceDashboardDto> placesGetDashboardData(int placeId) async
    test('test placesGetDashboardData', () async {
      // TODO
    });

    //Future<PlaceDto> placesGetPlaceInfo(int id) async
    test('test placesGetPlaceInfo', () async {
      // TODO
    });

    //Future<PlaceMenuDto> placesGetPlaceMenu(int id) async
    test('test placesGetPlaceMenu', () async {
      // TODO
    });

    //Future<Object> placesImportPlaces() async
    test('test placesImportPlaces', () async {
      // TODO
    });

    //Future<Object> placesImportPlacesFromMap() async
    test('test placesImportPlacesFromMap', () async {
      // TODO
    });

    //Future<NearbyPlacesDto> placesSearchNearby({ int page, int pageSize, double lat, double lng, double radius }) async
    test('test placesSearchNearby', () async {
      // TODO
    });

  });
}
