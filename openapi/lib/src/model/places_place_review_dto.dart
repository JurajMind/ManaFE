//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/media_dto.dart';
import 'package:openapi/src/model/smart_hookah_models_db_session_dto_session_place_review_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'places_place_review_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlacesPlaceReviewDto {
  /// Returns a new [PlacesPlaceReviewDto] instance.
  PlacesPlaceReviewDto({

     this.id,

     this.authorId,

     this.author,

     this.publishDate,

     this.text,

     this.service,

     this.ambience,

     this.overall,

     this.placeId,

     this.sessionReview,

     this.medias,
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
    
    name: r'text',
    required: false,
    includeIfNull: false
  )


  String? text;



  @JsonKey(
    
    name: r'service',
    required: false,
    includeIfNull: false
  )


  int? service;



  @JsonKey(
    
    name: r'ambience',
    required: false,
    includeIfNull: false
  )


  int? ambience;



  @JsonKey(
    
    name: r'overall',
    required: false,
    includeIfNull: false
  )


  int? overall;



  @JsonKey(
    
    name: r'placeId',
    required: false,
    includeIfNull: false
  )


  int? placeId;



  @JsonKey(
    
    name: r'sessionReview',
    required: false,
    includeIfNull: false
  )


  SmartHookahModelsDbSessionDtoSessionPlaceReviewDto? sessionReview;



  @JsonKey(
    
    name: r'medias',
    required: false,
    includeIfNull: false
  )


  List<MediaDto>? medias;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacesPlaceReviewDto &&
     other.id == id &&
     other.authorId == authorId &&
     other.author == author &&
     other.publishDate == publishDate &&
     other.text == text &&
     other.service == service &&
     other.ambience == ambience &&
     other.overall == overall &&
     other.placeId == placeId &&
     other.sessionReview == sessionReview &&
     other.medias == medias;

  @override
  int get hashCode =>
    id.hashCode +
    authorId.hashCode +
    author.hashCode +
    publishDate.hashCode +
    text.hashCode +
    service.hashCode +
    ambience.hashCode +
    overall.hashCode +
    placeId.hashCode +
    sessionReview.hashCode +
    medias.hashCode;

  factory PlacesPlaceReviewDto.fromJson(Map<String, dynamic> json) => _$PlacesPlaceReviewDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesPlaceReviewDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

