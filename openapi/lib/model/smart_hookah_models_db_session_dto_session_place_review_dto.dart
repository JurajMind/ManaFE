part of openapi.api;

class SmartHookahModelsDbSessionDtoSessionPlaceReviewDto {
  
  int authorId = null;
  
  String author = null;
  
  DateTime publishDate = null;
  
  GearTobaccoReviewDto tobaccoReview = null;
  
  List<SmartHookahModelsDbGearPipeAccessoryReviewDto> gearReviews = [];
  
  List<MediaDto> medias = [];
  
  int smokeSessionId = null;
  
  SmokeSessionSimpleDto smokeSession = null;
  SmartHookahModelsDbSessionDtoSessionPlaceReviewDto();

  @override
  String toString() {
    return 'SmartHookahModelsDbSessionDtoSessionPlaceReviewDto[authorId=$authorId, author=$author, publishDate=$publishDate, tobaccoReview=$tobaccoReview, gearReviews=$gearReviews, medias=$medias, smokeSessionId=$smokeSessionId, smokeSession=$smokeSession, ]';
  }

  SmartHookahModelsDbSessionDtoSessionPlaceReviewDto.fromJson(Map<String, dynamic> json) {
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
    if (json['gearReviews'] == null) {
      gearReviews = null;
    } else {
      gearReviews = SmartHookahModelsDbGearPipeAccessoryReviewDto.listFromJson(json['gearReviews']);
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
    if (gearReviews != null)
      json['gearReviews'] = gearReviews;
    if (medias != null)
      json['medias'] = medias;
    if (smokeSessionId != null)
      json['smokeSessionId'] = smokeSessionId;
    if (smokeSession != null)
      json['smokeSession'] = smokeSession;
    return json;
  }

  static List<SmartHookahModelsDbSessionDtoSessionPlaceReviewDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsDbSessionDtoSessionPlaceReviewDto>() : json.map((value) => new SmartHookahModelsDbSessionDtoSessionPlaceReviewDto.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsDbSessionDtoSessionPlaceReviewDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsDbSessionDtoSessionPlaceReviewDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsDbSessionDtoSessionPlaceReviewDto.fromJson(value));
    }
    return map;
  }
}

