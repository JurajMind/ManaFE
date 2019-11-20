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
    if (json['Created'] == null) {
      created = null;
    } else {
      created = DateTime.parse(json['Created']);
    }
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['PlaceId'] == null) {
      placeId = null;
    } else {
          placeId = json['PlaceId'];
    }
    if (json['PersonId'] == null) {
      personId = null;
    } else {
          personId = json['PersonId'];
    }
    if (json['SmokeSessionMetaDataId'] == null) {
      smokeSessionMetaDataId = null;
    } else {
          smokeSessionMetaDataId = json['SmokeSessionMetaDataId'];
    }
    if (json['SmokeSessionMetaData'] == null) {
      smokeSessionMetaData = null;
    } else {
      smokeSessionMetaData = new SmokeSessionMetaDataDto.fromJson(json['SmokeSessionMetaData']);
    }
    if (json['SmokeSessionId'] == null) {
      smokeSessionId = null;
    } else {
          smokeSessionId = json['SmokeSessionId'];
    }
    if (json['SmokeSession'] == null) {
      smokeSession = null;
    } else {
      smokeSession = new SmokeSessionSimpleDto.fromJson(json['SmokeSession']);
    }
    if (json['ExtraInfo'] == null) {
      extraInfo = null;
    } else {
          extraInfo = json['ExtraInfo'];
    }
    if (json['State'] == null) {
      state = null;
    } else {
          state = json['State'];
    }
    if (json['Price'] == null) {
      price = null;
    } else {
          price = json['Price'];
    }
    if (json['Currency'] == null) {
      currency = null;
    } else {
          currency = json['Currency'];
    }
    if (json['SeatId'] == null) {
      seatId = null;
    } else {
          seatId = json['SeatId'];
    }
    if (json['Seat'] == null) {
      seat = null;
    } else {
      seat = new SeatDto.fromJson(json['Seat']);
    }
    if (json['ReservationId'] == null) {
      reservationId = null;
    } else {
          reservationId = json['ReservationId'];
    }
    if (json['Reservation'] == null) {
      reservation = null;
    } else {
      reservation = new PlacesReservationsReservationDto.fromJson(json['Reservation']);
    }
    if (json['Type'] == null) {
      type = null;
    } else {
          type = json['Type'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (created != null)
      json['Created'] = created == null ? null : created.toUtc().toIso8601String();
    if (id != null)
      json['Id'] = id;
    if (placeId != null)
      json['PlaceId'] = placeId;
    if (personId != null)
      json['PersonId'] = personId;
    if (smokeSessionMetaDataId != null)
      json['SmokeSessionMetaDataId'] = smokeSessionMetaDataId;
    if (smokeSessionMetaData != null)
      json['SmokeSessionMetaData'] = smokeSessionMetaData;
    if (smokeSessionId != null)
      json['SmokeSessionId'] = smokeSessionId;
    if (smokeSession != null)
      json['SmokeSession'] = smokeSession;
    if (extraInfo != null)
      json['ExtraInfo'] = extraInfo;
    if (state != null)
      json['State'] = state;
    if (price != null)
      json['Price'] = price;
    if (currency != null)
      json['Currency'] = currency;
    if (seatId != null)
      json['SeatId'] = seatId;
    if (seat != null)
      json['Seat'] = seat;
    if (reservationId != null)
      json['ReservationId'] = reservationId;
    if (reservation != null)
      json['Reservation'] = reservation;
    if (type != null)
      json['Type'] = type;
    return json;
  }

  static List<HookahOrderDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<HookahOrderDto>() : json.map((value) => new HookahOrderDto.fromJson(value)).toList();
  }

  static Map<String, HookahOrderDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, HookahOrderDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new HookahOrderDto.fromJson(value));
    }
    return map;
  }
}

