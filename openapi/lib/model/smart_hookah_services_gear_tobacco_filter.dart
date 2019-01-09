part of openapi.api;

class SmartHookahServicesGearTobaccoFilter {
  
  List<int> tastes = [];
  
  int sortBy = null;
  //enum sortByEnum {  0,  1,  2,  3,  4,  };{
  
  String brand = null;
  
  bool owned = null;
  
  bool smoked = null;
  
  int sortDirection = null;
  //enum sortDirectionEnum {  0,  1,  };{
  SmartHookahServicesGearTobaccoFilter();

  @override
  String toString() {
    return 'SmartHookahServicesGearTobaccoFilter[tastes=$tastes, sortBy=$sortBy, brand=$brand, owned=$owned, smoked=$smoked, sortDirection=$sortDirection, ]';
  }

  SmartHookahServicesGearTobaccoFilter.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    tastes = ((json['Tastes'] ?? []) as List).map((item) => item as int).toList();
    sortBy = json['SortBy'];
    brand = json['Brand'];
    owned = json['Owned'];
    smoked = json['Smoked'];
    sortDirection = json['SortDirection'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Tastes': tastes,
      'SortBy': sortBy,
      'Brand': brand,
      'Owned': owned,
      'Smoked': smoked,
      'SortDirection': sortDirection
    };
  }

  static List<SmartHookahServicesGearTobaccoFilter> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahServicesGearTobaccoFilter>() : json.map((value) => new SmartHookahServicesGearTobaccoFilter.fromJson(value)).toList();
  }

  static Map<String, SmartHookahServicesGearTobaccoFilter> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahServicesGearTobaccoFilter>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahServicesGearTobaccoFilter.fromJson(value));
    }
    return map;
  }
}

