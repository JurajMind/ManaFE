//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/media_dto.dart';
import 'package:openapi/src/model/smoke_session_simple_dto.dart';
import 'package:openapi/src/model/gear_tobacco_review_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_models_db_session_dto_session_place_review_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahModelsDbSessionDtoSessionPlaceReviewDto {
  /// Returns a new [SmartHookahModelsDbSessionDtoSessionPlaceReviewDto] instance.
  SmartHookahModelsDbSessionDtoSessionPlaceReviewDto({

     this.id,

     this.authorId,

     this.author,

     this.publishDate,

     this.tobaccoReview,

     this.medias,

     this.smokeSessionId,

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
    
    name: r'smokeSession',
    required: false,
    includeIfNull: false
  )


  SmokeSessionSimpleDto? smokeSession;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsDbSessionDtoSessionPlaceReviewDto &&
     other.id == id &&
     other.authorId == authorId &&
     other.author == author &&
     other.publishDate == publishDate &&
     other.tobaccoReview == tobaccoReview &&
     other.medias == medias &&
     other.smokeSessionId == smokeSessionId &&
     other.smokeSession == smokeSession;

  @override
  int get hashCode =>
    id.hashCode +
    authorId.hashCode +
    author.hashCode +
    publishDate.hashCode +
    tobaccoReview.hashCode +
    medias.hashCode +
    smokeSessionId.hashCode +
    smokeSession.hashCode;

  factory SmartHookahModelsDbSessionDtoSessionPlaceReviewDto.fromJson(Map<String, dynamic> json) => _$SmartHookahModelsDbSessionDtoSessionPlaceReviewDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahModelsDbSessionDtoSessionPlaceReviewDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

