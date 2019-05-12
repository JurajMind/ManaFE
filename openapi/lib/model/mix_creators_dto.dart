part of openapi.api;

class MixCreatorsDto {
  
  List<MixCreator> mixCreatorsList = [];
  MixCreatorsDto();

  @override
  String toString() {
    return 'MixCreatorsDto[mixCreatorsList=$mixCreatorsList, ]';
  }

  MixCreatorsDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    mixCreatorsList = MixCreator.listFromJson(json['MixCreatorsList']);
  }

  Map<String, dynamic> toJson() {
    return {
      'MixCreatorsList': mixCreatorsList
    };
  }

  static List<MixCreatorsDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<MixCreatorsDto>() : json.map((value) => new MixCreatorsDto.fromJson(value)).toList();
  }

  static Map<String, MixCreatorsDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, MixCreatorsDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new MixCreatorsDto.fromJson(value));
    }
    return map;
  }
}

