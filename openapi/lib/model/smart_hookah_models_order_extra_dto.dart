part of openapi.api;

class SmartHookahModelsOrderExtraDto {
  
  int id = null;
  
  String currency = null;
  
  double price = null;
  
  String name = null;
  SmartHookahModelsOrderExtraDto();

  @override
  String toString() {
    return 'SmartHookahModelsOrderExtraDto[id=$id, currency=$currency, price=$price, name=$name, ]';
  }

  SmartHookahModelsOrderExtraDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    currency = json['Currency'];
    price = json['Price'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Currency': currency,
      'Price': price,
      'Name': name
    };
  }

  static List<SmartHookahModelsOrderExtraDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsOrderExtraDto>() : json.map((value) => new SmartHookahModelsOrderExtraDto.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsOrderExtraDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsOrderExtraDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsOrderExtraDto.fromJson(value));
    }
    return map;
  }
}

