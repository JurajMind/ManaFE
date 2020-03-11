part of openapi.api;

class GearTobaccoReviewDto {
  
  int id = null;
  
  int cut = null;
  
  int taste = null;
  
  int smoke = null;
  
  int strength = null;
  
  int duration = null;
  
  double overall = null;
  
  String text = null;
  
  int smokeSessionId = null;
  
  int sessionReviewId = null;
  
  List<MediaDto> medias = [];
  GearTobaccoReviewDto();

  @override
  String toString() {
    return 'GearTobaccoReviewDto[id=$id, cut=$cut, taste=$taste, smoke=$smoke, strength=$strength, duration=$duration, overall=$overall, text=$text, smokeSessionId=$smokeSessionId, sessionReviewId=$sessionReviewId, medias=$medias, ]';
  }

  GearTobaccoReviewDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
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
    if (json['SmokeSessionId'] == null) {
      smokeSessionId = null;
    } else {
          smokeSessionId = json['SmokeSessionId'];
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
    if (smokeSessionId != null)
      json['SmokeSessionId'] = smokeSessionId;
    if (sessionReviewId != null)
      json['SessionReviewId'] = sessionReviewId;
    if (medias != null)
      json['Medias'] = medias;
    return json;
  }

  static List<GearTobaccoReviewDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<GearTobaccoReviewDto>() : json.map((value) => new GearTobaccoReviewDto.fromJson(value)).toList();
  }

  static Map<String, GearTobaccoReviewDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, GearTobaccoReviewDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new GearTobaccoReviewDto.fromJson(value));
    }
    return map;
  }
}

