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
    if (json['Picture'] == null) {
      picture = null;
    } else {
      picture = new DeviceDevicePictureDto.fromJson(json['Picture']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (picture != null)
      json['Picture'] = picture;
    return json;
  }

  static List<SmartHookahControllersApiDeviceInfoResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahControllersApiDeviceInfoResponse>() : json.map((value) => new SmartHookahControllersApiDeviceInfoResponse.fromJson(value)).toList();
  }

  static Map<String, SmartHookahControllersApiDeviceInfoResponse> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahControllersApiDeviceInfoResponse>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahControllersApiDeviceInfoResponse.fromJson(value));
    }
    return map;
  }
}

