part of openapi.api;

class PersonActiveDataDto {
  
  List<DeviceSimpleDto> devices = [];
  
  DeviceUpdateInfoDto updateInfo = null;
  
  List<SmokeSessionSimpleDto> activeSmokeSessions = [];
  
  List<PlacesReservationsReservationDto> activeReservations = [];
  
  List<HookahOrderDto> activeHookahOrders = [];
  
  GameProfileSimpleDto gameProfile = null;
  PersonActiveDataDto();

  @override
  String toString() {
    return 'PersonActiveDataDto[devices=$devices, updateInfo=$updateInfo, activeSmokeSessions=$activeSmokeSessions, activeReservations=$activeReservations, activeHookahOrders=$activeHookahOrders, gameProfile=$gameProfile, ]';
  }

  PersonActiveDataDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Devices'] == null) {
      devices = null;
    } else {
      devices = DeviceSimpleDto.listFromJson(json['Devices']);
    }
    if (json['UpdateInfo'] == null) {
      updateInfo = null;
    } else {
      updateInfo = new DeviceUpdateInfoDto.fromJson(json['UpdateInfo']);
    }
    if (json['ActiveSmokeSessions'] == null) {
      activeSmokeSessions = null;
    } else {
      activeSmokeSessions = SmokeSessionSimpleDto.listFromJson(json['ActiveSmokeSessions']);
    }
    if (json['ActiveReservations'] == null) {
      activeReservations = null;
    } else {
      activeReservations = PlacesReservationsReservationDto.listFromJson(json['ActiveReservations']);
    }
    if (json['ActiveHookahOrders'] == null) {
      activeHookahOrders = null;
    } else {
      activeHookahOrders = HookahOrderDto.listFromJson(json['ActiveHookahOrders']);
    }
    if (json['GameProfile'] == null) {
      gameProfile = null;
    } else {
      gameProfile = new GameProfileSimpleDto.fromJson(json['GameProfile']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (devices != null)
      json['Devices'] = devices;
    if (updateInfo != null)
      json['UpdateInfo'] = updateInfo;
    if (activeSmokeSessions != null)
      json['ActiveSmokeSessions'] = activeSmokeSessions;
    if (activeReservations != null)
      json['ActiveReservations'] = activeReservations;
    if (activeHookahOrders != null)
      json['ActiveHookahOrders'] = activeHookahOrders;
    if (gameProfile != null)
      json['GameProfile'] = gameProfile;
    return json;
  }

  static List<PersonActiveDataDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PersonActiveDataDto>() : json.map((value) => new PersonActiveDataDto.fromJson(value)).toList();
  }

  static Map<String, PersonActiveDataDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PersonActiveDataDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PersonActiveDataDto.fromJson(value));
    }
    return map;
  }
}

