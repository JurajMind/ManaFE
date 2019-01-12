part of openapi.api;

class DeviceSimpleDto {
  
  String name = null;
  
  String code = null;
  
  bool isOnline = null;
  
  int type = null;
  //enum typeEnum {  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  };{
  
  int version = null;
  DeviceSimpleDto();

  @override
  String toString() {
    return 'DeviceSimpleDto[name=$name, code=$code, isOnline=$isOnline, type=$type, version=$version, ]';
  }

  DeviceSimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['Name'];
    code = json['Code'];
    isOnline = json['IsOnline'];
    type = json['Type'];
    version = json['Version'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Code': code,
      'IsOnline': isOnline,
      'Type': type,
      'Version': version
    };
  }

  static List<DeviceSimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DeviceSimpleDto>() : json.map((value) => new DeviceSimpleDto.fromJson(value)).toList();
  }

  static Map<String, DeviceSimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DeviceSimpleDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new DeviceSimpleDto.fromJson(value));
    }
    return map;
  }
}

