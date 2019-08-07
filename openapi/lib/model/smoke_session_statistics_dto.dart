part of openapi.api;

class SmokeSessionStatisticsDto {
  
  int id = null;
  
  DateTime start = null;
  
  DateTime end = null;
  
  String smokeDuration = null;
  
  String longestPuf = null;
  
  int pufCount = null;
  
  int estimatedPersonCount = null;
  
  String sessionDuration = null;
  SmokeSessionStatisticsDto();

  @override
  String toString() {
    return 'SmokeSessionStatisticsDto[id=$id, start=$start, end=$end, smokeDuration=$smokeDuration, longestPuf=$longestPuf, pufCount=$pufCount, estimatedPersonCount=$estimatedPersonCount, sessionDuration=$sessionDuration, ]';
  }

  SmokeSessionStatisticsDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
          id = json['id'];
    }
    if (json['start'] == null) {
      start = null;
    } else {
      start = DateTime.parse(json['start']);
    }
    if (json['end'] == null) {
      end = null;
    } else {
      end = DateTime.parse(json['end']);
    }
    if (json['smokeDuration'] == null) {
      smokeDuration = null;
    } else {
          smokeDuration = json['smokeDuration'];
    }
    if (json['longestPuf'] == null) {
      longestPuf = null;
    } else {
          longestPuf = json['longestPuf'];
    }
    if (json['pufCount'] == null) {
      pufCount = null;
    } else {
          pufCount = json['pufCount'];
    }
    if (json['estimatedPersonCount'] == null) {
      estimatedPersonCount = null;
    } else {
          estimatedPersonCount = json['estimatedPersonCount'];
    }
    if (json['sessionDuration'] == null) {
      sessionDuration = null;
    } else {
          sessionDuration = json['sessionDuration'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (start != null)
      json['start'] = start == null ? null : start.toUtc().toIso8601String();
    if (end != null)
      json['end'] = end == null ? null : end.toUtc().toIso8601String();
    if (smokeDuration != null)
      json['smokeDuration'] = smokeDuration;
    if (longestPuf != null)
      json['longestPuf'] = longestPuf;
    if (pufCount != null)
      json['pufCount'] = pufCount;
    if (estimatedPersonCount != null)
      json['estimatedPersonCount'] = estimatedPersonCount;
    if (sessionDuration != null)
      json['sessionDuration'] = sessionDuration;
    return json;
  }

  static List<SmokeSessionStatisticsDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmokeSessionStatisticsDto>() : json.map((value) => new SmokeSessionStatisticsDto.fromJson(value)).toList();
  }

  static Map<String, SmokeSessionStatisticsDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmokeSessionStatisticsDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmokeSessionStatisticsDto.fromJson(value));
    }
    return map;
  }
}

