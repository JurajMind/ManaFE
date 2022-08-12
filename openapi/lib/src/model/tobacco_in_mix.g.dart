// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tobacco_in_mix.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TobaccoInMix _$TobaccoInMixFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TobaccoInMix',
      json,
      ($checkedConvert) {
        final val = TobaccoInMix(
          tobacco: $checkedConvert(
              'Tobacco',
              (v) => v == null
                  ? null
                  : TobaccoSimpleDto.fromJson(v as Map<String, dynamic>)),
          fraction: $checkedConvert('Fraction', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {'tobacco': 'Tobacco', 'fraction': 'Fraction'},
    );

Map<String, dynamic> _$TobaccoInMixToJson(TobaccoInMix instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Tobacco', instance.tobacco?.toJson());
  writeNotNull('Fraction', instance.fraction);
  return val;
}
