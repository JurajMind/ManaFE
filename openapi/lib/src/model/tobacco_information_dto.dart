//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/tobacco_taste_dto.dart';
import 'package:openapi/src/model/smoke_session_simple_dto.dart';
import 'package:openapi/src/model/pipe_accessory_statistics_dto.dart';
import 'package:openapi/src/model/tobacco_simple_dto.dart';
import 'package:openapi/src/model/gear_tobacco_review_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tobacco_information_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TobaccoInformationDto {
  /// Returns a new [TobaccoInformationDto] instance.
  TobaccoInformationDto({

     this.tobacco,

     this.tobaccoTastes,

     this.personTobaccoStats,

     this.allTobaccoStats,

     this.smokeSessions,

     this.reviews,
  });

  @JsonKey(
    
    name: r'Tobacco',
    required: false,
    includeIfNull: false
  )


  TobaccoSimpleDto? tobacco;



  @JsonKey(
    
    name: r'TobaccoTastes',
    required: false,
    includeIfNull: false
  )


  List<TobaccoTasteDto>? tobaccoTastes;



  @JsonKey(
    
    name: r'PersonTobaccoStats',
    required: false,
    includeIfNull: false
  )


  PipeAccessoryStatisticsDto? personTobaccoStats;



  @JsonKey(
    
    name: r'AllTobaccoStats',
    required: false,
    includeIfNull: false
  )


  PipeAccessoryStatisticsDto? allTobaccoStats;



  @JsonKey(
    
    name: r'SmokeSessions',
    required: false,
    includeIfNull: false
  )


  List<SmokeSessionSimpleDto>? smokeSessions;



  @JsonKey(
    
    name: r'Reviews',
    required: false,
    includeIfNull: false
  )


  List<GearTobaccoReviewDto>? reviews;



  @override
  bool operator ==(Object other) => identical(this, other) || other is TobaccoInformationDto &&
     other.tobacco == tobacco &&
     other.tobaccoTastes == tobaccoTastes &&
     other.personTobaccoStats == personTobaccoStats &&
     other.allTobaccoStats == allTobaccoStats &&
     other.smokeSessions == smokeSessions &&
     other.reviews == reviews;

  @override
  int get hashCode =>
    tobacco.hashCode +
    tobaccoTastes.hashCode +
    personTobaccoStats.hashCode +
    allTobaccoStats.hashCode +
    smokeSessions.hashCode +
    reviews.hashCode;

  factory TobaccoInformationDto.fromJson(Map<String, dynamic> json) => _$TobaccoInformationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TobaccoInformationDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

