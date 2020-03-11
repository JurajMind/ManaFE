part of openapi.api;

class PipeAccesoryLikeDto {
  
  int id = null;
  
  int personId = null;
  
  int pipeAccessoryId = null;
  
  int value = null;
  PipeAccesoryLikeDto();

  @override
  String toString() {
    return 'PipeAccesoryLikeDto[id=$id, personId=$personId, pipeAccessoryId=$pipeAccessoryId, value=$value, ]';
  }

  PipeAccesoryLikeDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['PersonId'] == null) {
      personId = null;
    } else {
          personId = json['PersonId'];
    }
    if (json['PipeAccessoryId'] == null) {
      pipeAccessoryId = null;
    } else {
          pipeAccessoryId = json['PipeAccessoryId'];
    }
    if (json['Value'] == null) {
      value = null;
    } else {
          value = json['Value'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (personId != null)
      json['PersonId'] = personId;
    if (pipeAccessoryId != null)
      json['PipeAccessoryId'] = pipeAccessoryId;
    if (value != null)
      json['Value'] = value;
    return json;
  }

  static List<PipeAccesoryLikeDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PipeAccesoryLikeDto>() : json.map((value) => new PipeAccesoryLikeDto.fromJson(value)).toList();
  }

  static Map<String, PipeAccesoryLikeDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PipeAccesoryLikeDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PipeAccesoryLikeDto.fromJson(value));
    }
    return map;
  }
}

