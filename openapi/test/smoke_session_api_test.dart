import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SmokeSessionApi
void main() {
  final instance = Openapi().getSmokeSessionApi();

  group(SmokeSessionApi, () {
    //Future<SmokeSessionSimpleDto> smokeSessionEndSmokeSession(String id) async
    test('test smokeSessionEndSmokeSession', () async {
      // TODO
    });

    //Future<FinishedSessionDataDto> smokeSessionGetFinishedData(int id) async
    test('test smokeSessionGetFinishedData', () async {
      // TODO
    });

    //Future<SmokeSessionMetaDataDto> smokeSessionGetMetaData(String id) async
    test('test smokeSessionGetMetaData', () async {
      // TODO
    });

    //Future<List<SmartHookahModelsDbPuf>> smokeSessionGetPufs(int id) async
    test('test smokeSessionGetPufs', () async {
      // TODO
    });

    //Future<Object> smokeSessionGetSessionCode(String id) async
    test('test smokeSessionGetSessionCode', () async {
      // TODO
    });

    //Future<InitDataDto> smokeSessionInitData(String id) async
    test('test smokeSessionInitData', () async {
      // TODO
    });

    //Future<SmokeSessionMetaDataDto> smokeSessionSaveMetaData(String id, SmokeSessionMetaDataDto model) async
    test('test smokeSessionSaveMetaData', () async {
      // TODO
    });

    //Future<Validation> smokeSessionValidate(String id) async
    test('test smokeSessionValidate', () async {
      // TODO
    });

  });
}
