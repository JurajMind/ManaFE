part of openapi.api;

class FinishedSessionDataDto {
  
  SmokeSessionSimpleDto data = null;
  
  SmokeSessionMetaDataDto metaData = null;
  
  SmokeSessionStatisticsDto statistics = null;
  
  bool assigned = null;
  FinishedSessionDataDto();

  @override
  String toString() {
    return 'FinishedSessionDataDto[data=$data, metaData=$metaData, statistics=$statistics, assigned=$assigned, ]';
  }

  FinishedSessionDataDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Data'] == null) {
      data = null;
    } else {
      data = new SmokeSessionSimpleDto.fromJson(json['Data']);
    }
    if (json['MetaData'] == null) {
      metaData = null;
    } else {
      metaData = new SmokeSessionMetaDataDto.fromJson(json['MetaData']);
    }
    if (json['Statistics'] == null) {
      statistics = null;
    } else {
      statistics = new SmokeSessionStatisticsDto.fromJson(json['Statistics']);
    }
    if (json['Assigned'] == null) {
      assigned = null;
    } else {
          assigned = json['Assigned'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (data != null)
      json['Data'] = data;
    if (metaData != null)
      json['MetaData'] = metaData;
    if (statistics != null)
      json['Statistics'] = statistics;
    if (assigned != null)
      json['Assigned'] = assigned;
    return json;
  }

  static List<FinishedSessionDataDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<FinishedSessionDataDto>() : json.map((value) => new FinishedSessionDataDto.fromJson(value)).toList();
  }

  static Map<String, FinishedSessionDataDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, FinishedSessionDataDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new FinishedSessionDataDto.fromJson(value));
    }
    return map;
  }
}

