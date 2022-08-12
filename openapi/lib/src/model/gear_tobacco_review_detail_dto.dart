//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/media_dto.dart';
import 'package:openapi/src/model/smart_hookah_models_db_session_dto_session_review_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gear_tobacco_review_detail_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GearTobaccoReviewDetailDto {
  /// Returns a new [GearTobaccoReviewDetailDto] instance.
  GearTobaccoReviewDetailDto({

     this.smokeSessionId,

     this.id,

     this.cut,

     this.taste,

     this.smoke,

     this.strength,

     this.duration,

     this.overall,

     this.text,

     this.sessionReviewId,

     this.medias,
  });

  @JsonKey(
    
    name: r'SmokeSessionId',
    required: false,
    includeIfNull: false
  )


  SmartHookahModelsDbSessionDtoSessionReviewDto? smokeSessionId;



  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Cut',
    required: false,
    includeIfNull: false
  )


  int? cut;



  @JsonKey(
    
    name: r'Taste',
    required: false,
    includeIfNull: false
  )


  int? taste;



  @JsonKey(
    
    name: r'Smoke',
    required: false,
    includeIfNull: false
  )


  int? smoke;



  @JsonKey(
    
    name: r'Strength',
    required: false,
    includeIfNull: false
  )


  int? strength;



  @JsonKey(
    
    name: r'Duration',
    required: false,
    includeIfNull: false
  )


  int? duration;



  @JsonKey(
    
    name: r'Overall',
    required: false,
    includeIfNull: false
  )


  double? overall;



  @JsonKey(
    
    name: r'Text',
    required: false,
    includeIfNull: false
  )


  String? text;



  @JsonKey(
    
    name: r'SessionReviewId',
    required: false,
    includeIfNull: false
  )


  int? sessionReviewId;



  @JsonKey(
    
    name: r'Medias',
    required: false,
    includeIfNull: false
  )


  List<MediaDto>? medias;



  @override
  bool operator ==(Object other) => identical(this, other) || other is GearTobaccoReviewDetailDto &&
     other.smokeSessionId == smokeSessionId &&
     other.id == id &&
     other.cut == cut &&
     other.taste == taste &&
     other.smoke == smoke &&
     other.strength == strength &&
     other.duration == duration &&
     other.overall == overall &&
     other.text == text &&
     other.sessionReviewId == sessionReviewId &&
     other.medias == medias;

  @override
  int get hashCode =>
    smokeSessionId.hashCode +
    id.hashCode +
    cut.hashCode +
    taste.hashCode +
    smoke.hashCode +
    strength.hashCode +
    duration.hashCode +
    overall.hashCode +
    text.hashCode +
    sessionReviewId.hashCode +
    medias.hashCode;

  factory GearTobaccoReviewDetailDto.fromJson(Map<String, dynamic> json) => _$GearTobaccoReviewDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GearTobaccoReviewDetailDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

