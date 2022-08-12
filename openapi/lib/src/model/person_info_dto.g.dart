// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonInfoDto _$PersonInfoDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PersonInfoDto',
      json,
      ($checkedConvert) {
        final val = PersonInfoDto(
          displayName: $checkedConvert('DisplayName', (v) => v as String?),
          email: $checkedConvert('Email', (v) => v as String?),
          managedPlaces: $checkedConvert(
              'ManagedPlaces',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => PlaceSimpleDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          roles: $checkedConvert('Roles',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          personId: $checkedConvert('PersonId', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'displayName': 'DisplayName',
        'email': 'Email',
        'managedPlaces': 'ManagedPlaces',
        'roles': 'Roles',
        'personId': 'PersonId'
      },
    );

Map<String, dynamic> _$PersonInfoDtoToJson(PersonInfoDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('Email', instance.email);
  writeNotNull(
      'ManagedPlaces', instance.managedPlaces?.map((e) => e.toJson()).toList());
  writeNotNull('Roles', instance.roles);
  writeNotNull('PersonId', instance.personId);
  return val;
}
