part of openapi.api;

class MediaDto {
  
  int id = null;
  
  DateTime created = null;
  
  String path = null;
  
  int type = null;
  //enum typeEnum {  0,  1,  };{
  
  bool isDefault = null;
  
  String extension = null;
  
  String fileName = null;
  MediaDto();

  @override
  String toString() {
    return 'MediaDto[id=$id, created=$created, path=$path, type=$type, isDefault=$isDefault, extension=$extension, fileName=$fileName, ]';
  }

  MediaDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
   // created = json['Created'] == null ? null : DateTime.parse(json['Created']);
    path = json['Path'];
    type = json['Type'];
    isDefault = json['IsDefault'];
    extension = json['Extension'];
    fileName = json['FileName'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Created': created == null ? '' : created.toUtc().toIso8601String(),
      'Path': path,
      'Type': type,
      'IsDefault': isDefault,
      'Extension': extension,
      'FileName': fileName
    };
  }

  static List<MediaDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<MediaDto>() : json.map((value) => new MediaDto.fromJson(value)).toList();
  }

  static Map<String, MediaDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, MediaDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new MediaDto.fromJson(value));
    }
    return map;
  }
}

