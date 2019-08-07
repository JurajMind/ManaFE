part of openapi.api;

class PersonStatisticsOverallDto {
  
  SmokeSessionTimeStatisticsDto timeStatistics = null;
  
  List<PipeAccessoryUsageDto> accessoriesUsage = [];
  
  List<SmokeSessionSimpleDto> smokeSessions = [];
  PersonStatisticsOverallDto();

  @override
  String toString() {
    return 'PersonStatisticsOverallDto[timeStatistics=$timeStatistics, accessoriesUsage=$accessoriesUsage, smokeSessions=$smokeSessions, ]';
  }

  PersonStatisticsOverallDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['TimeStatistics'] == null) {
      timeStatistics = null;
    } else {
      timeStatistics = new SmokeSessionTimeStatisticsDto.fromJson(json['TimeStatistics']);
    }
    if (json['AccessoriesUsage'] == null) {
      accessoriesUsage = null;
    } else {
      accessoriesUsage = PipeAccessoryUsageDto.listFromJson(json['AccessoriesUsage']);
    }
    if (json['SmokeSessions'] == null) {
      smokeSessions = null;
    } else {
      smokeSessions = SmokeSessionSimpleDto.listFromJson(json['SmokeSessions']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (timeStatistics != null)
      json['TimeStatistics'] = timeStatistics;
    if (accessoriesUsage != null)
      json['AccessoriesUsage'] = accessoriesUsage;
    if (smokeSessions != null)
      json['SmokeSessions'] = smokeSessions;
    return json;
  }

  static List<PersonStatisticsOverallDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PersonStatisticsOverallDto>() : json.map((value) => new PersonStatisticsOverallDto.fromJson(value)).toList();
  }

  static Map<String, PersonStatisticsOverallDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PersonStatisticsOverallDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PersonStatisticsOverallDto.fromJson(value));
    }
    return map;
  }
}

