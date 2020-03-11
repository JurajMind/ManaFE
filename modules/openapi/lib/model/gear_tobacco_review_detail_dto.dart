part of openapi.api;

class GearTobaccoReviewDetailDto {
  
  SmartHookahModelsDbSessionDtoSessionReviewDto smokeSessionId = null;
  
  int id = null;
  
  int cut = null;
  
  int taste = null;
  
  int smoke = null;
  
  int strength = null;
  
  int duration = null;
  
  double overall = null;
  
  String text = null;
  
  int sessionReviewId = null;
  
  List<MediaDto> medias = [];
  GearTobaccoReviewDetailDto();

  @override
  String toString() {
    return 'GearTobaccoReviewDetailDto[smokeSessionId=$smokeSessionId, id=$id, cut=$cut, taste=$taste, smoke=$smoke, strength=$strength, duration=$duration, overall=$overall, text=$text, sessionReviewId=$sessionReviewId, medias=$medias, ]';
  }

  GearTobaccoReviewDetailDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['SmokeSessionId'] == null) {
      smokeSessionId = null;
    } else {
      smokeSessionId = new SmartHookahModelsDbSessionDtoSessionReviewDto.fromJson(json['SmokeSessionId']);
    }
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Cut'] == null) {
      cut = null;
    } else {
          cut = json['Cut'];
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
    if (json['Strength'] == null) {
      strength = null;
    } else {
          strength = json['Strength'];
    }
    if (json['Duration'] == null) {
      duration = null;
    } else {
          duration = json['Duration'];
    }
    if (json['Overall'] == null) {
      overall = null;
    } else {
          overall = json['Overall'];
    }
    if (json['Text'] == null) {
      text = null;
    } else {
          text = json['Text'];
    }
    if (json['SessionReviewId'] == null) {
      sessionReviewId = null;
    } else {
          sessionReviewId = json['SessionReviewId'];
    }
    if (json['Medias'] == null) {
      medias = null;
    } else {
      medias = MediaDto.listFromJson(json['Medias']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (smokeSessionId != null)
      json['SmokeSessionId'] = smokeSessionId;
    if (id != null)
      json['Id'] = id;
    if (cut != null)
      json['Cut'] = cut;
    if (taste != null)
      json['Taste'] = taste;
    if (smoke != null)
      json['Smoke'] = smoke;
    if (strength != null)
      json['Strength'] = strength;
    if (duration != null)
      json['Duration'] = duration;
    if (overall != null)
      json['Overall'] = overall;
    if (text != null)
      json['Text'] = text;
    if (sessionReviewId != null)
      json['SessionReviewId'] = sessionReviewId;
    if (medias != null)
      json['Medias'] = medias;
    return json;
  }

  static List<GearTobaccoReviewDetailDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<GearTobaccoReviewDetailDto>() : json.map((value) => new GearTobaccoReviewDetailDto.fromJson(value)).toList();
  }

  static Map<String, GearTobaccoReviewDetailDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, GearTobaccoReviewDetailDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new GearTobaccoReviewDetailDto.fromJson(value));
    }
    return map;
  }
}

