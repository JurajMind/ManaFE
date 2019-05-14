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
    reservation = new PlacesReservationsReservationDto.fromJson(json['Reservation']);
    place = new PlaceDto.fromJson(json['Place']);
    smokeSessions = SmokeSessionSimpleDto.listFromJson(json['SmokeSessions']);
    orders = HookahOrderDto.listFromJson(json['Orders']);
  }

  Map<String, dynamic> toJson() {
    return {
      'Reservation': reservation,
      'Place': place,
      'SmokeSessions': smokeSessions,
      'Orders': orders
    };
  }

  static List<PlacesReservationsReservationDetailDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlacesReservationsReservationDetailDto>() : json.map((value) => new PlacesReservationsReservationDetailDto.fromJson(value)).toList();
  }

  static Map<String, PlacesReservationsReservationDetailDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlacesReservationsReservationDetailDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PlacesReservationsReservationDetailDto.fromJson(value));
    }
    return map;
  }
}

