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
    if (json['TimeSlots'] == null) {
      timeSlots = null;
    } else {
      timeSlots = ReservationsTimeSlot.listFromJson(json['TimeSlots']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (timeSlots != null)
      json['TimeSlots'] = timeSlots;
    return json;
  }

  static List<SmartHookahServicesPlaceReservationUsageDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahServicesPlaceReservationUsageDto>() : json.map((value) => new SmartHookahServicesPlaceReservationUsageDto.fromJson(value)).toList();
  }

  static Map<String, SmartHookahServicesPlaceReservationUsageDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahServicesPlaceReservationUsageDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahServicesPlaceReservationUsageDto.fromJson(value));
    }
    return map;
  }
}

