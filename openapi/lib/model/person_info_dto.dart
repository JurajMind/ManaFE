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
    displayName = json['DisplayName'];
    email = json['Email'];
    managedPlaces = PlaceSimpleDto.listFromJson(json['ManagedPlaces']);
    roles = ((json['Roles'] ?? []) as List).map((item) => item as String).toList();
    personId = json['PersonId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'DisplayName': displayName,
      'Email': email,
      'ManagedPlaces': managedPlaces,
      'Roles': roles,
      'PersonId': personId
    };
  }

  static List<PersonInfoDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PersonInfoDto>() : json.map((value) => new PersonInfoDto.fromJson(value)).toList();
  }

  static Map<String, PersonInfoDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PersonInfoDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PersonInfoDto.fromJson(value));
    }
    return map;
  }
}

