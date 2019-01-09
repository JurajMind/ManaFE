part of openapi.api;

class AddressDto {
  
  int id = null;
  
  String street = null;
  
  String city = null;
  
  String number = null;
  
  String ZIP = null;
  
  String lat = null;
  
  String lng = null;
  AddressDto();

  @override
  String toString() {
    return 'AddressDto[id=$id, street=$street, city=$city, number=$number, ZIP=$ZIP, lat=$lat, lng=$lng, ]';
  }

  AddressDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    street = json['Street'];
    city = json['City'];
    number = json['Number'];
    ZIP = json['ZIP'];
    lat = json['Lat'];
    lng = json['Lng'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Street': street,
      'City': city,
      'Number': number,
      'ZIP': ZIP,
      'Lat': lat,
      'Lng': lng
    };
  }

  static List<AddressDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<AddressDto>() : json.map((value) => new AddressDto.fromJson(value)).toList();
  }

  static Map<String, AddressDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, AddressDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new AddressDto.fromJson(value));
    }
    return map;
  }
}

