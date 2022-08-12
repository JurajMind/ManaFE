import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PlaceAdminApi
void main() {
  final instance = Openapi().getPlaceAdminApi();

  group(PlaceAdminApi, () {
    //Future<PlaceSimpleDto> placeAdminChangeState(int id, int newState) async
    test('test placeAdminChangeState', () async {
      // TODO
    });

    //Future<List<PlaceSimpleDto>> placeAdminGetWaitingPlaces() async
    test('test placeAdminGetWaitingPlaces', () async {
      // TODO
    });

  });
}
