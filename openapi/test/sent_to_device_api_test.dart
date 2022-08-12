import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SentToDeviceApi
void main() {
  final instance = Openapi().getSentToDeviceApi();

  group(SentToDeviceApi, () {
    //Future sentToDeviceDefaultAction(String id, String command, { String data }) async
    test('test sentToDeviceDefaultAction', () async {
      // TODO
    });

  });
}
