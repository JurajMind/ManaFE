part of openapi.api;

class SmartHookahControllersPriceGroupDto {
  
  int id = null;
  
  String name = null;
  
  double price = null;
  SmartHookahControllersPriceGroupDto();

  @override
  String toString() {
    return 'SmartHookahControllersPriceGroupDto[id=$id, name=$name, price=$price, ]';
  }

  SmartHookahControllersPriceGroupDto.fromJson(Map<String, dynamic> json) {
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
    if (json['Price'] == null) {
      price = null;
    } else {
          price = json['Price'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (name != null)
      json['Name'] = name;
    if (price != null)
      json['Price'] = price;
    return json;
  }

  static List<SmartHookahControllersPriceGroupDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahControllersPriceGroupDto>() : json.map((value) => new SmartHookahControllersPriceGroupDto.fromJson(value)).toList();
  }

  static Map<String, SmartHookahControllersPriceGroupDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahControllersPriceGroupDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahControllersPriceGroupDto.fromJson(value));
    }
    return map;
  }
}

