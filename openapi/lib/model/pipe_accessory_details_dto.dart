part of openapi.api;

class PipeAccessoryDetailsDto {
  
  int usedByPerson = null;
  
  List<UsedWithDto> usedWith = [];
  
  int ownedByPersons = null;
  
  int ownedByPlaces = null;
  PipeAccessoryDetailsDto();

  @override
  String toString() {
    return 'PipeAccessoryDetailsDto[usedByPerson=$usedByPerson, usedWith=$usedWith, ownedByPersons=$ownedByPersons, ownedByPlaces=$ownedByPlaces, ]';
  }

  PipeAccessoryDetailsDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['UsedByPerson'] == null) {
      usedByPerson = null;
    } else {
          usedByPerson = json['UsedByPerson'];
    }
    if (json['UsedWith'] == null) {
      usedWith = null;
    } else {
      usedWith = UsedWithDto.listFromJson(json['UsedWith']);
    }
    if (json['OwnedByPersons'] == null) {
      ownedByPersons = null;
    } else {
          ownedByPersons = json['OwnedByPersons'];
    }
    if (json['OwnedByPlaces'] == null) {
      ownedByPlaces = null;
    } else {
          ownedByPlaces = json['OwnedByPlaces'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (usedByPerson != null)
      json['UsedByPerson'] = usedByPerson;
    if (usedWith != null)
      json['UsedWith'] = usedWith;
    if (ownedByPersons != null)
      json['OwnedByPersons'] = ownedByPersons;
    if (ownedByPlaces != null)
      json['OwnedByPlaces'] = ownedByPlaces;
    return json;
  }

  static List<PipeAccessoryDetailsDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PipeAccessoryDetailsDto>() : json.map((value) => new PipeAccessoryDetailsDto.fromJson(value)).toList();
  }

  static Map<String, PipeAccessoryDetailsDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PipeAccessoryDetailsDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PipeAccessoryDetailsDto.fromJson(value));
    }
    return map;
  }
}

