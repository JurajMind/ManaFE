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
    if (json['CzName'] == null) {
      czName = null;
    } else {
          czName = json['CzName'];
    }
    if (json['EngName'] == null) {
      engName = null;
    } else {
          engName = json['EngName'];
    }
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['OriginalName'] == null) {
      originalName = null;
    } else {
          originalName = json['OriginalName'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (czName != null)
      json['CzName'] = czName;
    if (engName != null)
      json['EngName'] = engName;
    if (id != null)
      json['Id'] = id;
    if (originalName != null)
      json['OriginalName'] = originalName;
    return json;
  }

  static List<TobaccoTasteDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<TobaccoTasteDto>() : json.map((value) => new TobaccoTasteDto.fromJson(value)).toList();
  }

  static Map<String, TobaccoTasteDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, TobaccoTasteDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new TobaccoTasteDto.fromJson(value));
    }
    return map;
  }
}

