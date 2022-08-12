//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/media_dto.dart';
import 'package:openapi/src/model/smoke_session_simple_dto.dart';
import 'package:openapi/src/model/places_place_review_dto.dart';
import 'package:openapi/src/model/gear_tobacco_review_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_models_db_session_dto_session_review_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahModelsDbSessionDtoSessionReviewDto {
  /// Returns a new [SmartHookahModelsDbSessionDtoSessionReviewDto] instance.
  SmartHookahModelsDbSessionDtoSessionReviewDto({

     this.id,

     this.authorId,

     this.author,

     this.publishDate,

     this.tobaccoReview,

     this.placeReviewId,

     this.placeReview,

     this.medias,

     this.smokeSessionId,

     this.taste,

     this.smoke,

     this.strength,

     this.duration,

     this.smokeSession,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'authorId',
    required: false,
    includeIfNull: false
  )


  int? authorId;



  @JsonKey(
    
    name: r'author',
    required: false,
    includeIfNull: false
  )


  String? author;



  @JsonKey(
    
    name: r'publishDate',
    required: false,
    includeIfNull: false
  )


  DateTime? publishDate;



  @JsonKey(
    
    name: r'tobaccoReview',
    required: false,
    includeIfNull: false
  )


  GearTobaccoReviewDto? tobaccoReview;



  @JsonKey(
    
    name: r'placeReviewId',
    required: false,
    includeIfNull: false
  )


  int? placeReviewId;



  @JsonKey(
    
    name: r'placeReview',
    required: false,
    includeIfNull: false
  )


  PlacesPlaceReviewDto? placeReview;



  @JsonKey(
    
    name: r'medias',
    required: false,
    includeIfNull: false
  )


  List<MediaDto>? medias;



  @JsonKey(
    
    name: r'smokeSessionId',
    required: false,
    includeIfNull: false
  )


  int? smokeSessionId;



  @JsonKey(
    
    name: r'taste',
    required: false,
    includeIfNull: false
  )


  int? taste;



  @JsonKey(
    
    name: r'smoke',
    required: false,
    includeIfNull: false
  )


  int? smoke;



  @JsonKey(
    
    name: r'strength',
    required: false,
    includeIfNull: false
  )


  int? strength;



  @JsonKey(
    
    name: r'duration',
    required: false,
    includeIfNull: false
  )


  int? duration;



  @JsonKey(
    
    name: r'smokeSession',
    required: false,
    includeIfNull: false
  )


  SmokeSessionSimpleDto? smokeSession;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsDbSessionDtoSessionReviewDto &&
     other.id == id &&
     other.authorId == authorId &&
     other.author == author &&
     other.publishDate == publishDate &&
     other.tobaccoReview == tobaccoReview &&
     other.placeReviewId == placeReviewId &&
     other.placeReview == placeReview &&
     other.medias == medias &&
     other.smokeSessionId == smokeSessionId &&
     other.taste == taste &&
     other.smoke == smoke &&
     other.strength == strength &&
     other.duration == duration &&
     other.smokeSession == smokeSession;

  @override
  int get hashCode =>
    id.hashCode +
    authorId.hashCode +
    author.hashCode +
    publishDate.hashCode +
    tobaccoReview.hashCode +
    placeReviewId.hashCode +
    placeReview.hashCode +
    medias.hashCode +
    smokeSessionId.hashCode +
    taste.hashCode +
    smoke.hashCode +
    strength.hashCode +
    duration.hashCode +
    smokeSession.hashCode;

  factory SmartHookahModelsDbSessionDtoSessionReviewDto.fromJson(Map<String, dynamic> json) => _$SmartHookahModelsDbSessionDtoSessionReviewDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahModelsDbSessionDtoSessionReviewDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

