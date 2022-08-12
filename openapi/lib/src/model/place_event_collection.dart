//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/place_event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_event_collection.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlaceEventCollection {
  /// Returns a new [PlaceEventCollection] instance.
  PlaceEventCollection({

     this.eventCollection,

     this.success,

     this.message,

     this.httpResponseCode,
  });

  @JsonKey(
    
    name: r'EventCollection',
    required: false,
    includeIfNull: false
  )


  List<PlaceEvent>? eventCollection;



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
  bool operator ==(Object other) => identical(this, other) || other is PlaceEventCollection &&
     other.eventCollection == eventCollection &&
     other.success == success &&
     other.message == message &&
     other.httpResponseCode == httpResponseCode;

  @override
  int get hashCode =>
    eventCollection.hashCode +
    success.hashCode +
    message.hashCode +
    httpResponseCode.hashCode;

  factory PlaceEventCollection.fromJson(Map<String, dynamic> json) => _$PlaceEventCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceEventCollectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

