part of openapi.api;

class PlacesReservationsReservationManageDto {
  
  DateTime startTime = null;
  
  DateTime endTime = null;
  
  int timeSlotSize = null;
  
  DateTime date = null;
  
  List<SeatDto> tables = [];
  
  List<PlacesReservationsReservationDto> reservations = [];
  PlacesReservationsReservationManageDto();

  @override
  String toString() {
    return 'PlacesReservationsReservationManageDto[startTime=$startTime, endTime=$endTime, timeSlotSize=$timeSlotSize, date=$date, tables=$tables, reservations=$reservations, ]';
  }

  PlacesReservationsReservationManageDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['startTime'] == null) {
      startTime = null;
    } else {
      startTime = DateTime.parse(json['startTime']);
    }
    if (json['endTime'] == null) {
      endTime = null;
    } else {
      endTime = DateTime.parse(json['endTime']);
    }
    if (json['TimeSlotSize'] == null) {
      timeSlotSize = null;
    } else {
          timeSlotSize = json['TimeSlotSize'];
    }
    if (json['Date'] == null) {
      date = null;
    } else {
      date = DateTime.parse(json['Date']);
    }
    if (json['Tables'] == null) {
      tables = null;
    } else {
      tables = SeatDto.listFromJson(json['Tables']);
    }
    if (json['Reservations'] == null) {
      reservations = null;
    } else {
      reservations = PlacesReservationsReservationDto.listFromJson(json['Reservations']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (startTime != null)
      json['startTime'] = startTime == null ? null : startTime.toUtc().toIso8601String();
    if (endTime != null)
      json['endTime'] = endTime == null ? null : endTime.toUtc().toIso8601String();
    if (timeSlotSize != null)
      json['TimeSlotSize'] = timeSlotSize;
    if (date != null)
      json['Date'] = date == null ? null : date.toUtc().toIso8601String();
    if (tables != null)
      json['Tables'] = tables;
    if (reservations != null)
      json['Reservations'] = reservations;
    return json;
  }

  static List<PlacesReservationsReservationManageDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlacesReservationsReservationManageDto>() : json.map((value) => new PlacesReservationsReservationManageDto.fromJson(value)).toList();
  }

  static Map<String, PlacesReservationsReservationManageDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlacesReservationsReservationManageDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlacesReservationsReservationManageDto.fromJson(value));
    }
    return map;
  }
}

