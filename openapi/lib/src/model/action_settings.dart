//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/smart_hookah_models_db_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action_settings.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ActionSettings {
  /// Returns a new [ActionSettings] instance.
  ActionSettings({

     this.color,

     this.animationId,

     this.brightness,

     this.speed,
  });

  @JsonKey(
    
    name: r'Color',
    required: false,
    includeIfNull: false
  )


  SmartHookahModelsDbColor? color;



  @JsonKey(
    
    name: r'AnimationId',
    required: false,
    includeIfNull: false
  )


  int? animationId;



  @JsonKey(
    
    name: r'Brightness',
    required: false,
    includeIfNull: false
  )


  int? brightness;



  @JsonKey(
    
    name: r'Speed',
    required: false,
    includeIfNull: false
  )


  int? speed;



  @override
  bool operator ==(Object other) => identical(this, other) || other is ActionSettings &&
     other.color == color &&
     other.animationId == animationId &&
     other.brightness == brightness &&
     other.speed == speed;

  @override
  int get hashCode =>
    color.hashCode +
    animationId.hashCode +
    brightness.hashCode +
    speed.hashCode;

  factory ActionSettings.fromJson(Map<String, dynamic> json) => _$ActionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ActionSettingsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

