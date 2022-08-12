// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pipe_accessory_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipeAccessoryDetailsDto _$PipeAccessoryDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PipeAccessoryDetailsDto',
      json,
      ($checkedConvert) {
        final val = PipeAccessoryDetailsDto(
          usedByPerson: $checkedConvert('UsedByPerson', (v) => v as int?),
          usedWith: $checkedConvert(
              'UsedWith',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => UsedWithDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          ownedByPersons: $checkedConvert('OwnedByPersons', (v) => v as int?),
          ownedByPlaces: $checkedConvert('OwnedByPlaces', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'usedByPerson': 'UsedByPerson',
        'usedWith': 'UsedWith',
        'ownedByPersons': 'OwnedByPersons',
        'ownedByPlaces': 'OwnedByPlaces'
      },
    );

Map<String, dynamic> _$PipeAccessoryDetailsDtoToJson(
    PipeAccessoryDetailsDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UsedByPerson', instance.usedByPerson);
  writeNotNull('UsedWith', instance.usedWith?.map((e) => e.toJson()).toList());
  writeNotNull('OwnedByPersons', instance.ownedByPersons);
  writeNotNull('OwnedByPlaces', instance.ownedByPlaces);
  return val;
}
