//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class HookahOrderDto {
  /// Returns a new [HookahOrderDto] instance.
  HookahOrderDto({
    this.created,
    this.id,
    this.placeId,
    this.personId,
    this.smokeSessionMetaDataId,
    this.smokeSessionMetaData,
    this.smokeSessionId,
    this.smokeSession,
    this.extraInfo,
    this.state,
    this.price,
    this.currency,
    this.seatId,
    this.seat,
    this.reservationId,
    this.reservation,
    this.type,
  });

  DateTime created;

  int id;

  int placeId;

  int personId;

  int smokeSessionMetaDataId;

  SmokeSessionMetaDataDto smokeSessionMetaData;

  int smokeSessionId;

  SmokeSessionSimpleDto smokeSession;

  String extraInfo;

  HookahOrderDtoStateEnum state;

  double price;

  String currency;

  int seatId;

  SeatDto seat;

  int reservationId;

  PlacesReservationsReservationDto reservation;

  HookahOrderDtoTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is HookahOrderDto &&
     other.created == created &&
     other.id == id &&
     other.placeId == placeId &&
     other.personId == personId &&
     other.smokeSessionMetaDataId == smokeSessionMetaDataId &&
     other.smokeSessionMetaData == smokeSessionMetaData &&
     other.smokeSessionId == smokeSessionId &&
     other.smokeSession == smokeSession &&
     other.extraInfo == extraInfo &&
     other.state == state &&
     other.price == price &&
     other.currency == currency &&
     other.seatId == seatId &&
     other.seat == seat &&
     other.reservationId == reservationId &&
     other.reservation == reservation &&
     other.type == type;

  @override
  int get hashCode =>
    (created == null ? 0 : created.hashCode) +
    (id == null ? 0 : id.hashCode) +
    (placeId == null ? 0 : placeId.hashCode) +
    (personId == null ? 0 : personId.hashCode) +
    (smokeSessionMetaDataId == null ? 0 : smokeSessionMetaDataId.hashCode) +
    (smokeSessionMetaData == null ? 0 : smokeSessionMetaData.hashCode) +
    (smokeSessionId == null ? 0 : smokeSessionId.hashCode) +
    (smokeSession == null ? 0 : smokeSession.hashCode) +
    (extraInfo == null ? 0 : extraInfo.hashCode) +
    (state == null ? 0 : state.hashCode) +
    (price == null ? 0 : price.hashCode) +
    (currency == null ? 0 : currency.hashCode) +
    (seatId == null ? 0 : seatId.hashCode) +
    (seat == null ? 0 : seat.hashCode) +
    (reservationId == null ? 0 : reservationId.hashCode) +
    (reservation == null ? 0 : reservation.hashCode) +
    (type == null ? 0 : type.hashCode);

  @override
  String toString() => 'HookahOrderDto[created=$created, id=$id, placeId=$placeId, personId=$personId, smokeSessionMetaDataId=$smokeSessionMetaDataId, smokeSessionMetaData=$smokeSessionMetaData, smokeSessionId=$smokeSessionId, smokeSession=$smokeSession, extraInfo=$extraInfo, state=$state, price=$price, currency=$currency, seatId=$seatId, seat=$seat, reservationId=$reservationId, reservation=$reservation, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (created != null) {
      json[r'Created'] = created.toUtc().toIso8601String();
    }
    if (id != null) {
      json[r'Id'] = id;
    }
    if (placeId != null) {
      json[r'PlaceId'] = placeId;
    }
    if (personId != null) {
      json[r'PersonId'] = personId;
    }
    if (smokeSessionMetaDataId != null) {
      json[r'SmokeSessionMetaDataId'] = smokeSessionMetaDataId;
    }
    if (smokeSessionMetaData != null) {
      json[r'SmokeSessionMetaData'] = smokeSessionMetaData;
    }
    if (smokeSessionId != null) {
      json[r'SmokeSessionId'] = smokeSessionId;
    }
    if (smokeSession != null) {
      json[r'SmokeSession'] = smokeSession;
    }
    if (extraInfo != null) {
      json[r'ExtraInfo'] = extraInfo;
    }
    if (state != null) {
      json[r'State'] = state;
    }
    if (price != null) {
      json[r'Price'] = price;
    }
    if (currency != null) {
      json[r'Currency'] = currency;
    }
    if (seatId != null) {
      json[r'SeatId'] = seatId;
    }
    if (seat != null) {
      json[r'Seat'] = seat;
    }
    if (reservationId != null) {
      json[r'ReservationId'] = reservationId;
    }
    if (reservation != null) {
      json[r'Reservation'] = reservation;
    }
    if (type != null) {
      json[r'Type'] = type;
    }
    return json;
  }

  /// Returns a new [HookahOrderDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static HookahOrderDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : HookahOrderDto(
        created: json[r'Created'] == null
          ? null
          : DateTime.parse(json[r'Created']),
        id: json[r'Id'],
        placeId: json[r'PlaceId'],
        personId: json[r'PersonId'],
        smokeSessionMetaDataId: json[r'SmokeSessionMetaDataId'],
        smokeSessionMetaData: SmokeSessionMetaDataDto.fromJson(json[r'SmokeSessionMetaData']),
        smokeSessionId: json[r'SmokeSessionId'],
        smokeSession: SmokeSessionSimpleDto.fromJson(json[r'SmokeSession']),
        extraInfo: json[r'ExtraInfo'],
        state: HookahOrderDtoStateEnum.fromJson(json[r'State']),
        price: json[r'Price'],
        currency: json[r'Currency'],
        seatId: json[r'SeatId'],
        seat: SeatDto.fromJson(json[r'Seat']),
        reservationId: json[r'ReservationId'],
        reservation: PlacesReservationsReservationDto.fromJson(json[r'Reservation']),
        type: HookahOrderDtoTypeEnum.fromJson(json[r'Type']),
    );

  static List<HookahOrderDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <HookahOrderDto>[]
      : json.map((v) => HookahOrderDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, HookahOrderDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, HookahOrderDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = HookahOrderDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of HookahOrderDto-objects as value to a dart map
  static Map<String, List<HookahOrderDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<HookahOrderDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = HookahOrderDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class HookahOrderDtoStateEnum {
  /// Instantiate a new enum with the provided [value].
  const HookahOrderDtoStateEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = HookahOrderDtoStateEnum._(0);
  static const number1 = HookahOrderDtoStateEnum._(1);
  static const number2 = HookahOrderDtoStateEnum._(2);
  static const number3 = HookahOrderDtoStateEnum._(3);
  static const number4 = HookahOrderDtoStateEnum._(4);

  /// List of all possible values in this [enum][HookahOrderDtoStateEnum].
  static const values = <HookahOrderDtoStateEnum>[
    number0,
    number1,
    number2,
    number3,
    number4,
  ];

  static HookahOrderDtoStateEnum fromJson(dynamic value) =>
    HookahOrderDtoStateEnumTypeTransformer().decode(value);

  static List<HookahOrderDtoStateEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <HookahOrderDtoStateEnum>[]
      : json
          .map((value) => HookahOrderDtoStateEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [HookahOrderDtoStateEnum] to int,
/// and [decode] dynamic data back to [HookahOrderDtoStateEnum].
class HookahOrderDtoStateEnumTypeTransformer {
  const HookahOrderDtoStateEnumTypeTransformer._();

  factory HookahOrderDtoStateEnumTypeTransformer() => _instance ??= HookahOrderDtoStateEnumTypeTransformer._();

  int encode(HookahOrderDtoStateEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a HookahOrderDtoStateEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  HookahOrderDtoStateEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return HookahOrderDtoStateEnum.number0;
      case 1: return HookahOrderDtoStateEnum.number1;
      case 2: return HookahOrderDtoStateEnum.number2;
      case 3: return HookahOrderDtoStateEnum.number3;
      case 4: return HookahOrderDtoStateEnum.number4;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [HookahOrderDtoStateEnumTypeTransformer] instance.
  static HookahOrderDtoStateEnumTypeTransformer _instance;
}


class HookahOrderDtoTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const HookahOrderDtoTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = HookahOrderDtoTypeEnum._(0);
  static const number1 = HookahOrderDtoTypeEnum._(1);
  static const number2 = HookahOrderDtoTypeEnum._(2);

  /// List of all possible values in this [enum][HookahOrderDtoTypeEnum].
  static const values = <HookahOrderDtoTypeEnum>[
    number0,
    number1,
    number2,
  ];

  static HookahOrderDtoTypeEnum fromJson(dynamic value) =>
    HookahOrderDtoTypeEnumTypeTransformer().decode(value);

  static List<HookahOrderDtoTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <HookahOrderDtoTypeEnum>[]
      : json
          .map((value) => HookahOrderDtoTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [HookahOrderDtoTypeEnum] to int,
/// and [decode] dynamic data back to [HookahOrderDtoTypeEnum].
class HookahOrderDtoTypeEnumTypeTransformer {
  const HookahOrderDtoTypeEnumTypeTransformer._();

  factory HookahOrderDtoTypeEnumTypeTransformer() => _instance ??= HookahOrderDtoTypeEnumTypeTransformer._();

  int encode(HookahOrderDtoTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a HookahOrderDtoTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  HookahOrderDtoTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return HookahOrderDtoTypeEnum.number0;
      case 1: return HookahOrderDtoTypeEnum.number1;
      case 2: return HookahOrderDtoTypeEnum.number2;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [HookahOrderDtoTypeEnumTypeTransformer] instance.
  static HookahOrderDtoTypeEnumTypeTransformer _instance;
}

