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
    pufCount = json['PufCount'];
    lastPuf = json['LastPuf'];
    lastPufTime = json['LastPufTime'];
    smokeDuration = json['SmokeDuration'];
    longestPuf = json['LongestPuf'];
    start = json['Start'];
    duration = json['Duration'];
    longestPufMilis = json['LongestPufMilis'];
  }

  Map<String, dynamic> toJson() {
    return {
      'PufCount': pufCount,
      'LastPuf': lastPuf,
      'LastPufTime': lastPufTime,
      'SmokeDuration': smokeDuration,
      'LongestPuf': longestPuf,
      'Start': start,
      'Duration': duration,
      'LongestPufMilis': longestPufMilis
    };
  }

  static List<DynamicSmokeStatisticRawDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DynamicSmokeStatisticRawDto>() : json.map((value) => new DynamicSmokeStatisticRawDto.fromJson(value)).toList();
  }

  static Map<String, DynamicSmokeStatisticRawDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DynamicSmokeStatisticRawDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new DynamicSmokeStatisticRawDto.fromJson(value));
    }
    return map;
  }
}

