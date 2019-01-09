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
    id = json['Id'];
    name = json['Name'];
    price = json['Price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Price': price
    };
  }

  static List<SmartHookahControllersPriceGroupDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahControllersPriceGroupDto>() : json.map((value) => new SmartHookahControllersPriceGroupDto.fromJson(value)).toList();
  }

  static Map<String, SmartHookahControllersPriceGroupDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahControllersPriceGroupDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahControllersPriceGroupDto.fromJson(value));
    }
    return map;
  }
}

