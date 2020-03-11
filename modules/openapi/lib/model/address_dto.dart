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
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Street'] == null) {
      street = null;
    } else {
          street = json['Street'];
    }
    if (json['City'] == null) {
      city = null;
    } else {
          city = json['City'];
    }
    if (json['Number'] == null) {
      number = null;
    } else {
          number = json['Number'];
    }
    if (json['ZIP'] == null) {
      ZIP = null;
    } else {
          ZIP = json['ZIP'];
    }
    if (json['Lat'] == null) {
      lat = null;
    } else {
          lat = json['Lat'];
    }
    if (json['Lng'] == null) {
      lng = null;
    } else {
          lng = json['Lng'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (street != null)
      json['Street'] = street;
    if (city != null)
      json['City'] = city;
    if (number != null)
      json['Number'] = number;
    if (ZIP != null)
      json['ZIP'] = ZIP;
    if (lat != null)
      json['Lat'] = lat;
    if (lng != null)
      json['Lng'] = lng;
    return json;
  }

  static List<AddressDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<AddressDto>() : json.map((value) => new AddressDto.fromJson(value)).toList();
  }

  static Map<String, AddressDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, AddressDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new AddressDto.fromJson(value));
    }
    return map;
  }
}

