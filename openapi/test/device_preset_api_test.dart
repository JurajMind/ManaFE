import 'package:openapi/api.dart';
import 'package:test/test.dart';


/// tests for DevicePresetApi
void main() {
  var instance = new DevicePresetApi();

  group('tests for DevicePresetApi', () {
    //Future<Object> devicePresetDeletePreset(int id) async 
    test('test devicePresetDeletePreset', () async {
      // TODO
    });

    //Future<DevicePresetDto> devicePresetGetPreset(int id) async 
    test('test devicePresetGetPreset', () async {
      // TODO
    });

    //Future<List<DevicePresetDto>> devicePresetGetUserPresets() async 
    test('test devicePresetGetUserPresets', () async {
      // TODO
    });

    //Future<DevicePresetDto> devicePresetSaveDevicePreset(String deviceId, String name, { bool addToPerson, bool setDefault }) async 
    test('test devicePresetSaveDevicePreset', () async {
      // TODO
    });

    //Future<DevicePresetDto> devicePresetSaveSessionPreset(String sessionCode, String name, { bool addToPerson, bool setDefault }) async 
    test('test devicePresetSaveSessionPreset', () async {
      // TODO
    });

    //Future devicePresetSetDefault(int presetId) async 
    test('test devicePresetSetDefault', () async {
      // TODO
    });

    //Future devicePresetUseDefault(String sessionId) async 
    test('test devicePresetUseDefault', () async {
      // TODO
    });

    //Future devicePresetUsePreset(String sessionId, int presetId) async 
    test('test devicePresetUsePreset', () async {
      // TODO
    });

  });
}
