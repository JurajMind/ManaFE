// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_controllers_api_device_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahControllersApiDeviceInfoResponse
    _$SmartHookahControllersApiDeviceInfoResponseFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'SmartHookahControllersApiDeviceInfoResponse',
          json,
          ($checkedConvert) {
            final val = SmartHookahControllersApiDeviceInfoResponse(
              picture: $checkedConvert(
                  'Picture',
                  (v) => v == null
                      ? null
                      : DeviceDevicePictureDto.fromJson(
                          v as Map<String, dynamic>)),
            );
            return val;
          },
          fieldKeyMap: const {'picture': 'Picture'},
        );

Map<String, dynamic> _$SmartHookahControllersApiDeviceInfoResponseToJson(
    SmartHookahControllersApiDeviceInfoResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Picture', instance.picture?.toJson());
  return val;
}
