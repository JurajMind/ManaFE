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
  
  String sizes = null;
  MediaDto();

  @override
  String toString() {
    return 'MediaDto[id=$id, created=$created, path=$path, type=$type, isDefault=$isDefault, extension=$extension, fileName=$fileName, sizes=$sizes, ]';
  }

  MediaDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Created'] == null) {
      created = null;
    } else {
      created = DateTime.parse(json['Created']);
    }
    if (json['Path'] == null) {
      path = null;
    } else {
          path = json['Path'];
    }
    if (json['Type'] == null) {
      type = null;
    } else {
          type = json['Type'];
    }
    if (json['IsDefault'] == null) {
      isDefault = null;
    } else {
          isDefault = json['IsDefault'];
    }
    if (json['Extension'] == null) {
      extension = null;
    } else {
          extension = json['Extension'];
    }
    if (json['FileName'] == null) {
      fileName = null;
    } else {
          fileName = json['FileName'];
    }
    if (json['Sizes'] == null) {
      sizes = null;
    } else {
          sizes = json['Sizes'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (created != null)
      json['Created'] = created == null ? null : created.toUtc().toIso8601String();
    if (path != null)
      json['Path'] = path;
    if (type != null)
      json['Type'] = type;
    if (isDefault != null)
      json['IsDefault'] = isDefault;
    if (extension != null)
      json['Extension'] = extension;
    if (fileName != null)
      json['FileName'] = fileName;
    if (sizes != null)
      json['Sizes'] = sizes;
    return json;
  }

  static List<MediaDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<MediaDto>() : json.map((value) => new MediaDto.fromJson(value)).toList();
  }

  static Map<String, MediaDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, MediaDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new MediaDto.fromJson(value));
    }
    return map;
  }
}

