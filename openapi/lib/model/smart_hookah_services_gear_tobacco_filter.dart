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
    if (json['Tastes'] == null) {
      tastes = null;
    } else {
      tastes = (json['Tastes'] as List).cast<int>();
    }
    if (json['SortBy'] == null) {
      sortBy = null;
    } else {
          sortBy = json['SortBy'];
    }
    if (json['Brand'] == null) {
      brand = null;
    } else {
          brand = json['Brand'];
    }
    if (json['Owned'] == null) {
      owned = null;
    } else {
          owned = json['Owned'];
    }
    if (json['Smoked'] == null) {
      smoked = null;
    } else {
          smoked = json['Smoked'];
    }
    if (json['SortDirection'] == null) {
      sortDirection = null;
    } else {
          sortDirection = json['SortDirection'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (tastes != null)
      json['Tastes'] = tastes;
    if (sortBy != null)
      json['SortBy'] = sortBy;
    if (brand != null)
      json['Brand'] = brand;
    if (owned != null)
      json['Owned'] = owned;
    if (smoked != null)
      json['Smoked'] = smoked;
    if (sortDirection != null)
      json['SortDirection'] = sortDirection;
    return json;
  }

  static List<SmartHookahServicesGearTobaccoFilter> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahServicesGearTobaccoFilter>() : json.map((value) => new SmartHookahServicesGearTobaccoFilter.fromJson(value)).toList();
  }

  static Map<String, SmartHookahServicesGearTobaccoFilter> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahServicesGearTobaccoFilter>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahServicesGearTobaccoFilter.fromJson(value));
    }
    return map;
  }
}

