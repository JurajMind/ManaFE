//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/reservations_time_slot.dart';
import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_services_place_reservation_usage_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahServicesPlaceReservationUsageDto {
  /// Returns a new [SmartHookahServicesPlaceReservationUsageDto] instance.
  SmartHookahServicesPlaceReservationUsageDto({

     this.timeSlots,
  });

  @JsonKey(
    
    name: r'TimeSlots',
    required: false,
    includeIfNull: false
  )


  List<ReservationsTimeSlot>? timeSlots;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahServicesPlaceReservationUsageDto &&
     other.timeSlots == timeSlots;

  @override
  int get hashCode =>
    timeSlots.hashCode;

  factory SmartHookahServicesPlaceReservationUsageDto.fromJson(Map<String, dynamic> json) => _$SmartHookahServicesPlaceReservationUsageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahServicesPlaceReservationUsageDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

