part of openapi.api;

class DeviceDevicePictureDto {
  
  int id = null;
  
  int width = null;
  
  int height = null;
  
  String inlinePicture = null;
  DeviceDevicePictureDto();

  @override
  String toString() {
    return 'DeviceDevicePictureDto[id=$id, width=$width, height=$height, inlinePicture=$inlinePicture, ]';
  }

  DeviceDevicePictureDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    width = json['Width'];
    height = json['Height'];
    inlinePicture = json['InlinePicture'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Width': width,
      'Height': height,
      'InlinePicture': inlinePicture
    };
  }

  static List<DeviceDevicePictureDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DeviceDevicePictureDto>() : json.map((value) => new DeviceDevicePictureDto.fromJson(value)).toList();
  }

  static Map<String, DeviceDevicePictureDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DeviceDevicePictureDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new DeviceDevicePictureDto.fromJson(value));
    }
    return map;
  }
}

