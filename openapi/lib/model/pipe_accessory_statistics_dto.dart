part of openapi.api;

class PipeAccessoryStatisticsDto {
  
  int used = null;
  
  double weight = null;
  
  int pipeAccessoryId = null;
  
  int smokeDurationTicks = null;
  
  double pufCount = null;
  
  double blowCount = null;
  
  int sessionDurationTick = null;
  
  int packType = null;
  //enum packTypeEnum {  0,  1,  2,  3,  4,  };{
  
  double quality = null;
  
  double taste = null;
  
  double smoke = null;
  
  double overall = null;
  
  double smokeTimePercentil = null;
  
  double sessionTimePercentil = null;
  PipeAccessoryStatisticsDto();

  @override
  String toString() {
    return 'PipeAccessoryStatisticsDto[used=$used, weight=$weight, pipeAccessoryId=$pipeAccessoryId, smokeDurationTicks=$smokeDurationTicks, pufCount=$pufCount, blowCount=$blowCount, sessionDurationTick=$sessionDurationTick, packType=$packType, quality=$quality, taste=$taste, smoke=$smoke, overall=$overall, smokeTimePercentil=$smokeTimePercentil, sessionTimePercentil=$sessionTimePercentil, ]';
  }

  PipeAccessoryStatisticsDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    used = json['Used'];
    weight = json['Weight'];
    pipeAccessoryId = json['PipeAccessoryId'];
    smokeDurationTicks = json['SmokeDurationTicks'];
    pufCount = json['PufCount'];
    blowCount = json['BlowCount'];
    sessionDurationTick = json['SessionDurationTick'];
    packType = json['PackType'];
    quality = json['Quality'];
    taste = json['Taste'];
    smoke = json['Smoke'];
    overall = json['Overall'];
    smokeTimePercentil = json['SmokeTimePercentil'];
    sessionTimePercentil = json['SessionTimePercentil'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Used': used,
      'Weight': weight,
      'PipeAccessoryId': pipeAccessoryId,
      'SmokeDurationTicks': smokeDurationTicks,
      'PufCount': pufCount,
      'BlowCount': blowCount,
      'SessionDurationTick': sessionDurationTick,
      'PackType': packType,
      'Quality': quality,
      'Taste': taste,
      'Smoke': smoke,
      'Overall': overall,
      'SmokeTimePercentil': smokeTimePercentil,
      'SessionTimePercentil': sessionTimePercentil
    };
  }

  static List<PipeAccessoryStatisticsDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PipeAccessoryStatisticsDto>() : json.map((value) => new PipeAccessoryStatisticsDto.fromJson(value)).toList();
  }

  static Map<String, PipeAccessoryStatisticsDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PipeAccessoryStatisticsDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PipeAccessoryStatisticsDto.fromJson(value));
    }
    return map;
  }
}

