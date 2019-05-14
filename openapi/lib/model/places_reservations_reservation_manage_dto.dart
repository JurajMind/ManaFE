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
    startTime = json['startTime'] == null ? null : DateTime.parse(json['startTime']);
    endTime = json['endTime'] == null ? null : DateTime.parse(json['endTime']);
    timeSlotSize = json['TimeSlotSize'];
    date = json['Date'] == null ? null : DateTime.parse(json['Date']);
    tables = SeatDto.listFromJson(json['Tables']);
    reservations = PlacesReservationsReservationDto.listFromJson(json['Reservations']);
  }

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime == null ? '' : startTime.toUtc().toIso8601String(),
      'endTime': endTime == null ? '' : endTime.toUtc().toIso8601String(),
      'TimeSlotSize': timeSlotSize,
      'Date': date == null ? '' : date.toUtc().toIso8601String(),
      'Tables': tables,
      'Reservations': reservations
    };
  }

  static List<PlacesReservationsReservationManageDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlacesReservationsReservationManageDto>() : json.map((value) => new PlacesReservationsReservationManageDto.fromJson(value)).toList();
  }

  static Map<String, PlacesReservationsReservationManageDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlacesReservationsReservationManageDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PlacesReservationsReservationManageDto.fromJson(value));
    }
    return map;
  }
}

