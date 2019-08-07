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
    if (json['Used'] == null) {
      used = null;
    } else {
          used = json['Used'];
    }
    if (json['Weight'] == null) {
      weight = null;
    } else {
          weight = json['Weight'];
    }
    if (json['PipeAccessoryId'] == null) {
      pipeAccessoryId = null;
    } else {
          pipeAccessoryId = json['PipeAccessoryId'];
    }
    if (json['SmokeDurationTicks'] == null) {
      smokeDurationTicks = null;
    } else {
          smokeDurationTicks = json['SmokeDurationTicks'];
    }
    if (json['PufCount'] == null) {
      pufCount = null;
    } else {
          pufCount = json['PufCount'];
    }
    if (json['BlowCount'] == null) {
      blowCount = null;
    } else {
          blowCount = json['BlowCount'];
    }
    if (json['SessionDurationTick'] == null) {
      sessionDurationTick = null;
    } else {
          sessionDurationTick = json['SessionDurationTick'];
    }
    if (json['PackType'] == null) {
      packType = null;
    } else {
          packType = json['PackType'];
    }
    if (json['Quality'] == null) {
      quality = null;
    } else {
          quality = json['Quality'];
    }
    if (json['Taste'] == null) {
      taste = null;
    } else {
          taste = json['Taste'];
    }
    if (json['Smoke'] == null) {
      smoke = null;
    } else {
          smoke = json['Smoke'];
    }
    if (json['Overall'] == null) {
      overall = null;
    } else {
          overall = json['Overall'];
    }
    if (json['SmokeTimePercentil'] == null) {
      smokeTimePercentil = null;
    } else {
          smokeTimePercentil = json['SmokeTimePercentil'];
    }
    if (json['SessionTimePercentil'] == null) {
      sessionTimePercentil = null;
    } else {
          sessionTimePercentil = json['SessionTimePercentil'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (used != null)
      json['Used'] = used;
    if (weight != null)
      json['Weight'] = weight;
    if (pipeAccessoryId != null)
      json['PipeAccessoryId'] = pipeAccessoryId;
    if (smokeDurationTicks != null)
      json['SmokeDurationTicks'] = smokeDurationTicks;
    if (pufCount != null)
      json['PufCount'] = pufCount;
    if (blowCount != null)
      json['BlowCount'] = blowCount;
    if (sessionDurationTick != null)
      json['SessionDurationTick'] = sessionDurationTick;
    if (packType != null)
      json['PackType'] = packType;
    if (quality != null)
      json['Quality'] = quality;
    if (taste != null)
      json['Taste'] = taste;
    if (smoke != null)
      json['Smoke'] = smoke;
    if (overall != null)
      json['Overall'] = overall;
    if (smokeTimePercentil != null)
      json['SmokeTimePercentil'] = smokeTimePercentil;
    if (sessionTimePercentil != null)
      json['SessionTimePercentil'] = sessionTimePercentil;
    return json;
  }

  static List<PipeAccessoryStatisticsDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PipeAccessoryStatisticsDto>() : json.map((value) => new PipeAccessoryStatisticsDto.fromJson(value)).toList();
  }

  static Map<String, PipeAccessoryStatisticsDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PipeAccessoryStatisticsDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PipeAccessoryStatisticsDto.fromJson(value));
    }
    return map;
  }
}

