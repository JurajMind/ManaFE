part of openapi.api;

class SmartHookahModelsDbGearPipeAccessoryReviewDto {
  
  int id = null;
  
  int authorId = null;
  
  String author = null;
  
  DateTime publishDate = null;
  
  bool deleted = null;
  
  String text = null;
  
  int accessorId = null;
  
  double overall = null;
  
  int sessionReviewId = null;
  
  int smokeSessionId = null;
  
  List<MediaDto> medias = [];
  SmartHookahModelsDbGearPipeAccessoryReviewDto();

  @override
  String toString() {
    return 'SmartHookahModelsDbGearPipeAccessoryReviewDto[id=$id, authorId=$authorId, author=$author, publishDate=$publishDate, deleted=$deleted, text=$text, accessorId=$accessorId, overall=$overall, sessionReviewId=$sessionReviewId, smokeSessionId=$smokeSessionId, medias=$medias, ]';
  }

  SmartHookahModelsDbGearPipeAccessoryReviewDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['AuthorId'] == null) {
      authorId = null;
    } else {
          authorId = json['AuthorId'];
    }
    if (json['Author'] == null) {
      author = null;
    } else {
          author = json['Author'];
    }
    if (json['PublishDate'] == null) {
      publishDate = null;
    } else {
      publishDate = DateTime.parse(json['PublishDate']);
    }
    if (json['Deleted'] == null) {
      deleted = null;
    } else {
          deleted = json['Deleted'];
    }
    if (json['Text'] == null) {
      text = null;
    } else {
          text = json['Text'];
    }
    if (json['AccessorId'] == null) {
      accessorId = null;
    } else {
          accessorId = json['AccessorId'];
    }
    if (json['Overall'] == null) {
      overall = null;
    } else {
          overall = json['Overall'];
    }
    if (json['SessionReviewId'] == null) {
      sessionReviewId = null;
    } else {
          sessionReviewId = json['SessionReviewId'];
    }
    if (json['SmokeSessionId'] == null) {
      smokeSessionId = null;
    } else {
          smokeSessionId = json['SmokeSessionId'];
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
    if (authorId != null)
      json['AuthorId'] = authorId;
    if (author != null)
      json['Author'] = author;
    if (publishDate != null)
      json['PublishDate'] = publishDate == null ? null : publishDate.toUtc().toIso8601String();
    if (deleted != null)
      json['Deleted'] = deleted;
    if (text != null)
      json['Text'] = text;
    if (accessorId != null)
      json['AccessorId'] = accessorId;
    if (overall != null)
      json['Overall'] = overall;
    if (sessionReviewId != null)
      json['SessionReviewId'] = sessionReviewId;
    if (smokeSessionId != null)
      json['SmokeSessionId'] = smokeSessionId;
    if (medias != null)
      json['Medias'] = medias;
    return json;
  }

  static List<SmartHookahModelsDbGearPipeAccessoryReviewDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsDbGearPipeAccessoryReviewDto>() : json.map((value) => new SmartHookahModelsDbGearPipeAccessoryReviewDto.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsDbGearPipeAccessoryReviewDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsDbGearPipeAccessoryReviewDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsDbGearPipeAccessoryReviewDto.fromJson(value));
    }
    return map;
  }
}

