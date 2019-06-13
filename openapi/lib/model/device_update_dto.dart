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
    id = json['Id'];
    version = json['Version'];
    releseDate = json['ReleseDate'] == null ? null : DateTime.parse(json['ReleseDate']);
    releseNote = json['ReleseNote'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Version': version,
      'ReleseDate': releseDate == null ? '' : releseDate.toUtc().toIso8601String(),
      'ReleseNote': releseNote,
      'Type': type
    };
  }

  static List<DeviceUpdateDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DeviceUpdateDto>() : json.map((value) => new DeviceUpdateDto.fromJson(value)).toList();
  }

  static Map<String, DeviceUpdateDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DeviceUpdateDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new DeviceUpdateDto.fromJson(value));
    }
    return map;
  }
}

