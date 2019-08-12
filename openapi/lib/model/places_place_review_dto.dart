part of openapi.api;

class PlacesPlaceReviewDto {
  
  int id = null;
  
  int authorId = null;
  
  String author = null;
  
  DateTime publishDate = null;
  
  String text = null;
  
  int placeId = null;
  
  SmartHookahModelsDbSessionDtoSessionPlaceReviewDto sessionReview = null;
  
  List<MediaDto> medias = [];
  PlacesPlaceReviewDto();

  @override
  String toString() {
    return 'PlacesPlaceReviewDto[id=$id, authorId=$authorId, author=$author, publishDate=$publishDate, text=$text, placeId=$placeId, sessionReview=$sessionReview, medias=$medias, ]';
  }

  PlacesPlaceReviewDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
          id = json['id'];
    }
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
    if (json['text'] == null) {
      text = null;
    } else {
          text = json['text'];
    }
    if (json['placeId'] == null) {
      placeId = null;
    } else {
          placeId = json['placeId'];
    }
    if (json['sessionReview'] == null) {
      sessionReview = null;
    } else {
      sessionReview = new SmartHookahModelsDbSessionDtoSessionPlaceReviewDto.fromJson(json['sessionReview']);
    }
    if (json['medias'] == null) {
      medias = null;
    } else {
      medias = MediaDto.listFromJson(json['medias']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (authorId != null)
      json['authorId'] = authorId;
    if (author != null)
      json['author'] = author;
    if (publishDate != null)
      json['publishDate'] = publishDate == null ? null : publishDate.toUtc().toIso8601String();
    if (text != null)
      json['text'] = text;
    if (placeId != null)
      json['placeId'] = placeId;
    if (sessionReview != null)
      json['sessionReview'] = sessionReview;
    if (medias != null)
      json['medias'] = medias;
    return json;
  }

  static List<PlacesPlaceReviewDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlacesPlaceReviewDto>() : json.map((value) => new PlacesPlaceReviewDto.fromJson(value)).toList();
  }

  static Map<String, PlacesPlaceReviewDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlacesPlaceReviewDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlacesPlaceReviewDto.fromJson(value));
    }
    return map;
  }
}

