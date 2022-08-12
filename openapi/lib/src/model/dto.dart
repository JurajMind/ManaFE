//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Dto {
  /// Returns a new [Dto] instance.
  Dto({

     this.success,

     this.message,

     this.httpResponseCode,
  });

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
  bool operator ==(Object other) => identical(this, other) || other is Dto &&
     other.success == success &&
     other.message == message &&
     other.httpResponseCode == httpResponseCode;

  @override
  int get hashCode =>
    success.hashCode +
    message.hashCode +
    httpResponseCode.hashCode;

  factory Dto.fromJson(Map<String, dynamic> json) => _$DtoFromJson(json);

  Map<String, dynamic> toJson() => _$DtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

