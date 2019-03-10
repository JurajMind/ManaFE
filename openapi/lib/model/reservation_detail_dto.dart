part of openapi.api;

class ReservationDetailDto {
  
  ReservationDto reservation = null;
  
  PlaceDto place = null;
  
  List<SmokeSessionSimpleDto> smokeSessions = [];
  
  List<HookahOrderDto> orders = [];
  ReservationDetailDto();

  @override
  String toString() {
    return 'ReservationDetailDto[reservation=$reservation, place=$place, smokeSessions=$smokeSessions, orders=$orders, ]';
  }

  ReservationDetailDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    reservation = new ReservationDto.fromJson(json['Reservation']);
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

  static List<ReservationDetailDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<ReservationDetailDto>() : json.map((value) => new ReservationDetailDto.fromJson(value)).toList();
  }

  static Map<String, ReservationDetailDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ReservationDetailDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ReservationDetailDto.fromJson(value));
    }
    return map;
  }
}

