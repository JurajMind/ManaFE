import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PingApi
void main() {
  final instance = Openapi().getPingApi();

  group(PingApi, () {
    //Future<bool> pingDefaultAction(String id, { String version }) async
    test('test pingDefaultAction', () async {
      // TODO
    });

  });
}
