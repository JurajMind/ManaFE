//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'game_picture_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GamePictureDto {
  /// Returns a new [GamePictureDto] instance.
  GamePictureDto({

     this.pictureUrl,
  });

  @JsonKey(
    
    name: r'PictureUrl',
    required: false,
    includeIfNull: false
  )


  String? pictureUrl;



  @override
  bool operator ==(Object other) => identical(this, other) || other is GamePictureDto &&
     other.pictureUrl == pictureUrl;

  @override
  int get hashCode =>
    pictureUrl.hashCode;

  factory GamePictureDto.fromJson(Map<String, dynamic> json) => _$GamePictureDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GamePictureDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

