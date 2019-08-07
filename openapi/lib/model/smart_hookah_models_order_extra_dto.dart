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
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Currency'] == null) {
      currency = null;
    } else {
          currency = json['Currency'];
    }
    if (json['Price'] == null) {
      price = null;
    } else {
          price = json['Price'];
    }
    if (json['Name'] == null) {
      name = null;
    } else {
          name = json['Name'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (currency != null)
      json['Currency'] = currency;
    if (price != null)
      json['Price'] = price;
    if (name != null)
      json['Name'] = name;
    return json;
  }

  static List<SmartHookahModelsOrderExtraDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsOrderExtraDto>() : json.map((value) => new SmartHookahModelsOrderExtraDto.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsOrderExtraDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsOrderExtraDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsOrderExtraDto.fromJson(value));
    }
    return map;
  }
}

