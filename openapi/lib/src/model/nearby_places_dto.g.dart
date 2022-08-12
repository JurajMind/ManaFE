// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_places_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearbyPlacesDto _$NearbyPlacesDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'NearbyPlacesDto',
      json,
      ($checkedConvert) {
        final val = NearbyPlacesDto(
          nearbyPlaces: $checkedConvert(
              'NearbyPlaces',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => PlaceSimpleDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          success: $checkedConvert('Success', (v) => v as bool?),
          message: $checkedConvert('Message', (v) => v as String?),
          httpResponseCode:
              $checkedConvert('HttpResponseCode', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'nearbyPlaces': 'NearbyPlaces',
        'success': 'Success',
        'message': 'Message',
        'httpResponseCode': 'HttpResponseCode'
      },
    );

Map<String, dynamic> _$NearbyPlacesDtoToJson(NearbyPlacesDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'NearbyPlaces', instance.nearbyPlaces?.map((e) => e.toJson()).toList());
  writeNotNull('Success', instance.success);
  writeNotNull('Message', instance.message);
  writeNotNull('HttpResponseCode', instance.httpResponseCode);
  return val;
}
