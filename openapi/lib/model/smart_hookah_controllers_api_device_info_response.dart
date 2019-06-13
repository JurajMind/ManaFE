part of openapi.api;

class SmartHookahControllersApiDeviceInfoResponse {
  
  DeviceDevicePictureDto picture = null;
  SmartHookahControllersApiDeviceInfoResponse();

  @override
  String toString() {
    return 'SmartHookahControllersApiDeviceInfoResponse[picture=$picture, ]';
  }

  SmartHookahControllersApiDeviceInfoResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    picture = new DeviceDevicePictureDto.fromJson(json['Picture']);
  }

  Map<String, dynamic> toJson() {
    return {
      'Picture': picture
    };
  }

  static List<SmartHookahControllersApiDeviceInfoResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahControllersApiDeviceInfoResponse>() : json.map((value) => new SmartHookahControllersApiDeviceInfoResponse.fromJson(value)).toList();
  }

  static Map<String, SmartHookahControllersApiDeviceInfoResponse> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahControllersApiDeviceInfoResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahControllersApiDeviceInfoResponse.fromJson(value));
    }
    return map;
  }
}

