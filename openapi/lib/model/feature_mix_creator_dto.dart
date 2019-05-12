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
    name = json['Name'];
    description = json['Description'];
    location = json['Location'];
    socialMedias = SmartHookahModelsDbSocialMedia.listFromJson(json['SocialMedias']);
    medias = MediaDto.listFromJson(json['Medias']);
    logoPicture = json['LogoPicture'];
    personId = json['PersonId'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Description': description,
      'Location': location,
      'SocialMedias': socialMedias,
      'Medias': medias,
      'LogoPicture': logoPicture,
      'PersonId': personId,
      'Id': id
    };
  }

  static List<FeatureMixCreatorDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<FeatureMixCreatorDto>() : json.map((value) => new FeatureMixCreatorDto.fromJson(value)).toList();
  }

  static Map<String, FeatureMixCreatorDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, FeatureMixCreatorDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new FeatureMixCreatorDto.fromJson(value));
    }
    return map;
  }
}

