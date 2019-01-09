part of openapi.api;

class DeviceSimpleDto {
  
  String name = null;
  
  String code = null;
  
  bool isOnline = null;
  DeviceSimpleDto();

  @override
  String toString() {
    return 'DeviceSimpleDto[name=$name, code=$code, isOnline=$isOnline, ]';
  }

  DeviceSimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['Name'];
    code = json['Code'];
    isOnline = json['IsOnline'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Code': code,
      'IsOnline': isOnline
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

