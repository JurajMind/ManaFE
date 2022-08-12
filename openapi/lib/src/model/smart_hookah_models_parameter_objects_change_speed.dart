//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_models_parameter_objects_change_speed.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahModelsParameterObjectsChangeSpeed {
  /// Returns a new [SmartHookahModelsParameterObjectsChangeSpeed] instance.
  SmartHookahModelsParameterObjectsChangeSpeed({

     this.speed,

     this.type,
  });

          // minimum: 0
          // maximum: 255
  @JsonKey(
    
    name: r'Speed',
    required: false,
    includeIfNull: false
  )


  int? speed;



  @JsonKey(
    
    name: r'Type',
    required: false,
    includeIfNull: false
  )


  SmartHookahModelsParameterObjectsChangeSpeedTypeEnum? type;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsParameterObjectsChangeSpeed &&
     other.speed == speed &&
     other.type == type;

  @override
  int get hashCode =>
    speed.hashCode +
    type.hashCode;

  factory SmartHookahModelsParameterObjectsChangeSpeed.fromJson(Map<String, dynamic> json) => _$SmartHookahModelsParameterObjectsChangeSpeedFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahModelsParameterObjectsChangeSpeedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SmartHookahModelsParameterObjectsChangeSpeedTypeEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
  @JsonValue(2)
  number2,
}


