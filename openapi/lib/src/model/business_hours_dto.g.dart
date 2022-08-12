// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_hours_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessHoursDto _$BusinessHoursDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BusinessHoursDto',
      json,
      ($checkedConvert) {
        final val = BusinessHoursDto(
          id: $checkedConvert('Id', (v) => v as int?),
          placeId: $checkedConvert('PlaceId', (v) => v as int?),
          day: $checkedConvert('Day', (v) => v as int?),
          openTine: $checkedConvert('OpenTine', (v) => v as String?),
          closeTime: $checkedConvert('CloseTime', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'placeId': 'PlaceId',
        'day': 'Day',
        'openTine': 'OpenTine',
        'closeTime': 'CloseTime'
      },
    );

Map<String, dynamic> _$BusinessHoursDtoToJson(BusinessHoursDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('PlaceId', instance.placeId);
  writeNotNull('Day', instance.day);
  writeNotNull('OpenTine', instance.openTine);
  writeNotNull('CloseTime', instance.closeTime);
  return val;
}
