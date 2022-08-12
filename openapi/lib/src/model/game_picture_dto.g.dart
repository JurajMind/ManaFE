// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_picture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GamePictureDto _$GamePictureDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GamePictureDto',
      json,
      ($checkedConvert) {
        final val = GamePictureDto(
          pictureUrl: $checkedConvert('PictureUrl', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'pictureUrl': 'PictureUrl'},
    );

Map<String, dynamic> _$GamePictureDtoToJson(GamePictureDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PictureUrl', instance.pictureUrl);
  return val;
}
