import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PersonApi
void main() {
  final instance = Openapi().getPersonApi();

  group(PersonApi, () {
    //Future<PipeAccesorySimpleDto> personAddMyGear(int id, { int count }) async
    test('test personAddMyGear', () async {
      // TODO
    });

    //Future personAddNotificationToken(String token) async
    test('test personAddNotificationToken', () async {
      // TODO
    });

    //Future<SmokeSessionSimpleDto> personAssignSession(int id) async
    test('test personAssignSession', () async {
      // TODO
    });

    //Future<bool> personDeleteMyGear(int id, { int count }) async
    test('test personDeleteMyGear', () async {
      // TODO
    });

    //Future<PersonActiveDataDto> personGetPersonActiveData() async
    test('test personGetPersonActiveData', () async {
      // TODO
    });

    //Future<List<DeviceSimpleDto>> personGetPersonDevices() async
    test('test personGetPersonDevices', () async {
      // TODO
    });

    //Future<PersonInfoDto> personGetPersonInfo() async
    test('test personGetPersonInfo', () async {
      // TODO
    });

    //Future<List<SmokeSessionSimpleDto>> personGetPersonSessions() async
    test('test personGetPersonSessions', () async {
      // TODO
    });

    //Future<List<PipeAccesorySimpleDto>> personGetRecentAccessories(int sessionCount) async
    test('test personGetRecentAccessories', () async {
      // TODO
    });

    //Future<List<PipeAccesorySimpleDto>> personMyGear({ String type }) async
    test('test personMyGear', () async {
      // TODO
    });

    //Future personTestNotification() async
    test('test personTestNotification', () async {
      // TODO
    });

    //Future<bool> personUnAssignSession(int id) async
    test('test personUnAssignSession', () async {
      // TODO
    });

  });
}
