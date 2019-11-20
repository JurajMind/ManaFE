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
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['BrandName'] == null) {
      brandName = null;
    } else {
          brandName = json['BrandName'];
    }
    if (json['AccName'] == null) {
      accName = null;
    } else {
          accName = json['AccName'];
    }
    if (json['Type'] == null) {
      type = null;
    } else {
          type = json['Type'];
    }
    if (json['Used'] == null) {
      used = null;
    } else {
          used = json['Used'];
    }
    if (json['Owned'] == null) {
      owned = null;
    } else {
          owned = json['Owned'];
    }
    if (json['InMix'] == null) {
      inMix = null;
    } else {
          inMix = json['InMix'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (brandName != null)
      json['BrandName'] = brandName;
    if (accName != null)
      json['AccName'] = accName;
    if (type != null)
      json['Type'] = type;
    if (used != null)
      json['Used'] = used;
    if (owned != null)
      json['Owned'] = owned;
    if (inMix != null)
      json['InMix'] = inMix;
    return json;
  }

  static List<PipeAccessoryUsageDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PipeAccessoryUsageDto>() : json.map((value) => new PipeAccessoryUsageDto.fromJson(value)).toList();
  }

  static Map<String, PipeAccessoryUsageDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PipeAccessoryUsageDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PipeAccessoryUsageDto.fromJson(value));
    }
    return map;
  }
}

