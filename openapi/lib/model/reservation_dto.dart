part of openapi.api;

class ReservationDto {
  
  int id = null;
  
  DateTime created = null;
  
  int personId = null;
  
  int placeId = null;
  
  String placeName = null;
  
  DateTime started = null;
  
  DateTime end = null;
  
  int persons = null;
  
  String duration = null;
  
  DateTime time = null;
  
  String text = null;
  
  String name = null;
  
  String displayName = null;
  
  int status = null;
  
  List<int> seats = [];
  ReservationDto();

  @override
  String toString() {
    return 'ReservationDto[id=$id, created=$created, personId=$personId, placeId=$placeId, placeName=$placeName, started=$started, end=$end, persons=$persons, duration=$duration, time=$time, text=$text, name=$name, displayName=$displayName, status=$status, seats=$seats, ]';
  }

  ReservationDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    created = json['Created'] == null ? null : DateTime.parse(json['Created']);
    personId = json['PersonId'];
    placeId = json['PlaceId'];
    placeName = json['PlaceName'];
    started = json['Started'] == null ? null : DateTime.parse(json['Started']);
    end = json['End'] == null ? null : DateTime.parse(json['End']);
    persons = json['Persons'];
    duration = json['Duration'];
    time = json['Time'] == null ? null : DateTime.parse(json['Time']);
    text = json['Text'];
    name = json['Name'];
    displayName = json['DisplayName'];
    status = json['Status'];
    seats = ((json['Seats'] ?? []) as List).map((item) => item as int).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Created': created == null ? '' : created.toUtc().toIso8601String(),
      'PersonId': personId,
      'PlaceId': placeId,
      'PlaceName': placeName,
      'Started': started == null ? '' : started.toUtc().toIso8601String(),
      'End': end == null ? '' : end.toUtc().toIso8601String(),
      'Persons': persons,
      'Duration': duration,
      'Time': time == null ? '' : time.toUtc().toIso8601String(),
      'Text': text,
      'Name': name,
      'DisplayName': displayName,
      'Status': status,
      'Seats': seats
    };
  }

  static List<ReservationDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<ReservationDto>() : json.map((value) => new ReservationDto.fromJson(value)).toList();
  }

  static Map<String, ReservationDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ReservationDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ReservationDto.fromJson(value));
    }
    return map;
  }
}

