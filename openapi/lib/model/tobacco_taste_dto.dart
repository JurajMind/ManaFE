part of openapi.api;

class TobaccoTasteDto {
  
  String czName = null;
  
  String engName = null;
  
  int id = null;
  
  String originalName = null;
  TobaccoTasteDto();

  @override
  String toString() {
    return 'TobaccoTasteDto[czName=$czName, engName=$engName, id=$id, originalName=$originalName, ]';
  }

  TobaccoTasteDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    czName = json['CzName'];
    engName = json['EngName'];
    id = json['Id'];
    originalName = json['OriginalName'];
  }

  Map<String, dynamic> toJson() {
    return {
      'CzName': czName,
      'EngName': engName,
      'Id': id,
      'OriginalName': originalName
    };
  }

  static List<TobaccoTasteDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<TobaccoTasteDto>() : json.map((value) => new TobaccoTasteDto.fromJson(value)).toList();
  }

  static Map<String, TobaccoTasteDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, TobaccoTasteDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new TobaccoTasteDto.fromJson(value));
    }
    return map;
  }
}

