//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'device_simple_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeviceSimpleDto {
  /// Returns a new [DeviceSimpleDto] instance.
  DeviceSimpleDto({

     this.id,

     this.name,

     this.code,

     this.isOnline,

     this.type,

     this.version,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Name',
    required: false,
    includeIfNull: false
  )


  String? name;



  @JsonKey(
    
    name: r'Code',
    required: false,
    includeIfNull: false
  )


  String? code;



  @JsonKey(
    
    name: r'IsOnline',
    required: false,
    includeIfNull: false
  )


  bool? isOnline;



  @JsonKey(
    
    name: r'Type',
    required: false,
    includeIfNull: false
  )


  DeviceSimpleDtoTypeEnum? type;



  @JsonKey(
    
    name: r'Version',
    required: false,
    includeIfNull: false
  )


  int? version;



  @override
  bool operator ==(Object other) => identical(this, other) || other is DeviceSimpleDto &&
     other.id == id &&
     other.name == name &&
     other.code == code &&
     other.isOnline == isOnline &&
     other.type == type &&
     other.version == version;

  @override
  int get hashCode =>
    id.hashCode +
    name.hashCode +
    code.hashCode +
    isOnline.hashCode +
    type.hashCode +
    version.hashCode;

  factory DeviceSimpleDto.fromJson(Map<String, dynamic> json) => _$DeviceSimpleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceSimpleDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum DeviceSimpleDtoTypeEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
  @JsonValue(2)
  number2,
  @JsonValue(3)
  number3,
  @JsonValue(4)
  number4,
  @JsonValue(5)
  number5,
  @JsonValue(6)
  number6,
  @JsonValue(7)
  number7,
  @JsonValue(8)
  number8,
  @JsonValue(9)
  number9,
  @JsonValue(10)
  number10,
  @JsonValue(11)
  number11,
  @JsonValue(12)
  number12,
  @JsonValue(13)
  number13,
}


