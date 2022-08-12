//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_models_parameter_objects_change_animation.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahModelsParameterObjectsChangeAnimation {
  /// Returns a new [SmartHookahModelsParameterObjectsChangeAnimation] instance.
  SmartHookahModelsParameterObjectsChangeAnimation({

     this.animationId,

     this.type,
  });

  @JsonKey(
    
    name: r'AnimationId',
    required: false,
    includeIfNull: false
  )


  int? animationId;



  @JsonKey(
    
    name: r'Type',
    required: false,
    includeIfNull: false
  )


  SmartHookahModelsParameterObjectsChangeAnimationTypeEnum? type;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsParameterObjectsChangeAnimation &&
     other.animationId == animationId &&
     other.type == type;

  @override
  int get hashCode =>
    animationId.hashCode +
    type.hashCode;

  factory SmartHookahModelsParameterObjectsChangeAnimation.fromJson(Map<String, dynamic> json) => _$SmartHookahModelsParameterObjectsChangeAnimationFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahModelsParameterObjectsChangeAnimationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SmartHookahModelsParameterObjectsChangeAnimationTypeEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
  @JsonValue(2)
  number2,
}


