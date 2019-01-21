part of openapi.api;

class SmartHookahServicesPlaceReservationUsageDto {
  
  List<ReservationsTimeSlot> timeSlots = [];
  SmartHookahServicesPlaceReservationUsageDto();

  @override
  String toString() {
    return 'SmartHookahServicesPlaceReservationUsageDto[timeSlots=$timeSlots, ]';
  }

  SmartHookahServicesPlaceReservationUsageDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    timeSlots = ReservationsTimeSlot.listFromJson(json['TimeSlots']);
  }

  Map<String, dynamic> toJson() {
    return {
      'TimeSlots': timeSlots
    };
  }

  static List<SmartHookahServicesPlaceReservationUsageDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahServicesPlaceReservationUsageDto>() : json.map((value) => new SmartHookahServicesPlaceReservationUsageDto.fromJson(value)).toList();
  }

  static Map<String, SmartHookahServicesPlaceReservationUsageDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahServicesPlaceReservationUsageDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahServicesPlaceReservationUsageDto.fromJson(value));
    }
    return map;
  }
}

