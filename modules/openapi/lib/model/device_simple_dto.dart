part of openapi.api;

class DeviceSimpleDto {
  
  int id = null;
  
  String name = null;
  
  String code = null;
  
  bool isOnline = null;
  
  int type = null;
  //enum typeEnum {  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  };{
  
  int version = null;
  DeviceSimpleDto();

  @override
  String toString() {
    return 'DeviceSimpleDto[id=$id, name=$name, code=$code, isOnline=$isOnline, type=$type, version=$version, ]';
  }

  DeviceSimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Name'] == null) {
      name = null;
    } else {
          name = json['Name'];
    }
    if (json['Code'] == null) {
      code = null;
    } else {
          code = json['Code'];
    }
    if (json['IsOnline'] == null) {
      isOnline = null;
    } else {
          isOnline = json['IsOnline'];
    }
    if (json['Type'] == null) {
      type = null;
    } else {
          type = json['Type'];
    }
    if (json['Version'] == null) {
      version = null;
    } else {
          version = json['Version'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (name != null)
      json['Name'] = name;
    if (code != null)
      json['Code'] = code;
    if (isOnline != null)
      json['IsOnline'] = isOnline;
    if (type != null)
      json['Type'] = type;
    if (version != null)
      json['Version'] = version;
    return json;
  }

  static List<DeviceSimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DeviceSimpleDto>() : json.map((value) => new DeviceSimpleDto.fromJson(value)).toList();
  }

  static Map<String, DeviceSimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DeviceSimpleDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new DeviceSimpleDto.fromJson(value));
    }
    return map;
  }
}

