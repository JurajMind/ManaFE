// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_device_picture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceDevicePictureDto _$DeviceDevicePictureDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DeviceDevicePictureDto',
      json,
      ($checkedConvert) {
        final val = DeviceDevicePictureDto(
          id: $checkedConvert('Id', (v) => v as int?),
          width: $checkedConvert('Width', (v) => v as int?),
          height: $checkedConvert('Height', (v) => v as int?),
          inlinePicture: $checkedConvert('InlinePicture', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'width': 'Width',
        'height': 'Height',
        'inlinePicture': 'InlinePicture'
      },
    );

Map<String, dynamic> _$DeviceDevicePictureDtoToJson(
    DeviceDevicePictureDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Width', instance.width);
  writeNotNull('Height', instance.height);
  writeNotNull('InlinePicture', instance.inlinePicture);
  return val;
}
