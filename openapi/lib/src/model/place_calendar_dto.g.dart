// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_calendar_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceCalendarDto _$PlaceCalendarDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PlaceCalendarDto',
      json,
      ($checkedConvert) {
        final val = PlaceCalendarDto(
          placeDays: $checkedConvert(
              'PlaceDays',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => PlaceDay.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'placeDays': 'PlaceDays'},
    );

Map<String, dynamic> _$PlaceCalendarDtoToJson(PlaceCalendarDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'PlaceDays', instance.placeDays?.map((e) => e.toJson()).toList());
  return val;
}
