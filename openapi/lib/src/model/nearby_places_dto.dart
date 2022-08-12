//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/place_simple_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nearby_places_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NearbyPlacesDto {
  /// Returns a new [NearbyPlacesDto] instance.
  NearbyPlacesDto({

     this.nearbyPlaces,

     this.success,

     this.message,

     this.httpResponseCode,
  });

  @JsonKey(
    
    name: r'NearbyPlaces',
    required: false,
    includeIfNull: false
  )


  List<PlaceSimpleDto>? nearbyPlaces;



  @JsonKey(
    
    name: r'Success',
    required: false,
    includeIfNull: false
  )


  bool? success;



  @JsonKey(
    
    name: r'Message',
    required: false,
    includeIfNull: false
  )


  String? message;



  @JsonKey(
    
    name: r'HttpResponseCode',
    required: false,
    includeIfNull: false
  )


  int? httpResponseCode;



  @override
  bool operator ==(Object other) => identical(this, other) || other is NearbyPlacesDto &&
     other.nearbyPlaces == nearbyPlaces &&
     other.success == success &&
     other.message == message &&
     other.httpResponseCode == httpResponseCode;

  @override
  int get hashCode =>
    nearbyPlaces.hashCode +
    success.hashCode +
    message.hashCode +
    httpResponseCode.hashCode;

  factory NearbyPlacesDto.fromJson(Map<String, dynamic> json) => _$NearbyPlacesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NearbyPlacesDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

