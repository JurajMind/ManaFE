part of openapi.api;

class SeatDto {
  
  int id = null;
  
  String name = null;
  
  String code = null;
  
  int capacity = null;
  SeatDto();

  @override
  String toString() {
    return 'SeatDto[id=$id, name=$name, code=$code, capacity=$capacity, ]';
  }

  SeatDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Name'] == null) {
      name = null;
    } else {
          name = json['Name'];
    }
    if (json['Code'] == null) {
      code = null;
    } else {
          code = json['Code'];
    }
    if (json['Capacity'] == null) {
      capacity = null;
    } else {
          capacity = json['Capacity'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (name != null)
      json['Name'] = name;
    if (code != null)
      json['Code'] = code;
    if (capacity != null)
      json['Capacity'] = capacity;
    return json;
  }

  static List<SeatDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SeatDto>() : json.map((value) => new SeatDto.fromJson(value)).toList();
  }

  static Map<String, SeatDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SeatDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SeatDto.fromJson(value));
    }
    return map;
  }
}

