part of openapi.api;

class SmartHookahModelsDbSessionDtoSessionReviewDto {
  
  int authorId = null;
  
  String author = null;
  
  DateTime publishDate = null;
  
  GearTobaccoReviewDto tobaccoReview = null;
  
  int placeReviewId = null;
  
  PlacesPlaceReviewDto placeReview = null;
  
  List<MediaDto> medias = [];
  
  int smokeSessionId = null;
  
  int taste = null;
  
  int smoke = null;
  
  int strength = null;
  
  int duration = null;
  
  SmokeSessionSimpleDto smokeSession = null;
  SmartHookahModelsDbSessionDtoSessionReviewDto();

  @override
  String toString() {
    return 'SmartHookahModelsDbSessionDtoSessionReviewDto[authorId=$authorId, author=$author, publishDate=$publishDate, tobaccoReview=$tobaccoReview, placeReviewId=$placeReviewId, placeReview=$placeReview, medias=$medias, smokeSessionId=$smokeSessionId, taste=$taste, smoke=$smoke, strength=$strength, duration=$duration, smokeSession=$smokeSession, ]';
  }

  SmartHookahModelsDbSessionDtoSessionReviewDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['authorId'] == null) {
      authorId = null;
    } else {
          authorId = json['authorId'];
    }
    if (json['author'] == null) {
      author = null;
    } else {
          author = json['author'];
    }
    if (json['publishDate'] == null) {
      publishDate = null;
    } else {
      publishDate = DateTime.parse(json['publishDate']);
    }
    if (json['tobaccoReview'] == null) {
      tobaccoReview = null;
    } else {
      tobaccoReview = new GearTobaccoReviewDto.fromJson(json['tobaccoReview']);
    }
    if (json['placeReviewId'] == null) {
      placeReviewId = null;
    } else {
          placeReviewId = json['placeReviewId'];
    }
    if (json['placeReview'] == null) {
      placeReview = null;
    } else {
      placeReview = new PlacesPlaceReviewDto.fromJson(json['placeReview']);
    }
    if (json['medias'] == null) {
      medias = null;
    } else {
      medias = MediaDto.listFromJson(json['medias']);
    }
    if (json['smokeSessionId'] == null) {
      smokeSessionId = null;
    } else {
          smokeSessionId = json['smokeSessionId'];
    }
    if (json['taste'] == null) {
      taste = null;
    } else {
          taste = json['taste'];
    }
    if (json['smoke'] == null) {
      smoke = null;
    } else {
          smoke = json['smoke'];
    }
    if (json['strength'] == null) {
      strength = null;
    } else {
          strength = json['strength'];
    }
    if (json['duration'] == null) {
      duration = null;
    } else {
          duration = json['duration'];
    }
    if (json['smokeSession'] == null) {
      smokeSession = null;
    } else {
      smokeSession = new SmokeSessionSimpleDto.fromJson(json['smokeSession']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (authorId != null)
      json['authorId'] = authorId;
    if (author != null)
      json['author'] = author;
    if (publishDate != null)
      json['publishDate'] = publishDate == null ? null : publishDate.toUtc().toIso8601String();
    if (tobaccoReview != null)
      json['tobaccoReview'] = tobaccoReview;
    if (placeReviewId != null)
      json['placeReviewId'] = placeReviewId;
    if (placeReview != null)
      json['placeReview'] = placeReview;
    if (medias != null)
      json['medias'] = medias;
    if (smokeSessionId != null)
      json['smokeSessionId'] = smokeSessionId;
    if (taste != null)
      json['taste'] = taste;
    if (smoke != null)
      json['smoke'] = smoke;
    if (strength != null)
      json['strength'] = strength;
    if (duration != null)
      json['duration'] = duration;
    if (smokeSession != null)
      json['smokeSession'] = smokeSession;
    return json;
  }

  static List<SmartHookahModelsDbSessionDtoSessionReviewDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsDbSessionDtoSessionReviewDto>() : json.map((value) => new SmartHookahModelsDbSessionDtoSessionReviewDto.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsDbSessionDtoSessionReviewDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsDbSessionDtoSessionReviewDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsDbSessionDtoSessionReviewDto.fromJson(value));
    }
    return map;
  }
}

