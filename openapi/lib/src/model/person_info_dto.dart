//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/place_simple_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_info_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonInfoDto {
  /// Returns a new [PersonInfoDto] instance.
  PersonInfoDto({

     this.displayName,

     this.email,

     this.managedPlaces,

     this.roles,

     this.personId,
  });

  @JsonKey(
    
    name: r'DisplayName',
    required: false,
    includeIfNull: false
  )


  String? displayName;



  @JsonKey(
    
    name: r'Email',
    required: false,
    includeIfNull: false
  )


  String? email;



  @JsonKey(
    
    name: r'ManagedPlaces',
    required: false,
    includeIfNull: false
  )


  List<PlaceSimpleDto>? managedPlaces;



  @JsonKey(
    
    name: r'Roles',
    required: false,
    includeIfNull: false
  )


  List<String>? roles;



  @JsonKey(
    
    name: r'PersonId',
    required: false,
    includeIfNull: false
  )


  int? personId;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PersonInfoDto &&
     other.displayName == displayName &&
     other.email == email &&
     other.managedPlaces == managedPlaces &&
     other.roles == roles &&
     other.personId == personId;

  @override
  int get hashCode =>
    displayName.hashCode +
    email.hashCode +
    managedPlaces.hashCode +
    roles.hashCode +
    personId.hashCode;

  factory PersonInfoDto.fromJson(Map<String, dynamic> json) => _$PersonInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonInfoDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

