//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'device_device_picture_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeviceDevicePictureDto {
  /// Returns a new [DeviceDevicePictureDto] instance.
  DeviceDevicePictureDto({

     this.id,

     this.width,

     this.height,

     this.inlinePicture,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Width',
    required: false,
    includeIfNull: false
  )


  int? width;



  @JsonKey(
    
    name: r'Height',
    required: false,
    includeIfNull: false
  )


  int? height;



  @JsonKey(
    
    name: r'InlinePicture',
    required: false,
    includeIfNull: false
  )


  String? inlinePicture;



  @override
  bool operator ==(Object other) => identical(this, other) || other is DeviceDevicePictureDto &&
     other.id == id &&
     other.width == width &&
     other.height == height &&
     other.inlinePicture == inlinePicture;

  @override
  int get hashCode =>
    id.hashCode +
    width.hashCode +
    height.hashCode +
    inlinePicture.hashCode;

  factory DeviceDevicePictureDto.fromJson(Map<String, dynamic> json) => _$DeviceDevicePictureDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceDevicePictureDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

