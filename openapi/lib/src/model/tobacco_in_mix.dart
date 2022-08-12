//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/tobacco_simple_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tobacco_in_mix.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TobaccoInMix {
  /// Returns a new [TobaccoInMix] instance.
  TobaccoInMix({

     this.tobacco,

     this.fraction,
  });

  @JsonKey(
    
    name: r'Tobacco',
    required: false,
    includeIfNull: false
  )


  TobaccoSimpleDto? tobacco;



  @JsonKey(
    
    name: r'Fraction',
    required: false,
    includeIfNull: false
  )


  int? fraction;



  @override
  bool operator ==(Object other) => identical(this, other) || other is TobaccoInMix &&
     other.tobacco == tobacco &&
     other.fraction == fraction;

  @override
  int get hashCode =>
    tobacco.hashCode +
    fraction.hashCode;

  factory TobaccoInMix.fromJson(Map<String, dynamic> json) => _$TobaccoInMixFromJson(json);

  Map<String, dynamic> toJson() => _$TobaccoInMixToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

