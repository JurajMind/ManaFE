//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/game_picture_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_profile_simple_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameProfileSimpleDto {
  /// Returns a new [GameProfileSimpleDto] instance.
  GameProfileSimpleDto({

     this.personId,

     this.level,

     this.testLevel,

     this.lvlProgress,

     this.experience,

     this.clouds,

     this.picture,
  });

  @JsonKey(
    
    name: r'PersonId',
    required: false,
    includeIfNull: false
  )


  int? personId;



  @JsonKey(
    
    name: r'Level',
    required: false,
    includeIfNull: false
  )


  int? level;



  @JsonKey(
    
    name: r'TestLevel',
    required: false,
    includeIfNull: false
  )


  int? testLevel;



  @JsonKey(
    
    name: r'LvlProgress',
    required: false,
    includeIfNull: false
  )


  double? lvlProgress;



  @JsonKey(
    
    name: r'Experience',
    required: false,
    includeIfNull: false
  )


  int? experience;



  @JsonKey(
    
    name: r'Clouds',
    required: false,
    includeIfNull: false
  )


  int? clouds;



  @JsonKey(
    
    name: r'Picture',
    required: false,
    includeIfNull: false
  )


  GamePictureDto? picture;



  @override
  bool operator ==(Object other) => identical(this, other) || other is GameProfileSimpleDto &&
     other.personId == personId &&
     other.level == level &&
     other.testLevel == testLevel &&
     other.lvlProgress == lvlProgress &&
     other.experience == experience &&
     other.clouds == clouds &&
     other.picture == picture;

  @override
  int get hashCode =>
    personId.hashCode +
    level.hashCode +
    testLevel.hashCode +
    lvlProgress.hashCode +
    experience.hashCode +
    clouds.hashCode +
    picture.hashCode;

  factory GameProfileSimpleDto.fromJson(Map<String, dynamic> json) => _$GameProfileSimpleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GameProfileSimpleDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

