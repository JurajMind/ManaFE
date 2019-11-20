part of openapi.api;

class PlacesReservationsReservationDetailDto {
  
  PlacesReservationsReservationDto reservation = null;
  
  PlaceDto place = null;
  
  List<SmokeSessionSimpleDto> smokeSessions = [];
  
  List<HookahOrderDto> orders = [];
  PlacesReservationsReservationDetailDto();

  @override
  String toString() {
    return 'PlacesReservationsReservationDetailDto[reservation=$reservation, place=$place, smokeSessions=$smokeSessions, orders=$orders, ]';
  }

  PlacesReservationsReservationDetailDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Reservation'] == null) {
      reservation = null;
    } else {
      reservation = new PlacesReservationsReservationDto.fromJson(json['Reservation']);
    }
    if (json['Place'] == null) {
      place = null;
    } else {
      place = new PlaceDto.fromJson(json['Place']);
    }
    if (json['SmokeSessions'] == null) {
      smokeSessions = null;
    } else {
      smokeSessions = SmokeSessionSimpleDto.listFromJson(json['SmokeSessions']);
    }
    if (json['Orders'] == null) {
      orders = null;
    } else {
      orders = HookahOrderDto.listFromJson(json['Orders']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (reservation != null)
      json['Reservation'] = reservation;
    if (place != null)
      json['Place'] = place;
    if (smokeSessions != null)
      json['SmokeSessions'] = smokeSessions;
    if (orders != null)
      json['Orders'] = orders;
    return json;
  }

  static List<PlacesReservationsReservationDetailDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlacesReservationsReservationDetailDto>() : json.map((value) => new PlacesReservationsReservationDetailDto.fromJson(value)).toList();
  }

  static Map<String, PlacesReservationsReservationDetailDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlacesReservationsReservationDetailDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlacesReservationsReservationDetailDto.fromJson(value));
    }
    return map;
  }
}

