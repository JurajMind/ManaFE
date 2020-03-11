part of openapi.api;

class DeviceUpdateDto {
  
  int id = null;
  
  int version = null;
  
  DateTime releseDate = null;
  
  String releseNote = null;
  
  int type = null;
  //enum typeEnum {  0,  1,  2,  3,  };{
  DeviceUpdateDto();

  @override
  String toString() {
    return 'DeviceUpdateDto[id=$id, version=$version, releseDate=$releseDate, releseNote=$releseNote, type=$type, ]';
  }

  DeviceUpdateDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Version'] == null) {
      version = null;
    } else {
          version = json['Version'];
    }
    if (json['ReleseDate'] == null) {
      releseDate = null;
    } else {
      releseDate = DateTime.parse(json['ReleseDate']);
    }
    if (json['ReleseNote'] == null) {
      releseNote = null;
    } else {
          releseNote = json['ReleseNote'];
    }
    if (json['Type'] == null) {
      type = null;
    } else {
          type = json['Type'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (version != null)
      json['Version'] = version;
    if (releseDate != null)
      json['ReleseDate'] = releseDate == null ? null : releseDate.toUtc().toIso8601String();
    if (releseNote != null)
      json['ReleseNote'] = releseNote;
    if (type != null)
      json['Type'] = type;
    return json;
  }

  static List<DeviceUpdateDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DeviceUpdateDto>() : json.map((value) => new DeviceUpdateDto.fromJson(value)).toList();
  }

  static Map<String, DeviceUpdateDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DeviceUpdateDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new DeviceUpdateDto.fromJson(value));
    }
    return map;
  }
}

