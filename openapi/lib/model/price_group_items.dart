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
    groupId = json['GroupId'];
    price = json['Price'].cast<String, double>();
  }

  Map<String, dynamic> toJson() {
    return {'GroupId': groupId, 'Price': price};
  }

  static List<PriceGroupItems> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<PriceGroupItems>()
        : json.map((value) => new PriceGroupItems.fromJson(value)).toList();
  }

  static Map<String, PriceGroupItems> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PriceGroupItems>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) =>
          map[key] = new PriceGroupItems.fromJson(value));
    }
    return map;
  }
}
