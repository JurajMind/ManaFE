part of openapi.api;

class PlaceEvent {
  
  int id = null;
  
  int placeDayId = null;
  
  String title = null;
  
  String description = null;
  
  DateTime start = null;
  
  DateTime end = null;
  
  String privacyType = null;
  
  String facebookUrl = null;
  
  bool success = null;
  
  String message = null;
  
  int httpResponseCode = null;
  PlaceEvent();

  @override
  String toString() {
    return 'PlaceEvent[id=$id, placeDayId=$placeDayId, title=$title, description=$description, start=$start, end=$end, privacyType=$privacyType, facebookUrl=$facebookUrl, success=$success, message=$message, httpResponseCode=$httpResponseCode, ]';
  }

  PlaceEvent.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['PlaceDayId'] == null) {
      placeDayId = null;
    } else {
          placeDayId = json['PlaceDayId'];
    }
    if (json['Title'] == null) {
      title = null;
    } else {
          title = json['Title'];
    }
    if (json['Description'] == null) {
      description = null;
    } else {
          description = json['Description'];
    }
    if (json['Start'] == null) {
      start = null;
    } else {
      start = DateTime.parse(json['Start']);
    }
    if (json['End'] == null) {
      end = null;
    } else {
      end = DateTime.parse(json['End']);
    }
    if (json['PrivacyType'] == null) {
      privacyType = null;
    } else {
          privacyType = json['PrivacyType'];
    }
    if (json['FacebookUrl'] == null) {
      facebookUrl = null;
    } else {
          facebookUrl = json['FacebookUrl'];
    }
    if (json['Success'] == null) {
      success = null;
    } else {
          success = json['Success'];
    }
    if (json['Message'] == null) {
      message = null;
    } else {
          message = json['Message'];
    }
    if (json['HttpResponseCode'] == null) {
      httpResponseCode = null;
    } else {
          httpResponseCode = json['HttpResponseCode'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (placeDayId != null)
      json['PlaceDayId'] = placeDayId;
    if (title != null)
      json['Title'] = title;
    if (description != null)
      json['Description'] = description;
    if (start != null)
      json['Start'] = start == null ? null : start.toUtc().toIso8601String();
    if (end != null)
      json['End'] = end == null ? null : end.toUtc().toIso8601String();
    if (privacyType != null)
      json['PrivacyType'] = privacyType;
    if (facebookUrl != null)
      json['FacebookUrl'] = facebookUrl;
    if (success != null)
      json['Success'] = success;
    if (message != null)
      json['Message'] = message;
    if (httpResponseCode != null)
      json['HttpResponseCode'] = httpResponseCode;
    return json;
  }

  static List<PlaceEvent> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceEvent>() : json.map((value) => new PlaceEvent.fromJson(value)).toList();
  }

  static Map<String, PlaceEvent> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceEvent>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceEvent.fromJson(value));
    }
    return map;
  }
}

