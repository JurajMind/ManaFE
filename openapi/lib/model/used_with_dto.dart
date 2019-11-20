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
    if (json['Accessory'] == null) {
      accessory = null;
    } else {
      accessory = new PipeAccesorySimpleDto.fromJson(json['Accessory']);
    }
    if (json['UsedCount'] == null) {
      usedCount = null;
    } else {
          usedCount = json['UsedCount'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (accessory != null)
      json['Accessory'] = accessory;
    if (usedCount != null)
      json['UsedCount'] = usedCount;
    return json;
  }

  static List<UsedWithDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<UsedWithDto>() : json.map((value) => new UsedWithDto.fromJson(value)).toList();
  }

  static Map<String, UsedWithDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, UsedWithDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new UsedWithDto.fromJson(value));
    }
    return map;
  }
}

