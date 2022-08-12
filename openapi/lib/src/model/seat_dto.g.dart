// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatDto _$SeatDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SeatDto',
      json,
      ($checkedConvert) {
        final val = SeatDto(
          id: $checkedConvert('Id', (v) => v as int?),
          name: $checkedConvert('Name', (v) => v as String?),
          code: $checkedConvert('Code', (v) => v as String?),
          capacity: $checkedConvert('Capacity', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'name': 'Name',
        'code': 'Code',
        'capacity': 'Capacity'
      },
    );

Map<String, dynamic> _$SeatDtoToJson(SeatDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('Code', instance.code);
  writeNotNull('Capacity', instance.capacity);
  return val;
}
