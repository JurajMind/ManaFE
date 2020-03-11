part of openapi.api;

class PriceGroupItems {
  
  int groupId = null;
  
  Map<String, double> price = {};
  PriceGroupItems();

  @override
  String toString() {
    return 'PriceGroupItems[groupId=$groupId, price=$price, ]';
  }

  PriceGroupItems.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['GroupId'] == null) {
      groupId = null;
    } else {
          groupId = json['GroupId'];
    }
    if (json['Price'] == null) {
      price = null;
    } else {
          price = (json['Price'] as Map).cast<String, double>();
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (groupId != null)
      json['GroupId'] = groupId;
    if (price != null)
      json['Price'] = price;
    return json;
  }

  static List<PriceGroupItems> listFromJson(List<dynamic> json) {
    return json == null ? new List<PriceGroupItems>() : json.map((value) => new PriceGroupItems.fromJson(value)).toList();
  }

  static Map<String, PriceGroupItems> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PriceGroupItems>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PriceGroupItems.fromJson(value));
    }
    return map;
  }
}

