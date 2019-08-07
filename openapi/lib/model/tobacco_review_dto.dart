part of openapi.api;

class TobaccoReviewDto {
  
  int id = null;
  
  int quality = null;
  
  int taste = null;
  
  int smoke = null;
  
  double overall = null;
  
  String text = null;
  
  int smokeSessionId = null;
  TobaccoReviewDto();

  @override
  String toString() {
    return 'TobaccoReviewDto[id=$id, quality=$quality, taste=$taste, smoke=$smoke, overall=$overall, text=$text, smokeSessionId=$smokeSessionId, ]';
  }

  TobaccoReviewDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
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
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (quality != null)
      json['Quality'] = quality;
    if (taste != null)
      json['Taste'] = taste;
    if (smoke != null)
      json['Smoke'] = smoke;
    if (overall != null)
      json['Overall'] = overall;
    if (text != null)
      json['Text'] = text;
    if (smokeSessionId != null)
      json['SmokeSessionId'] = smokeSessionId;
    return json;
  }

  static List<TobaccoReviewDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<TobaccoReviewDto>() : json.map((value) => new TobaccoReviewDto.fromJson(value)).toList();
  }

  static Map<String, TobaccoReviewDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, TobaccoReviewDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new TobaccoReviewDto.fromJson(value));
    }
    return map;
  }
}

