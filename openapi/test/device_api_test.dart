import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DeviceApi
void main() {
  final instance = Openapi().getDeviceApi();

  group(DeviceApi, () {
    //Future<DeviceSimpleDto> deviceAddDevice(String id, String code, String newName) async
    test('test deviceAddDevice', () async {
      // TODO
    });

    //Future<Object> deviceChangeAnimation(String id, SmartHookahModelsParameterObjectsChangeAnimation model) async
    test('test deviceChangeAnimation', () async {
      // TODO
    });

    //Future<Object> deviceChangeBrightness(String id, SmartHookahModelsParameterObjectsChangeBrightness model) async
    test('test deviceChangeBrightness', () async {
      // TODO
    });

    //Future<Object> deviceChangeColor(String id, SmartHookahModelsParameterObjectsChangeColor model) async
    test('test deviceChangeColor', () async {
      // TODO
    });

    //Future<Object> deviceChangeMode(String id, int mode) async
    test('test deviceChangeMode', () async {
      // TODO
    });

    //Future<DeviceSimpleDto> deviceChangeName(String id, String newName) async
    test('test deviceChangeName', () async {
      // TODO
    });

    //Future<Object> deviceChangeSpeed(String id, SmartHookahModelsParameterObjectsChangeSpeed model) async
    test('test deviceChangeSpeed', () async {
      // TODO
    });

    //Future<List<SmokeSessionSimpleDto>> deviceGetDeviceSessions(int id, { int pageSize, int page }) async
    test('test deviceGetDeviceSessions', () async {
      // TODO
    });

    //Future<List<DeviceDevicePictureDto>> deviceGetPictures() async
    test('test deviceGetPictures', () async {
      // TODO
    });

    //Future<DeviceSettingDto> deviceGetSetting(String id) async
    test('test deviceGetSetting', () async {
      // TODO
    });

    //Future<SmartHookahControllersApiDeviceInfoResponse> deviceInfo(int id) async
    test('test deviceInfo', () async {
      // TODO
    });

    //Future<Object> devicePing(String id) async
    test('test devicePing', () async {
      // TODO
    });

    //Future<bool> devicePromptUpdate(int id, int updateId) async
    test('test devicePromptUpdate', () async {
      // TODO
    });

    //Future<DeviceSimpleDto> deviceRemoveDevice(String id) async
    test('test deviceRemoveDevice', () async {
      // TODO
    });

    //Future<Object> deviceRestart(String id) async
    test('test deviceRestart', () async {
      // TODO
    });

    //Future<bool> deviceSetPicture(int id, int pictureId) async
    test('test deviceSetPicture', () async {
      // TODO
    });

    //Future<Object> deviceShowQrCode(String id) async
    test('test deviceShowQrCode', () async {
      // TODO
    });

    //Future<Object> deviceSleep(String id) async
    test('test deviceSleep', () async {
      // TODO
    });

    //Future<List<DeviceUpdateDto>> deviceUpdates() async
    test('test deviceUpdates', () async {
      // TODO
    });

  });
}
