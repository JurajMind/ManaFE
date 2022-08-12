//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'franchise_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FranchiseDto {
  /// Returns a new [FranchiseDto] instance.
  FranchiseDto({

     this.id,

     this.name,

     this.uril,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Name',
    required: false,
    includeIfNull: false
  )


  String? name;



  @JsonKey(
    
    name: r'Uril',
    required: false,
    includeIfNull: false
  )


  String? uril;



  @override
  bool operator ==(Object other) => identical(this, other) || other is FranchiseDto &&
     other.id == id &&
     other.name == name &&
     other.uril == uril;

  @override
  int get hashCode =>
    id.hashCode +
    name.hashCode +
    uril.hashCode;

  factory FranchiseDto.fromJson(Map<String, dynamic> json) => _$FranchiseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FranchiseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

