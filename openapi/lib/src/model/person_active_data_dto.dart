//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/device_simple_dto.dart';
import 'package:openapi/src/model/device_update_info_dto.dart';
import 'package:openapi/src/model/smoke_session_simple_dto.dart';
import 'package:openapi/src/model/game_profile_simple_dto.dart';
import 'package:openapi/src/model/places_reservations_reservation_dto.dart';
import 'package:openapi/src/model/hookah_order_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_active_data_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonActiveDataDto {
  /// Returns a new [PersonActiveDataDto] instance.
  PersonActiveDataDto({

     this.devices,

     this.updateInfo,

     this.activeSmokeSessions,

     this.activeReservations,

     this.activeHookahOrders,

     this.gameProfile,
  });

  @JsonKey(
    
    name: r'Devices',
    required: false,
    includeIfNull: false
  )


  List<DeviceSimpleDto>? devices;



  @JsonKey(
    
    name: r'UpdateInfo',
    required: false,
    includeIfNull: false
  )


  DeviceUpdateInfoDto? updateInfo;



  @JsonKey(
    
    name: r'ActiveSmokeSessions',
    required: false,
    includeIfNull: false
  )


  List<SmokeSessionSimpleDto>? activeSmokeSessions;



  @JsonKey(
    
    name: r'ActiveReservations',
    required: false,
    includeIfNull: false
  )


  List<PlacesReservationsReservationDto>? activeReservations;



  @JsonKey(
    
    name: r'ActiveHookahOrders',
    required: false,
    includeIfNull: false
  )


  List<HookahOrderDto>? activeHookahOrders;



  @JsonKey(
    
    name: r'GameProfile',
    required: false,
    includeIfNull: false
  )


  GameProfileSimpleDto? gameProfile;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PersonActiveDataDto &&
     other.devices == devices &&
     other.updateInfo == updateInfo &&
     other.activeSmokeSessions == activeSmokeSessions &&
     other.activeReservations == activeReservations &&
     other.activeHookahOrders == activeHookahOrders &&
     other.gameProfile == gameProfile;

  @override
  int get hashCode =>
    devices.hashCode +
    updateInfo.hashCode +
    activeSmokeSessions.hashCode +
    activeReservations.hashCode +
    activeHookahOrders.hashCode +
    gameProfile.hashCode;

  factory PersonActiveDataDto.fromJson(Map<String, dynamic> json) => _$PersonActiveDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonActiveDataDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

