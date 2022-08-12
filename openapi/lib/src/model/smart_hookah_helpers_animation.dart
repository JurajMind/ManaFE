//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_helpers_animation.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahHelpersAnimation {
  /// Returns a new [SmartHookahHelpersAnimation] instance.
  SmartHookahHelpersAnimation({

     this.id,

     this.displayName,

     this.versionFrom,

     this.versionTo,

     this.usage,

     this.haveColor,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'DisplayName',
    required: false,
    includeIfNull: false
  )


  String? displayName;



  @JsonKey(
    
    name: r'VersionFrom',
    required: false,
    includeIfNull: false
  )


  int? versionFrom;



  @JsonKey(
    
    name: r'VersionTo',
    required: false,
    includeIfNull: false
  )


  int? versionTo;



  @JsonKey(
    
    name: r'Usage',
    required: false,
    includeIfNull: false
  )


  SmartHookahHelpersAnimationUsageEnum? usage;



  @JsonKey(
    
    name: r'HaveColor',
    required: false,
    includeIfNull: false
  )


  bool? haveColor;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahHelpersAnimation &&
     other.id == id &&
     other.displayName == displayName &&
     other.versionFrom == versionFrom &&
     other.versionTo == versionTo &&
     other.usage == usage &&
     other.haveColor == haveColor;

  @override
  int get hashCode =>
    id.hashCode +
    displayName.hashCode +
    versionFrom.hashCode +
    versionTo.hashCode +
    usage.hashCode +
    haveColor.hashCode;

  factory SmartHookahHelpersAnimation.fromJson(Map<String, dynamic> json) => _$SmartHookahHelpersAnimationFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahHelpersAnimationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SmartHookahHelpersAnimationUsageEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
  @JsonValue(2)
  number2,
  @JsonValue(4)
  number4,
  @JsonValue(6)
  number6,
  @JsonValue(7)
  number7,
}


