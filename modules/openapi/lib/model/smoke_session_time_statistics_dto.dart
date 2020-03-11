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
    if (json['SessionsCount'] == null) {
      sessionsCount = null;
    } else {
          sessionsCount = json['SessionsCount'];
    }
    if (json['SessionsDuration'] == null) {
      sessionsDuration = null;
    } else {
          sessionsDuration = json['SessionsDuration'];
    }
    if (json['SmokeDuration'] == null) {
      smokeDuration = null;
    } else {
          smokeDuration = json['SmokeDuration'];
    }
    if (json['PuffCount'] == null) {
      puffCount = null;
    } else {
          puffCount = json['PuffCount'];
    }
    if (json['DayOfWeekDistribution'] == null) {
      dayOfWeekDistribution = null;
    } else {
          dayOfWeekDistribution = (json['DayOfWeekDistribution'] as Map).cast<String, int>();
    }
    if (json['SessionStartTimeDistribution'] == null) {
      sessionStartTimeDistribution = null;
    } else {
          sessionStartTimeDistribution = (json['SessionStartTimeDistribution'] as Map).cast<String, int>();
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (sessionsCount != null)
      json['SessionsCount'] = sessionsCount;
    if (sessionsDuration != null)
      json['SessionsDuration'] = sessionsDuration;
    if (smokeDuration != null)
      json['SmokeDuration'] = smokeDuration;
    if (puffCount != null)
      json['PuffCount'] = puffCount;
    if (dayOfWeekDistribution != null)
      json['DayOfWeekDistribution'] = dayOfWeekDistribution;
    if (sessionStartTimeDistribution != null)
      json['SessionStartTimeDistribution'] = sessionStartTimeDistribution;
    return json;
  }

  static List<SmokeSessionTimeStatisticsDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmokeSessionTimeStatisticsDto>() : json.map((value) => new SmokeSessionTimeStatisticsDto.fromJson(value)).toList();
  }

  static Map<String, SmokeSessionTimeStatisticsDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmokeSessionTimeStatisticsDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmokeSessionTimeStatisticsDto.fromJson(value));
    }
    return map;
  }
}

