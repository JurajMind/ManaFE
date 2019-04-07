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
    id = json['id'];
    start = json['start'] == null ? null : DateTime.parse(json['start']);
    end = json['end'] == null ? null : DateTime.parse(json['end']);
    smokeDuration = json['smokeDuration'];
    longestPuf = json['longestPuf'];
    pufCount = json['pufCount'];
    estimatedPersonCount = json['estimatedPersonCount'];
    sessionDuration = json['sessionDuration'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'start': start == null ? '' : start.toUtc().toIso8601String(),
      'end': end == null ? '' : end.toUtc().toIso8601String(),
      'smokeDuration': smokeDuration,
      'longestPuf': longestPuf,
      'pufCount': pufCount,
      'estimatedPersonCount': estimatedPersonCount,
      'sessionDuration': sessionDuration
    };
  }

  static List<SmokeSessionStatisticsDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmokeSessionStatisticsDto>() : json.map((value) => new SmokeSessionStatisticsDto.fromJson(value)).toList();
  }

  static Map<String, SmokeSessionStatisticsDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmokeSessionStatisticsDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmokeSessionStatisticsDto.fromJson(value));
    }
    return map;
  }
}

