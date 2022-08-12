//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_models_db_color.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahModelsDbColor {
  /// Returns a new [SmartHookahModelsDbColor] instance.
  SmartHookahModelsDbColor({

     this.hue,

     this.saturation,

     this.value,
  });

  @JsonKey(
    
    name: r'Hue',
    required: false,
    includeIfNull: false
  )


  int? hue;



  @JsonKey(
    
    name: r'Saturation',
    required: false,
    includeIfNull: false
  )


  int? saturation;



  @JsonKey(
    
    name: r'Value',
    required: false,
    includeIfNull: false
  )


  int? value;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsDbColor &&
     other.hue == hue &&
     other.saturation == saturation &&
     other.value == value;

  @override
  int get hashCode =>
    hue.hashCode +
    saturation.hashCode +
    value.hashCode;

  factory SmartHookahModelsDbColor.fromJson(Map<String, dynamic> json) => _$SmartHookahModelsDbColorFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahModelsDbColorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

