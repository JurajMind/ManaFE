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
    id = json['Id'];
    name = json['Name'];
    code = json['Code'];
    capacity = json['Capacity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Code': code,
      'Capacity': capacity
    };
  }

  static List<SeatDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SeatDto>() : json.map((value) => new SeatDto.fromJson(value)).toList();
  }

  static Map<String, SeatDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SeatDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SeatDto.fromJson(value));
    }
    return map;
  }
}

