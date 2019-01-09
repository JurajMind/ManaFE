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
    id = json['Id'];
    placeDayId = json['PlaceDayId'];
    title = json['Title'];
    description = json['Description'];
    start = json['Start'] == null ? null : DateTime.parse(json['Start']);
    end = json['End'] == null ? null : DateTime.parse(json['End']);
    privacyType = json['PrivacyType'];
    facebookUrl = json['FacebookUrl'];
    success = json['Success'];
    message = json['Message'];
    httpResponseCode = json['HttpResponseCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'PlaceDayId': placeDayId,
      'Title': title,
      'Description': description,
      'Start': start == null ? '' : start.toUtc().toIso8601String(),
      'End': end == null ? '' : end.toUtc().toIso8601String(),
      'PrivacyType': privacyType,
      'FacebookUrl': facebookUrl,
      'Success': success,
      'Message': message,
      'HttpResponseCode': httpResponseCode
    };
  }

  static List<PlaceEvent> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceEvent>() : json.map((value) => new PlaceEvent.fromJson(value)).toList();
  }

  static Map<String, PlaceEvent> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceEvent>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceEvent.fromJson(value));
    }
    return map;
  }
}

