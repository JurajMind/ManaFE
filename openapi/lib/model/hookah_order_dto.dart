part of openapi.api;

class HookahOrderDto {
  
  DateTime created = null;
  
  int id = null;
  
  int placeId = null;
  
  int personId = null;
  
  int smokeSessionMetaDataId = null;
  
  SmokeSessionMetaDataDto smokeSessionMetaData = null;
  
  int smokeSessionId = null;
  
  SmokeSessionSimpleDto smokeSession = null;
  
  String extraInfo = null;
  
  int state = null;
  //enum stateEnum {  0,  1,  2,  3,  4,  };{
  
  double price = null;
  
  String currency = null;
  
  int seatId = null;
  
  SeatDto seat = null;
  
  int reservationId = null;
  
  PlacesReservationsReservationDto reservation = null;
  
  int type = null;
  //enum typeEnum {  0,  1,  2,  };{
  HookahOrderDto();

  @override
  String toString() {
    return 'HookahOrderDto[created=$created, id=$id, placeId=$placeId, personId=$personId, smokeSessionMetaDataId=$smokeSessionMetaDataId, smokeSessionMetaData=$smokeSessionMetaData, smokeSessionId=$smokeSessionId, smokeSession=$smokeSession, extraInfo=$extraInfo, state=$state, price=$price, currency=$currency, seatId=$seatId, seat=$seat, reservationId=$reservationId, reservation=$reservation, type=$type, ]';
  }

  HookahOrderDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    created = json['Created'] == null ? null : DateTime.parse(json['Created']);
    id = json['Id'];
    placeId = json['PlaceId'];
    personId = json['PersonId'];
    smokeSessionMetaDataId = json['SmokeSessionMetaDataId'];
    smokeSessionMetaData = new SmokeSessionMetaDataDto.fromJson(json['SmokeSessionMetaData']);
    smokeSessionId = json['SmokeSessionId'];
    smokeSession = new SmokeSessionSimpleDto.fromJson(json['SmokeSession']);
    extraInfo = json['ExtraInfo'];
    state = json['State'];
    price = json['Price'];
    currency = json['Currency'];
    seatId = json['SeatId'];
    seat = new SeatDto.fromJson(json['Seat']);
    reservationId = json['ReservationId'];
    reservation = new PlacesReservationsReservationDto.fromJson(json['Reservation']);
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Created': created == null ? '' : created.toUtc().toIso8601String(),
      'Id': id,
      'PlaceId': placeId,
      'PersonId': personId,
      'SmokeSessionMetaDataId': smokeSessionMetaDataId,
      'SmokeSessionMetaData': smokeSessionMetaData,
      'SmokeSessionId': smokeSessionId,
      'SmokeSession': smokeSession,
      'ExtraInfo': extraInfo,
      'State': state,
      'Price': price,
      'Currency': currency,
      'SeatId': seatId,
      'Seat': seat,
      'ReservationId': reservationId,
      'Reservation': reservation,
      'Type': type
    };
  }

  static List<HookahOrderDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<HookahOrderDto>() : json.map((value) => new HookahOrderDto.fromJson(value)).toList();
  }

  static Map<String, HookahOrderDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, HookahOrderDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new HookahOrderDto.fromJson(value));
    }
    return map;
  }
}

