part of openapi.api;

class FeatureMixCreatorDto {
  
  String name = null;
  
  String description = null;
  
  String location = null;
  
  List<SmartHookahModelsDbSocialMedia> socialMedias = [];
  
  List<MediaDto> medias = [];
  
  String logoPicture = null;
  
  int personId = null;
  
  int id = null;
  FeatureMixCreatorDto();

  @override
  String toString() {
    return 'FeatureMixCreatorDto[name=$name, description=$description, location=$location, socialMedias=$socialMedias, medias=$medias, logoPicture=$logoPicture, personId=$personId, id=$id, ]';
  }

  FeatureMixCreatorDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Name'] == null) {
      name = null;
    } else {
          name = json['Name'];
    }
    if (json['Description'] == null) {
      description = null;
    } else {
          description = json['Description'];
    }
    if (json['Location'] == null) {
      location = null;
    } else {
          location = json['Location'];
    }
    if (json['SocialMedias'] == null) {
      socialMedias = null;
    } else {
      socialMedias = SmartHookahModelsDbSocialMedia.listFromJson(json['SocialMedias']);
    }
    if (json['Medias'] == null) {
      medias = null;
    } else {
      medias = MediaDto.listFromJson(json['Medias']);
    }
    if (json['LogoPicture'] == null) {
      logoPicture = null;
    } else {
          logoPicture = json['LogoPicture'];
    }
    if (json['PersonId'] == null) {
      personId = null;
    } else {
          personId = json['PersonId'];
    }
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (name != null)
      json['Name'] = name;
    if (description != null)
      json['Description'] = description;
    if (location != null)
      json['Location'] = location;
    if (socialMedias != null)
      json['SocialMedias'] = socialMedias;
    if (medias != null)
      json['Medias'] = medias;
    if (logoPicture != null)
      json['LogoPicture'] = logoPicture;
    if (personId != null)
      json['PersonId'] = personId;
    if (id != null)
      json['Id'] = id;
    return json;
  }

  static List<FeatureMixCreatorDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<FeatureMixCreatorDto>() : json.map((value) => new FeatureMixCreatorDto.fromJson(value)).toList();
  }

  static Map<String, FeatureMixCreatorDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, FeatureMixCreatorDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new FeatureMixCreatorDto.fromJson(value));
    }
    return map;
  }
}

