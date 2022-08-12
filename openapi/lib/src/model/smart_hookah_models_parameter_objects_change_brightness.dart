//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_models_parameter_objects_change_brightness.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahModelsParameterObjectsChangeBrightness {
  /// Returns a new [SmartHookahModelsParameterObjectsChangeBrightness] instance.
  SmartHookahModelsParameterObjectsChangeBrightness({

     this.brightness,

     this.type,
  });

          // minimum: 0
          // maximum: 255
  @JsonKey(
    
    name: r'Brightness',
    required: false,
    includeIfNull: false
  )


  int? brightness;



  @JsonKey(
    
    name: r'Type',
    required: false,
    includeIfNull: false
  )


  SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum? type;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsParameterObjectsChangeBrightness &&
     other.brightness == brightness &&
     other.type == type;

  @override
  int get hashCode =>
    brightness.hashCode +
    type.hashCode;

  factory SmartHookahModelsParameterObjectsChangeBrightness.fromJson(Map<String, dynamic> json) => _$SmartHookahModelsParameterObjectsChangeBrightnessFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahModelsParameterObjectsChangeBrightnessToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
  @JsonValue(2)
  number2,
}


