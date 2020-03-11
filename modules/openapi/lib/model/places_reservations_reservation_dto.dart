part of openapi.api;

class PlacesReservationsReservationDto {
  
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
  
  int lateDuration = null;
  PlacesReservationsReservationDto();

  @override
  String toString() {
    return 'PlacesReservationsReservationDto[id=$id, created=$created, personId=$personId, placeId=$placeId, placeName=$placeName, started=$started, end=$end, persons=$persons, duration=$duration, time=$time, text=$text, name=$name, displayName=$displayName, status=$status, seats=$seats, lateDuration=$lateDuration, ]';
  }

  PlacesReservationsReservationDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Created'] == null) {
      created = null;
    } else {
      created = DateTime.parse(json['Created']);
    }
    if (json['PersonId'] == null) {
      personId = null;
    } else {
          personId = json['PersonId'];
    }
    if (json['PlaceId'] == null) {
      placeId = null;
    } else {
          placeId = json['PlaceId'];
    }
    if (json['PlaceName'] == null) {
      placeName = null;
    } else {
          placeName = json['PlaceName'];
    }
    if (json['Started'] == null) {
      started = null;
    } else {
      started = DateTime.parse(json['Started']);
    }
    if (json['End'] == null) {
      end = null;
    } else {
      end = DateTime.parse(json['End']);
    }
    if (json['Persons'] == null) {
      persons = null;
    } else {
          persons = json['Persons'];
    }
    if (json['Duration'] == null) {
      duration = null;
    } else {
          duration = json['Duration'];
    }
    if (json['Time'] == null) {
      time = null;
    } else {
      time = DateTime.parse(json['Time']);
    }
    if (json['Text'] == null) {
      text = null;
    } else {
          text = json['Text'];
    }
    if (json['Name'] == null) {
      name = null;
    } else {
          name = json['Name'];
    }
    if (json['DisplayName'] == null) {
      displayName = null;
    } else {
          displayName = json['DisplayName'];
    }
    if (json['Status'] == null) {
      status = null;
    } else {
          status = json['Status'];
    }
    if (json['Seats'] == null) {
      seats = null;
    } else {
      seats = (json['Seats'] as List).cast<int>();
    }
    if (json['LateDuration'] == null) {
      lateDuration = null;
    } else {
          lateDuration = json['LateDuration'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (created != null)
      json['Created'] = created == null ? null : created.toUtc().toIso8601String();
    if (personId != null)
      json['PersonId'] = personId;
    if (placeId != null)
      json['PlaceId'] = placeId;
    if (placeName != null)
      json['PlaceName'] = placeName;
    if (started != null)
      json['Started'] = started == null ? null : started.toUtc().toIso8601String();
    if (end != null)
      json['End'] = end == null ? null : end.toUtc().toIso8601String();
    if (persons != null)
      json['Persons'] = persons;
    if (duration != null)
      json['Duration'] = duration;
    if (time != null)
      json['Time'] = time == null ? null : time.toUtc().toIso8601String();
    if (text != null)
      json['Text'] = text;
    if (name != null)
      json['Name'] = name;
    if (displayName != null)
      json['DisplayName'] = displayName;
    if (status != null)
      json['Status'] = status;
    if (seats != null)
      json['Seats'] = seats;
    if (lateDuration != null)
      json['LateDuration'] = lateDuration;
    return json;
  }

  static List<PlacesReservationsReservationDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlacesReservationsReservationDto>() : json.map((value) => new PlacesReservationsReservationDto.fromJson(value)).toList();
  }

  static Map<String, PlacesReservationsReservationDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlacesReservationsReservationDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlacesReservationsReservationDto.fromJson(value));
    }
    return map;
  }
}

