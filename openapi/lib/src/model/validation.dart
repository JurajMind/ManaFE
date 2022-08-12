//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'validation.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Validation {
  /// Returns a new [Validation] instance.
  Validation({

     this.id,

     this.flag,

     this.success,

     this.message,

     this.httpResponseCode,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  String? id;



  @JsonKey(
    
    name: r'Flag',
    required: false,
    includeIfNull: false
  )


  ValidationFlagEnum? flag;



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
  bool operator ==(Object other) => identical(this, other) || other is Validation &&
     other.id == id &&
     other.flag == flag &&
     other.success == success &&
     other.message == message &&
     other.httpResponseCode == httpResponseCode;

  @override
  int get hashCode =>
    id.hashCode +
    flag.hashCode +
    success.hashCode +
    message.hashCode +
    httpResponseCode.hashCode;

  factory Validation.fromJson(Map<String, dynamic> json) => _$ValidationFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum ValidationFlagEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
}


