import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AnimApi
void main() {
  final instance = Openapi().getAnimApi();

  group(AnimApi, () {
    //Future<String> animDefaultAction(String id) async
    test('test animDefaultAction', () async {
      // TODO
    });

  });
}
