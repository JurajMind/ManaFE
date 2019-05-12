part of openapi.api;

class PipeAccessoryUsageDto {
  
  int id = null;
  
  String brandName = null;
  
  String accName = null;
  
  String type = null;
  
  int used = null;
  
  bool owned = null;
  
  int inMix = null;
  PipeAccessoryUsageDto();

  @override
  String toString() {
    return 'PipeAccessoryUsageDto[id=$id, brandName=$brandName, accName=$accName, type=$type, used=$used, owned=$owned, inMix=$inMix, ]';
  }

  PipeAccessoryUsageDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    brandName = json['BrandName'];
    accName = json['AccName'];
    type = json['Type'];
    used = json['Used'];
    owned = json['Owned'];
    inMix = json['InMix'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'BrandName': brandName,
      'AccName': accName,
      'Type': type,
      'Used': used,
      'Owned': owned,
      'InMix': inMix
    };
  }

  static List<PipeAccessoryUsageDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PipeAccessoryUsageDto>() : json.map((value) => new PipeAccessoryUsageDto.fromJson(value)).toList();
  }

  static Map<String, PipeAccessoryUsageDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PipeAccessoryUsageDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PipeAccessoryUsageDto.fromJson(value));
    }
    return map;
  }
}

