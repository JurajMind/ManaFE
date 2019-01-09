part of openapi.api;

class TobaccoReviewDto {
  
  int id = null;
  
  int quality = null;
  
  int taste = null;
  
  int smoke = null;
  
  int overall = null;
  
  String text = null;
  
  int smokeSessionId = null;
  TobaccoReviewDto();

  @override
  String toString() {
    return 'TobaccoReviewDto[id=$id, quality=$quality, taste=$taste, smoke=$smoke, overall=$overall, text=$text, smokeSessionId=$smokeSessionId, ]';
  }

  TobaccoReviewDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    quality = json['Quality'];
    taste = json['Taste'];
    smoke = json['Smoke'];
    overall = json['Overall'];
    text = json['Text'];
    smokeSessionId = json['SmokeSessionId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Quality': quality,
      'Taste': taste,
      'Smoke': smoke,
      'Overall': overall,
      'Text': text,
      'SmokeSessionId': smokeSessionId
    };
  }

  static List<TobaccoReviewDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<TobaccoReviewDto>() : json.map((value) => new TobaccoReviewDto.fromJson(value)).toList();
  }

  static Map<String, TobaccoReviewDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, TobaccoReviewDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new TobaccoReviewDto.fromJson(value));
    }
    return map;
  }
}

