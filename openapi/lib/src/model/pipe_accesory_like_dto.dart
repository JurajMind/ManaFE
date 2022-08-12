//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'pipe_accesory_like_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PipeAccesoryLikeDto {
  /// Returns a new [PipeAccesoryLikeDto] instance.
  PipeAccesoryLikeDto({

     this.id,

     this.personId,

     this.pipeAccessoryId,

     this.value,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'PersonId',
    required: false,
    includeIfNull: false
  )


  int? personId;



  @JsonKey(
    
    name: r'PipeAccessoryId',
    required: false,
    includeIfNull: false
  )


  int? pipeAccessoryId;



  @JsonKey(
    
    name: r'Value',
    required: false,
    includeIfNull: false
  )


  int? value;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PipeAccesoryLikeDto &&
     other.id == id &&
     other.personId == personId &&
     other.pipeAccessoryId == pipeAccessoryId &&
     other.value == value;

  @override
  int get hashCode =>
    id.hashCode +
    personId.hashCode +
    pipeAccessoryId.hashCode +
    value.hashCode;

  factory PipeAccesoryLikeDto.fromJson(Map<String, dynamic> json) => _$PipeAccesoryLikeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PipeAccesoryLikeDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

