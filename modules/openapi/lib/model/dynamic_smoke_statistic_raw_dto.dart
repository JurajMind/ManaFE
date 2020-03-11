part of openapi.api;

class DynamicSmokeStatisticRawDto {
  
  int pufCount = null;
  
  int lastPuf = null;
  
  int lastPufTime = null;
  
  int smokeDuration = null;
  
  int longestPuf = null;
  
  int start = null;
  
  int duration = null;
  
  int longestPufMilis = null;
  DynamicSmokeStatisticRawDto();

  @override
  String toString() {
    return 'DynamicSmokeStatisticRawDto[pufCount=$pufCount, lastPuf=$lastPuf, lastPufTime=$lastPufTime, smokeDuration=$smokeDuration, longestPuf=$longestPuf, start=$start, duration=$duration, longestPufMilis=$longestPufMilis, ]';
  }

  DynamicSmokeStatisticRawDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['PufCount'] == null) {
      pufCount = null;
    } else {
          pufCount = json['PufCount'];
    }
    if (json['LastPuf'] == null) {
      lastPuf = null;
    } else {
          lastPuf = json['LastPuf'];
    }
    if (json['LastPufTime'] == null) {
      lastPufTime = null;
    } else {
          lastPufTime = json['LastPufTime'];
    }
    if (json['SmokeDuration'] == null) {
      smokeDuration = null;
    } else {
          smokeDuration = json['SmokeDuration'];
    }
    if (json['LongestPuf'] == null) {
      longestPuf = null;
    } else {
          longestPuf = json['LongestPuf'];
    }
    if (json['Start'] == null) {
      start = null;
    } else {
          start = json['Start'];
    }
    if (json['Duration'] == null) {
      duration = null;
    } else {
          duration = json['Duration'];
    }
    if (json['LongestPufMilis'] == null) {
      longestPufMilis = null;
    } else {
          longestPufMilis = json['LongestPufMilis'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (pufCount != null)
      json['PufCount'] = pufCount;
    if (lastPuf != null)
      json['LastPuf'] = lastPuf;
    if (lastPufTime != null)
      json['LastPufTime'] = lastPufTime;
    if (smokeDuration != null)
      json['SmokeDuration'] = smokeDuration;
    if (longestPuf != null)
      json['LongestPuf'] = longestPuf;
    if (start != null)
      json['Start'] = start;
    if (duration != null)
      json['Duration'] = duration;
    if (longestPufMilis != null)
      json['LongestPufMilis'] = longestPufMilis;
    return json;
  }

  static List<DynamicSmokeStatisticRawDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DynamicSmokeStatisticRawDto>() : json.map((value) => new DynamicSmokeStatisticRawDto.fromJson(value)).toList();
  }

  static Map<String, DynamicSmokeStatisticRawDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DynamicSmokeStatisticRawDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new DynamicSmokeStatisticRawDto.fromJson(value));
    }
    return map;
  }
}

