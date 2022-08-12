//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'device_update_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeviceUpdateDto {
  /// Returns a new [DeviceUpdateDto] instance.
  DeviceUpdateDto({

     this.id,

     this.version,

     this.releseDate,

     this.releseNote,

     this.type,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Version',
    required: false,
    includeIfNull: false
  )


  int? version;



  @JsonKey(
    
    name: r'ReleseDate',
    required: false,
    includeIfNull: false
  )


  DateTime? releseDate;



  @JsonKey(
    
    name: r'ReleseNote',
    required: false,
    includeIfNull: false
  )


  String? releseNote;



  @JsonKey(
    
    name: r'Type',
    required: false,
    includeIfNull: false
  )


  DeviceUpdateDtoTypeEnum? type;



  @override
  bool operator ==(Object other) => identical(this, other) || other is DeviceUpdateDto &&
     other.id == id &&
     other.version == version &&
     other.releseDate == releseDate &&
     other.releseNote == releseNote &&
     other.type == type;

  @override
  int get hashCode =>
    id.hashCode +
    version.hashCode +
    releseDate.hashCode +
    releseNote.hashCode +
    type.hashCode;

  factory DeviceUpdateDto.fromJson(Map<String, dynamic> json) => _$DeviceUpdateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceUpdateDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum DeviceUpdateDtoTypeEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
  @JsonValue(2)
  number2,
  @JsonValue(3)
  number3,
}


