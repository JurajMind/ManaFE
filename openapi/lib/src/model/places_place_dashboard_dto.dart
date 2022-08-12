//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/places_device_place_dashboard_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'places_place_dashboard_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlacesPlaceDashboardDto {
  /// Returns a new [PlacesPlaceDashboardDto] instance.
  PlacesPlaceDashboardDto({

     this.placeDevices,
  });

  @JsonKey(
    
    name: r'PlaceDevices',
    required: false,
    includeIfNull: false
  )


  List<PlacesDevicePlaceDashboardDto>? placeDevices;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacesPlaceDashboardDto &&
     other.placeDevices == placeDevices;

  @override
  int get hashCode =>
    placeDevices.hashCode;

  factory PlacesPlaceDashboardDto.fromJson(Map<String, dynamic> json) => _$PlacesPlaceDashboardDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesPlaceDashboardDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

