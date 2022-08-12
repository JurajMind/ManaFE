//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/brand_group_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gear_get_brands200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GearGetBrands200Response {
  /// Returns a new [GearGetBrands200Response] instance.
  GearGetBrands200Response({

     this.bowl,

     this.tobacco,

     this.tobaccoMix,

     this.heatmanagement,

     this.hookah,

     this.coal,
  });

  @JsonKey(
    
    name: r'Bowl',
    required: false,
    includeIfNull: false
  )


  List<BrandGroupDto>? bowl;



  @JsonKey(
    
    name: r'Tobacco',
    required: false,
    includeIfNull: false
  )


  List<BrandGroupDto>? tobacco;



  @JsonKey(
    
    name: r'TobaccoMix',
    required: false,
    includeIfNull: false
  )


  List<BrandGroupDto>? tobaccoMix;



  @JsonKey(
    
    name: r'Heatmanagement',
    required: false,
    includeIfNull: false
  )


  List<BrandGroupDto>? heatmanagement;



  @JsonKey(
    
    name: r'Hookah',
    required: false,
    includeIfNull: false
  )


  List<BrandGroupDto>? hookah;



  @JsonKey(
    
    name: r'Coal',
    required: false,
    includeIfNull: false
  )


  List<BrandGroupDto>? coal;



  @override
  bool operator ==(Object other) => identical(this, other) || other is GearGetBrands200Response &&
     other.bowl == bowl &&
     other.tobacco == tobacco &&
     other.tobaccoMix == tobaccoMix &&
     other.heatmanagement == heatmanagement &&
     other.hookah == hookah &&
     other.coal == coal;

  @override
  int get hashCode =>
    bowl.hashCode +
    tobacco.hashCode +
    tobaccoMix.hashCode +
    heatmanagement.hashCode +
    hookah.hashCode +
    coal.hashCode;

  factory GearGetBrands200Response.fromJson(Map<String, dynamic> json) => _$GearGetBrands200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GearGetBrands200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

