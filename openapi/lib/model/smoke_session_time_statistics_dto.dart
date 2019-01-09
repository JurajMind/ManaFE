part of openapi.api;

class SmokeSessionTimeStatisticsDto {
  
  int sessionsCount = null;
  
  String sessionsDuration = null;
  
  String smokeDuration = null;
  
  int puffCount = null;
  
  Map<String, int> dayOfWeekDistribution = {};
  
  Map<String, int> sessionStartTimeDistribution = {};
  SmokeSessionTimeStatisticsDto();

  @override
  String toString() {
    return 'SmokeSessionTimeStatisticsDto[sessionsCount=$sessionsCount, sessionsDuration=$sessionsDuration, smokeDuration=$smokeDuration, puffCount=$puffCount, dayOfWeekDistribution=$dayOfWeekDistribution, sessionStartTimeDistribution=$sessionStartTimeDistribution, ]';
  }

  SmokeSessionTimeStatisticsDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    sessionsCount = json['SessionsCount'];
    sessionsDuration = json['SessionsDuration'];
    smokeDuration = json['SmokeDuration'];
    puffCount = json['PuffCount'];
    dayOfWeekDistribution = json['DayOfWeekDistribution'];
    sessionStartTimeDistribution = json['SessionStartTimeDistribution'];
  }

  Map<String, dynamic> toJson() {
    return {
      'SessionsCount': sessionsCount,
      'SessionsDuration': sessionsDuration,
      'SmokeDuration': smokeDuration,
      'PuffCount': puffCount,
      'DayOfWeekDistribution': dayOfWeekDistribution,
      'SessionStartTimeDistribution': sessionStartTimeDistribution
    };
  }

  static List<SmokeSessionTimeStatisticsDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmokeSessionTimeStatisticsDto>() : json.map((value) => new SmokeSessionTimeStatisticsDto.fromJson(value)).toList();
  }

  static Map<String, SmokeSessionTimeStatisticsDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmokeSessionTimeStatisticsDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmokeSessionTimeStatisticsDto.fromJson(value));
    }
    return map;
  }
}

