//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/smart_hookah_helpers_animation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'animations.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Animations {
  /// Returns a new [Animations] instance.
  Animations({

     this.animations,

     this.success,

     this.message,

     this.httpResponseCode,
  });

  @JsonKey(
    
    name: r'Animations',
    required: false,
    includeIfNull: false
  )


  List<SmartHookahHelpersAnimation>? animations;



  @JsonKey(
    
    name: r'Success',
    required: false,
    includeIfNull: false
  )


  bool? success;



  @JsonKey(
    
    name: r'Message',
    required: false,
    includeIfNull: false
  )


  String? message;



  @JsonKey(
    
    name: r'HttpResponseCode',
    required: false,
    includeIfNull: false
  )


  int? httpResponseCode;



  @override
  bool operator ==(Object other) => identical(this, other) || other is Animations &&
     other.animations == animations &&
     other.success == success &&
     other.message == message &&
     other.httpResponseCode == httpResponseCode;

  @override
  int get hashCode =>
    animations.hashCode +
    success.hashCode +
    message.hashCode +
    httpResponseCode.hashCode;

  factory Animations.fromJson(Map<String, dynamic> json) => _$AnimationsFromJson(json);

  Map<String, dynamic> toJson() => _$AnimationsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

