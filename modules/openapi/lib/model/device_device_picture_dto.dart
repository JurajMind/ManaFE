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
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Width'] == null) {
      width = null;
    } else {
          width = json['Width'];
    }
    if (json['Height'] == null) {
      height = null;
    } else {
          height = json['Height'];
    }
    if (json['InlinePicture'] == null) {
      inlinePicture = null;
    } else {
          inlinePicture = json['InlinePicture'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (width != null)
      json['Width'] = width;
    if (height != null)
      json['Height'] = height;
    if (inlinePicture != null)
      json['InlinePicture'] = inlinePicture;
    return json;
  }

  static List<DeviceDevicePictureDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DeviceDevicePictureDto>() : json.map((value) => new DeviceDevicePictureDto.fromJson(value)).toList();
  }

  static Map<String, DeviceDevicePictureDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DeviceDevicePictureDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new DeviceDevicePictureDto.fromJson(value));
    }
    return map;
  }
}

