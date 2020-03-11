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
    if (logoPicture != null)
      json['LogoPicture'] = logoPicture;
    if (personId != null)
      json['PersonId'] = personId;
    if (id != null)
      json['Id'] = id;
    return json;
  }

  static List<FeatureMixCreatorSimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<FeatureMixCreatorSimpleDto>() : json.map((value) => new FeatureMixCreatorSimpleDto.fromJson(value)).toList();
  }

  static Map<String, FeatureMixCreatorSimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, FeatureMixCreatorSimpleDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new FeatureMixCreatorSimpleDto.fromJson(value));
    }
    return map;
  }
}

