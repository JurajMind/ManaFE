part of openapi.api;

class PersonActiveDataDto {
  
  List<DeviceSimpleDto> devices = [];
  
  List<SmokeSessionSimpleDto> activeSmokeSessions = [];
  
  List<ReservationDto> activeReservations = [];
  
  List<HookahOrderDto> activeHookahOrders = [];
  
  GameProfileSimpleDto gameProfile = null;
  PersonActiveDataDto();

  @override
  String toString() {
    return 'PersonActiveDataDto[devices=$devices, activeSmokeSessions=$activeSmokeSessions, activeReservations=$activeReservations, activeHookahOrders=$activeHookahOrders, gameProfile=$gameProfile, ]';
  }

  PersonActiveDataDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    devices = DeviceSimpleDto.listFromJson(json['Devices']);
    activeSmokeSessions = SmokeSessionSimpleDto.listFromJson(json['ActiveSmokeSessions']);
    activeReservations = ReservationDto.listFromJson(json['ActiveReservations']);
    activeHookahOrders = HookahOrderDto.listFromJson(json['ActiveHookahOrders']);
    gameProfile = new GameProfileSimpleDto.fromJson(json['GameProfile']);
  }

  Map<String, dynamic> toJson() {
    return {
      'Devices': devices,
      'ActiveSmokeSessions': activeSmokeSessions,
      'ActiveReservations': activeReservations,
      'ActiveHookahOrders': activeHookahOrders,
      'GameProfile': gameProfile
    };
  }

  static List<PersonActiveDataDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PersonActiveDataDto>() : json.map((value) => new PersonActiveDataDto.fromJson(value)).toList();
  }

  static Map<String, PersonActiveDataDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PersonActiveDataDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PersonActiveDataDto.fromJson(value));
    }
    return map;
  }
}

