part of openapi.api;

class PersonInfoDto {
  
  String displayName = null;
  
  String email = null;
  
  List<PlaceSimpleDto> managedPlaces = [];
  
  List<String> roles = [];
  
  String personId = null;
  PersonInfoDto();

  @override
  String toString() {
    return 'PersonInfoDto[displayName=$displayName, email=$email, managedPlaces=$managedPlaces, roles=$roles, personId=$personId, ]';
  }

  PersonInfoDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['DisplayName'] == null) {
      displayName = null;
    } else {
          displayName = json['DisplayName'];
    }
    if (json['Email'] == null) {
      email = null;
    } else {
          email = json['Email'];
    }
    if (json['ManagedPlaces'] == null) {
      managedPlaces = null;
    } else {
      managedPlaces = PlaceSimpleDto.listFromJson(json['ManagedPlaces']);
    }
    if (json['Roles'] == null) {
      roles = null;
    } else {
      roles = (json['Roles'] as List).cast<String>();
    }
    if (json['PersonId'] == null) {
      personId = null;
    } else {
          personId = json['PersonId'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (displayName != null)
      json['DisplayName'] = displayName;
    if (email != null)
      json['Email'] = email;
    if (managedPlaces != null)
      json['ManagedPlaces'] = managedPlaces;
    if (roles != null)
      json['Roles'] = roles;
    if (personId != null)
      json['PersonId'] = personId;
    return json;
  }

  static List<PersonInfoDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PersonInfoDto>() : json.map((value) => new PersonInfoDto.fromJson(value)).toList();
  }

  static Map<String, PersonInfoDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PersonInfoDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PersonInfoDto.fromJson(value));
    }
    return map;
  }
}

