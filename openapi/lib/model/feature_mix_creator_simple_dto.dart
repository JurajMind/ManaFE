part of openapi.api;

class FeatureMixCreatorSimpleDto {
  
  String name = null;
  
  String description = null;
  
  String location = null;
  
  String logoPicture = null;
  
  int personId = null;
  
  int id = null;
  FeatureMixCreatorSimpleDto();

  @override
  String toString() {
    return 'FeatureMixCreatorSimpleDto[name=$name, description=$description, location=$location, logoPicture=$logoPicture, personId=$personId, id=$id, ]';
  }

  FeatureMixCreatorSimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['Name'];
    description = json['Description'];
    location = json['Location'];
    logoPicture = json['LogoPicture'];
    personId = json['PersonId'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Description': description,
      'Location': location,
      'LogoPicture': logoPicture,
      'PersonId': personId,
      'Id': id
    };
  }

  static List<FeatureMixCreatorSimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<FeatureMixCreatorSimpleDto>() : json.map((value) => new FeatureMixCreatorSimpleDto.fromJson(value)).toList();
  }

  static Map<String, FeatureMixCreatorSimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, FeatureMixCreatorSimpleDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new FeatureMixCreatorSimpleDto.fromJson(value));
    }
    return map;
  }
}

