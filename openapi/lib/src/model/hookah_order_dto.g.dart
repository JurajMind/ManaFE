// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hookah_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HookahOrderDto _$HookahOrderDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'HookahOrderDto',
      json,
      ($checkedConvert) {
        final val = HookahOrderDto(
          created: $checkedConvert(
              'Created', (v) => v == null ? null : DateTime.parse(v as String)),
          id: $checkedConvert('Id', (v) => v as int?),
          placeId: $checkedConvert('PlaceId', (v) => v as int?),
          personId: $checkedConvert('PersonId', (v) => v as int?),
          smokeSessionMetaDataId:
              $checkedConvert('SmokeSessionMetaDataId', (v) => v as int?),
          smokeSessionMetaData: $checkedConvert(
              'SmokeSessionMetaData',
              (v) => v == null
                  ? null
                  : SmokeSessionMetaDataDto.fromJson(
                      v as Map<String, dynamic>)),
          smokeSessionId: $checkedConvert('SmokeSessionId', (v) => v as int?),
          smokeSession: $checkedConvert(
              'SmokeSession',
              (v) => v == null
                  ? null
                  : SmokeSessionSimpleDto.fromJson(v as Map<String, dynamic>)),
          extraInfo: $checkedConvert('ExtraInfo', (v) => v as String?),
          state: $checkedConvert('State',
              (v) => $enumDecodeNullable(_$HookahOrderDtoStateEnumEnumMap, v)),
          price: $checkedConvert('Price', (v) => (v as num?)?.toDouble()),
          currency: $checkedConvert('Currency', (v) => v as String?),
          seatId: $checkedConvert('SeatId', (v) => v as int?),
          seat: $checkedConvert(
              'Seat',
              (v) => v == null
                  ? null
                  : SeatDto.fromJson(v as Map<String, dynamic>)),
          reservationId: $checkedConvert('ReservationId', (v) => v as int?),
          reservation: $checkedConvert(
              'Reservation',
              (v) => v == null
                  ? null
                  : PlacesReservationsReservationDto.fromJson(
                      v as Map<String, dynamic>)),
          type: $checkedConvert('Type',
              (v) => $enumDecodeNullable(_$HookahOrderDtoTypeEnumEnumMap, v)),
        );
        return val;
      },
      fieldKeyMap: const {
        'created': 'Created',
        'id': 'Id',
        'placeId': 'PlaceId',
        'personId': 'PersonId',
        'smokeSessionMetaDataId': 'SmokeSessionMetaDataId',
        'smokeSessionMetaData': 'SmokeSessionMetaData',
        'smokeSessionId': 'SmokeSessionId',
        'smokeSession': 'SmokeSession',
        'extraInfo': 'ExtraInfo',
        'state': 'State',
        'price': 'Price',
        'currency': 'Currency',
        'seatId': 'SeatId',
        'seat': 'Seat',
        'reservationId': 'ReservationId',
        'reservation': 'Reservation',
        'type': 'Type'
      },
    );

Map<String, dynamic> _$HookahOrderDtoToJson(HookahOrderDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Created', instance.created?.toIso8601String());
  writeNotNull('Id', instance.id);
  writeNotNull('PlaceId', instance.placeId);
  writeNotNull('PersonId', instance.personId);
  writeNotNull('SmokeSessionMetaDataId', instance.smokeSessionMetaDataId);
  writeNotNull('SmokeSessionMetaData', instance.smokeSessionMetaData?.toJson());
  writeNotNull('SmokeSessionId', instance.smokeSessionId);
  writeNotNull('SmokeSession', instance.smokeSession?.toJson());
  writeNotNull('ExtraInfo', instance.extraInfo);
  writeNotNull('State', _$HookahOrderDtoStateEnumEnumMap[instance.state]);
  writeNotNull('Price', instance.price);
  writeNotNull('Currency', instance.currency);
  writeNotNull('SeatId', instance.seatId);
  writeNotNull('Seat', instance.seat?.toJson());
  writeNotNull('ReservationId', instance.reservationId);
  writeNotNull('Reservation', instance.reservation?.toJson());
  writeNotNull('Type', _$HookahOrderDtoTypeEnumEnumMap[instance.type]);
  return val;
}

const _$HookahOrderDtoStateEnumEnumMap = {
  HookahOrderDtoStateEnum.number0: 0,
  HookahOrderDtoStateEnum.number1: 1,
  HookahOrderDtoStateEnum.number2: 2,
  HookahOrderDtoStateEnum.number3: 3,
  HookahOrderDtoStateEnum.number4: 4,
};

const _$HookahOrderDtoTypeEnumEnumMap = {
  HookahOrderDtoTypeEnum.number0: 0,
  HookahOrderDtoTypeEnum.number1: 1,
  HookahOrderDtoTypeEnum.number2: 2,
};
