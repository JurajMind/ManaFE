part of openapi.api;

class UsedWithDto {
  
  PipeAccesorySimpleDto accessory = null;
  
  int usedCount = null;
  UsedWithDto();

  @override
  String toString() {
    return 'UsedWithDto[accessory=$accessory, usedCount=$usedCount, ]';
  }

  UsedWithDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    accessory = new PipeAccesorySimpleDto.fromJson(json['Accessory']);
    usedCount = json['UsedCount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Accessory': accessory,
      'UsedCount': usedCount
    };
  }

  static List<UsedWithDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<UsedWithDto>() : json.map((value) => new UsedWithDto.fromJson(value)).toList();
  }

  static Map<String, UsedWithDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, UsedWithDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new UsedWithDto.fromJson(value));
    }
    return map;
  }
}

