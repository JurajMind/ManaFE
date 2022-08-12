//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/used_with_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pipe_accessory_details_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PipeAccessoryDetailsDto {
  /// Returns a new [PipeAccessoryDetailsDto] instance.
  PipeAccessoryDetailsDto({

     this.usedByPerson,

     this.usedWith,

     this.ownedByPersons,

     this.ownedByPlaces,
  });

  @JsonKey(
    
    name: r'UsedByPerson',
    required: false,
    includeIfNull: false
  )


  int? usedByPerson;



  @JsonKey(
    
    name: r'UsedWith',
    required: false,
    includeIfNull: false
  )


  List<UsedWithDto>? usedWith;



  @JsonKey(
    
    name: r'OwnedByPersons',
    required: false,
    includeIfNull: false
  )


  int? ownedByPersons;



  @JsonKey(
    
    name: r'OwnedByPlaces',
    required: false,
    includeIfNull: false
  )


  int? ownedByPlaces;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PipeAccessoryDetailsDto &&
     other.usedByPerson == usedByPerson &&
     other.usedWith == usedWith &&
     other.ownedByPersons == ownedByPersons &&
     other.ownedByPlaces == ownedByPlaces;

  @override
  int get hashCode =>
    usedByPerson.hashCode +
    usedWith.hashCode +
    ownedByPersons.hashCode +
    ownedByPlaces.hashCode;

  factory PipeAccessoryDetailsDto.fromJson(Map<String, dynamic> json) => _$PipeAccessoryDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PipeAccessoryDetailsDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

