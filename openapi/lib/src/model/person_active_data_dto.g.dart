// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_active_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonActiveDataDto _$PersonActiveDataDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PersonActiveDataDto',
      json,
      ($checkedConvert) {
        final val = PersonActiveDataDto(
          devices: $checkedConvert(
              'Devices',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      DeviceSimpleDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          updateInfo: $checkedConvert(
              'UpdateInfo',
              (v) => v == null
                  ? null
                  : DeviceUpdateInfoDto.fromJson(v as Map<String, dynamic>)),
          activeSmokeSessions: $checkedConvert(
              'ActiveSmokeSessions',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      SmokeSessionSimpleDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          activeReservations: $checkedConvert(
              'ActiveReservations',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => PlacesReservationsReservationDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          activeHookahOrders: $checkedConvert(
              'ActiveHookahOrders',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => HookahOrderDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          gameProfile: $checkedConvert(
              'GameProfile',
              (v) => v == null
                  ? null
                  : GameProfileSimpleDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'devices': 'Devices',
        'updateInfo': 'UpdateInfo',
        'activeSmokeSessions': 'ActiveSmokeSessions',
        'activeReservations': 'ActiveReservations',
        'activeHookahOrders': 'ActiveHookahOrders',
        'gameProfile': 'GameProfile'
      },
    );

Map<String, dynamic> _$PersonActiveDataDtoToJson(PersonActiveDataDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Devices', instance.devices?.map((e) => e.toJson()).toList());
  writeNotNull('UpdateInfo', instance.updateInfo?.toJson());
  writeNotNull('ActiveSmokeSessions',
      instance.activeSmokeSessions?.map((e) => e.toJson()).toList());
  writeNotNull('ActiveReservations',
      instance.activeReservations?.map((e) => e.toJson()).toList());
  writeNotNull('ActiveHookahOrders',
      instance.activeHookahOrders?.map((e) => e.toJson()).toList());
  writeNotNull('GameProfile', instance.gameProfile?.toJson());
  return val;
}
