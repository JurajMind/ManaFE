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
    timeStatistics = new SmokeSessionTimeStatisticsDto.fromJson(json['TimeStatistics']);
    accessoriesUsage = PipeAccessoryUsageDto.listFromJson(json['AccessoriesUsage']);
    smokeSessions = SmokeSessionSimpleDto.listFromJson(json['SmokeSessions']);
  }

  Map<String, dynamic> toJson() {
    return {
      'TimeStatistics': timeStatistics,
      'AccessoriesUsage': accessoriesUsage,
      'SmokeSessions': smokeSessions
    };
  }

  static List<PersonStatisticsOverallDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PersonStatisticsOverallDto>() : json.map((value) => new PersonStatisticsOverallDto.fromJson(value)).toList();
  }

  static Map<String, PersonStatisticsOverallDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PersonStatisticsOverallDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PersonStatisticsOverallDto.fromJson(value));
    }
    return map;
  }
}

