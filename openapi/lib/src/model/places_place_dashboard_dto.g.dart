// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_place_dashboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesPlaceDashboardDto _$PlacesPlaceDashboardDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PlacesPlaceDashboardDto',
      json,
      ($checkedConvert) {
        final val = PlacesPlaceDashboardDto(
          placeDevices: $checkedConvert(
              'PlaceDevices',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => PlacesDevicePlaceDashboardDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'placeDevices': 'PlaceDevices'},
    );

Map<String, dynamic> _$PlacesPlaceDashboardDtoToJson(
    PlacesPlaceDashboardDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'PlaceDevices', instance.placeDevices?.map((e) => e.toJson()).toList());
  return val;
}
