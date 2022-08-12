//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/smart_hookah_models_db_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_models_parameter_objects_change_color.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahModelsParameterObjectsChangeColor {
  /// Returns a new [SmartHookahModelsParameterObjectsChangeColor] instance.
  SmartHookahModelsParameterObjectsChangeColor({

     this.color,

     this.type,
  });

  @JsonKey(
    
    name: r'Color',
    required: false,
    includeIfNull: false
  )


  SmartHookahModelsDbColor? color;



  @JsonKey(
    
    name: r'Type',
    required: false,
    includeIfNull: false
  )


  SmartHookahModelsParameterObjectsChangeColorTypeEnum? type;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsParameterObjectsChangeColor &&
     other.color == color &&
     other.type == type;

  @override
  int get hashCode =>
    color.hashCode +
    type.hashCode;

  factory SmartHookahModelsParameterObjectsChangeColor.fromJson(Map<String, dynamic> json) => _$SmartHookahModelsParameterObjectsChangeColorFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahModelsParameterObjectsChangeColorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SmartHookahModelsParameterObjectsChangeColorTypeEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
  @JsonValue(2)
  number2,
}


