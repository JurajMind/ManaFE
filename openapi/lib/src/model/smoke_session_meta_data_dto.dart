//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/tobacco_mix_simple_dto.dart';
import 'package:openapi/src/model/pipe_accesory_simple_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'smoke_session_meta_data_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmokeSessionMetaDataDto {
  /// Returns a new [SmokeSessionMetaDataDto] instance.
  SmokeSessionMetaDataDto({

     this.id,

     this.tobaccoId,

     this.tobacco,

     this.tobaccoMix,

     this.tobaccoWeight,

     this.anonymPeopleCount,

     this.bowlId,

     this.bowl,

     this.pipeId,

     this.pipe,

     this.coalId,

     this.coal,

     this.heatManagementId,

     this.heatManagement,

     this.packType,

     this.coalCount,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'TobaccoId',
    required: false,
    includeIfNull: false
  )


  int? tobaccoId;



  @JsonKey(
    
    name: r'Tobacco',
    required: false,
    includeIfNull: false
  )


  PipeAccesorySimpleDto? tobacco;



  @JsonKey(
    
    name: r'TobaccoMix',
    required: false,
    includeIfNull: false
  )


  TobaccoMixSimpleDto? tobaccoMix;



  @JsonKey(
    
    name: r'TobaccoWeight',
    required: false,
    includeIfNull: false
  )


  double? tobaccoWeight;



  @JsonKey(
    
    name: r'AnonymPeopleCount',
    required: false,
    includeIfNull: false
  )


  int? anonymPeopleCount;



  @JsonKey(
    
    name: r'BowlId',
    required: false,
    includeIfNull: false
  )


  int? bowlId;



  @JsonKey(
    
    name: r'Bowl',
    required: false,
    includeIfNull: false
  )


  PipeAccesorySimpleDto? bowl;



  @JsonKey(
    
    name: r'PipeId',
    required: false,
    includeIfNull: false
  )


  int? pipeId;



  @JsonKey(
    
    name: r'Pipe',
    required: false,
    includeIfNull: false
  )


  PipeAccesorySimpleDto? pipe;



  @JsonKey(
    
    name: r'CoalId',
    required: false,
    includeIfNull: false
  )


  int? coalId;



  @JsonKey(
    
    name: r'Coal',
    required: false,
    includeIfNull: false
  )


  PipeAccesorySimpleDto? coal;



  @JsonKey(
    
    name: r'HeatManagementId',
    required: false,
    includeIfNull: false
  )


  int? heatManagementId;



  @JsonKey(
    
    name: r'HeatManagement',
    required: false,
    includeIfNull: false
  )


  PipeAccesorySimpleDto? heatManagement;



  @JsonKey(
    
    name: r'PackType',
    required: false,
    includeIfNull: false
  )


  SmokeSessionMetaDataDtoPackTypeEnum? packType;



  @JsonKey(
    
    name: r'CoalCount',
    required: false,
    includeIfNull: false
  )


  double? coalCount;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmokeSessionMetaDataDto &&
     other.id == id &&
     other.tobaccoId == tobaccoId &&
     other.tobacco == tobacco &&
     other.tobaccoMix == tobaccoMix &&
     other.tobaccoWeight == tobaccoWeight &&
     other.anonymPeopleCount == anonymPeopleCount &&
     other.bowlId == bowlId &&
     other.bowl == bowl &&
     other.pipeId == pipeId &&
     other.pipe == pipe &&
     other.coalId == coalId &&
     other.coal == coal &&
     other.heatManagementId == heatManagementId &&
     other.heatManagement == heatManagement &&
     other.packType == packType &&
     other.coalCount == coalCount;

  @override
  int get hashCode =>
    id.hashCode +
    tobaccoId.hashCode +
    tobacco.hashCode +
    tobaccoMix.hashCode +
    tobaccoWeight.hashCode +
    anonymPeopleCount.hashCode +
    bowlId.hashCode +
    bowl.hashCode +
    pipeId.hashCode +
    pipe.hashCode +
    coalId.hashCode +
    coal.hashCode +
    heatManagementId.hashCode +
    heatManagement.hashCode +
    packType.hashCode +
    coalCount.hashCode;

  factory SmokeSessionMetaDataDto.fromJson(Map<String, dynamic> json) => _$SmokeSessionMetaDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmokeSessionMetaDataDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SmokeSessionMetaDataDtoPackTypeEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
  @JsonValue(2)
  number2,
  @JsonValue(3)
  number3,
  @JsonValue(4)
  number4,
}


