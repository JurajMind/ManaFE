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
    id = json['Id'];
    personId = json['PersonId'];
    pipeAccessoryId = json['PipeAccessoryId'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'PersonId': personId,
      'PipeAccessoryId': pipeAccessoryId,
      'Value': value
    };
  }

  static List<PipeAccesoryLikeDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PipeAccesoryLikeDto>() : json.map((value) => new PipeAccesoryLikeDto.fromJson(value)).toList();
  }

  static Map<String, PipeAccesoryLikeDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PipeAccesoryLikeDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PipeAccesoryLikeDto.fromJson(value));
    }
    return map;
  }
}

