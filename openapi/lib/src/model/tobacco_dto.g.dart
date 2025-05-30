// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tobacco_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TobaccoDto _$TobaccoDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TobaccoDto',
      json,
      ($checkedConvert) {
        final val = TobaccoDto(
          likes: $checkedConvert(
              'Likes',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      PipeAccesoryLikeDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          used: $checkedConvert('Used', (v) => v as int?),
          id: $checkedConvert('Id', (v) => v as int?),
          name: $checkedConvert('Name', (v) => v as String?),
          brand: $checkedConvert('Brand', (v) => v as String?),
          brandId: $checkedConvert('BrandId', (v) => v as String?),
          picture: $checkedConvert('Picture', (v) => v as String?),
          type: $checkedConvert('Type', (v) => v as String?),
          likeCount: $checkedConvert('LikeCount', (v) => v as int?),
          disLikeCount: $checkedConvert('DisLikeCount', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'likes': 'Likes',
        'used': 'Used',
        'id': 'Id',
        'name': 'Name',
        'brand': 'Brand',
        'brandId': 'BrandId',
        'picture': 'Picture',
        'type': 'Type',
        'likeCount': 'LikeCount',
        'disLikeCount': 'DisLikeCount'
      },
    );

Map<String, dynamic> _$TobaccoDtoToJson(TobaccoDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Likes', instance.likes?.map((e) => e.toJson()).toList());
  writeNotNull('Used', instance.used);
  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('Brand', instance.brand);
  writeNotNull('BrandId', instance.brandId);
  writeNotNull('Picture', instance.picture);
  writeNotNull('Type', instance.type);
  writeNotNull('LikeCount', instance.likeCount);
  writeNotNull('DisLikeCount', instance.disLikeCount);
  return val;
}
