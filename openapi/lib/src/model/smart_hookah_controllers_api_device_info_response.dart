//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/device_device_picture_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_controllers_api_device_info_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahControllersApiDeviceInfoResponse {
  /// Returns a new [SmartHookahControllersApiDeviceInfoResponse] instance.
  SmartHookahControllersApiDeviceInfoResponse({

     this.picture,
  });

  @JsonKey(
    
    name: r'Picture',
    required: false,
    includeIfNull: false
  )


  DeviceDevicePictureDto? picture;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahControllersApiDeviceInfoResponse &&
     other.picture == picture;

  @override
  int get hashCode =>
    picture.hashCode;

  factory SmartHookahControllersApiDeviceInfoResponse.fromJson(Map<String, dynamic> json) => _$SmartHookahControllersApiDeviceInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahControllersApiDeviceInfoResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

