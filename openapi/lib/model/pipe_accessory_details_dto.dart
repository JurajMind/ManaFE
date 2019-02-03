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
    usedByPerson = json['UsedByPerson'];
    usedWith = UsedWithDto.listFromJson(json['UsedWith']);
    ownedByPersons = json['OwnedByPersons'];
    ownedByPlaces = json['OwnedByPlaces'];
  }

  Map<String, dynamic> toJson() {
    return {
      'UsedByPerson': usedByPerson,
      'UsedWith': usedWith,
      'OwnedByPersons': ownedByPersons,
      'OwnedByPlaces': ownedByPlaces
    };
  }

  static List<PipeAccessoryDetailsDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PipeAccessoryDetailsDto>() : json.map((value) => new PipeAccessoryDetailsDto.fromJson(value)).toList();
  }

  static Map<String, PipeAccessoryDetailsDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PipeAccessoryDetailsDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PipeAccessoryDetailsDto.fromJson(value));
    }
    return map;
  }
}

