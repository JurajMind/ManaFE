part of openapi.api;

class FinishedSessionDataDto {
  
  SmokeSessionMetaDataDto metaData = null;
  
  SmokeSessionStatisticsDto statistics = null;
  FinishedSessionDataDto();

  @override
  String toString() {
    return 'FinishedSessionDataDto[metaData=$metaData, statistics=$statistics, ]';
  }

  FinishedSessionDataDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    metaData = new SmokeSessionMetaDataDto.fromJson(json['MetaData']);
    statistics = new SmokeSessionStatisticsDto.fromJson(json['Statistics']);
  }

  Map<String, dynamic> toJson() {
    return {
      'MetaData': metaData,
      'Statistics': statistics
    };
  }

  static List<FinishedSessionDataDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<FinishedSessionDataDto>() : json.map((value) => new FinishedSessionDataDto.fromJson(value)).toList();
  }

  static Map<String, FinishedSessionDataDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, FinishedSessionDataDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new FinishedSessionDataDto.fromJson(value));
    }
    return map;
  }
}

