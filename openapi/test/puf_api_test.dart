import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PufApi
void main() {
  final instance = Openapi().getPufApi();

  group(PufApi, () {
    //Future<String> pufDefaultAction(String id) async
    test('test pufDefaultAction', () async {
      // TODO
    });

    //Future<String> pufLag(String id) async
    test('test pufLag', () async {
      // TODO
    });

  });
}
