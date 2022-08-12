//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'address_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AddressDto {
  /// Returns a new [AddressDto] instance.
  AddressDto({

     this.id,

     this.street,

     this.city,

     this.number,

     this.ZIP,

     this.lat,

     this.lng,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Street',
    required: false,
    includeIfNull: false
  )


  String? street;



  @JsonKey(
    
    name: r'City',
    required: false,
    includeIfNull: false
  )


  String? city;



  @JsonKey(
    
    name: r'Number',
    required: false,
    includeIfNull: false
  )


  String? number;



  @JsonKey(
    
    name: r'ZIP',
    required: false,
    includeIfNull: false
  )


  String? ZIP;



  @JsonKey(
    
    name: r'Lat',
    required: false,
    includeIfNull: false
  )


  String? lat;



  @JsonKey(
    
    name: r'Lng',
    required: false,
    includeIfNull: false
  )


  String? lng;



  @override
  bool operator ==(Object other) => identical(this, other) || other is AddressDto &&
     other.id == id &&
     other.street == street &&
     other.city == city &&
     other.number == number &&
     other.ZIP == ZIP &&
     other.lat == lat &&
     other.lng == lng;

  @override
  int get hashCode =>
    id.hashCode +
    street.hashCode +
    city.hashCode +
    number.hashCode +
    ZIP.hashCode +
    lat.hashCode +
    lng.hashCode;

  factory AddressDto.fromJson(Map<String, dynamic> json) => _$AddressDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

