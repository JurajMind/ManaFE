//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/business_hours_dto.dart';
import 'package:openapi/src/model/media_dto.dart';
import 'package:openapi/src/model/address_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_simple_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlaceSimpleDto {
  /// Returns a new [PlaceSimpleDto] instance.
  PlaceSimpleDto({

     this.id,

     this.name,

     this.shortDescriptions,

     this.description,

     this.franchiseId,

     this.franchiseName,

     this.franchiseLogo,

     this.friendlyUrl,

     this.logoPath,

     this.address,

     this.businessHours,

     this.rating,

     this.media,

     this.phoneNumber,

     this.facebook,

     this.haveMenu,

     this.haveOrders,

     this.haveMana,

     this.haveReservation,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Name',
    required: false,
    includeIfNull: false
  )


  String? name;



  @JsonKey(
    
    name: r'ShortDescriptions',
    required: false,
    includeIfNull: false
  )


  Map<String, String>? shortDescriptions;



  @JsonKey(
    
    name: r'Description',
    required: false,
    includeIfNull: false
  )


  Map<String, String>? description;



  @JsonKey(
    
    name: r'FranchiseId',
    required: false,
    includeIfNull: false
  )


  int? franchiseId;



  @JsonKey(
    
    name: r'FranchiseName',
    required: false,
    includeIfNull: false
  )


  String? franchiseName;



  @JsonKey(
    
    name: r'FranchiseLogo',
    required: false,
    includeIfNull: false
  )


  String? franchiseLogo;



  @JsonKey(
    
    name: r'FriendlyUrl',
    required: false,
    includeIfNull: false
  )


  String? friendlyUrl;



  @JsonKey(
    
    name: r'LogoPath',
    required: false,
    includeIfNull: false
  )


  String? logoPath;



  @JsonKey(
    
    name: r'Address',
    required: false,
    includeIfNull: false
  )


  AddressDto? address;



  @JsonKey(
    
    name: r'BusinessHours',
    required: false,
    includeIfNull: false
  )


  List<BusinessHoursDto>? businessHours;



  @JsonKey(
    
    name: r'Rating',
    required: false,
    includeIfNull: false
  )


  int? rating;



  @JsonKey(
    
    name: r'Media',
    required: false,
    includeIfNull: false
  )


  MediaDto? media;



  @JsonKey(
    
    name: r'PhoneNumber',
    required: false,
    includeIfNull: false
  )


  String? phoneNumber;



  @JsonKey(
    
    name: r'Facebook',
    required: false,
    includeIfNull: false
  )


  String? facebook;



  @JsonKey(
    
    name: r'HaveMenu',
    required: false,
    includeIfNull: false
  )


  bool? haveMenu;



  @JsonKey(
    
    name: r'HaveOrders',
    required: false,
    includeIfNull: false
  )


  bool? haveOrders;



  @JsonKey(
    
    name: r'HaveMana',
    required: false,
    includeIfNull: false
  )


  bool? haveMana;



  @JsonKey(
    
    name: r'HaveReservation',
    required: false,
    includeIfNull: false
  )


  bool? haveReservation;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaceSimpleDto &&
     other.id == id &&
     other.name == name &&
     other.shortDescriptions == shortDescriptions &&
     other.description == description &&
     other.franchiseId == franchiseId &&
     other.franchiseName == franchiseName &&
     other.franchiseLogo == franchiseLogo &&
     other.friendlyUrl == friendlyUrl &&
     other.logoPath == logoPath &&
     other.address == address &&
     other.businessHours == businessHours &&
     other.rating == rating &&
     other.media == media &&
     other.phoneNumber == phoneNumber &&
     other.facebook == facebook &&
     other.haveMenu == haveMenu &&
     other.haveOrders == haveOrders &&
     other.haveMana == haveMana &&
     other.haveReservation == haveReservation;

  @override
  int get hashCode =>
    id.hashCode +
    name.hashCode +
    shortDescriptions.hashCode +
    description.hashCode +
    franchiseId.hashCode +
    franchiseName.hashCode +
    franchiseLogo.hashCode +
    friendlyUrl.hashCode +
    logoPath.hashCode +
    address.hashCode +
    businessHours.hashCode +
    rating.hashCode +
    media.hashCode +
    phoneNumber.hashCode +
    facebook.hashCode +
    haveMenu.hashCode +
    haveOrders.hashCode +
    haveMana.hashCode +
    haveReservation.hashCode;

  factory PlaceSimpleDto.fromJson(Map<String, dynamic> json) => _$PlaceSimpleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceSimpleDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

