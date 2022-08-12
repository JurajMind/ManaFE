// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'franchise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FranchiseDto _$FranchiseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FranchiseDto',
      json,
      ($checkedConvert) {
        final val = FranchiseDto(
          id: $checkedConvert('Id', (v) => v as int?),
          name: $checkedConvert('Name', (v) => v as String?),
          uril: $checkedConvert('Uril', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'id': 'Id', 'name': 'Name', 'uril': 'Uril'},
    );

Map<String, dynamic> _$FranchiseDtoToJson(FranchiseDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('Uril', instance.uril);
  return val;
}
