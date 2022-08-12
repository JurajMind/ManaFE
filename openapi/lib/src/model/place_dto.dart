//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/seat_dto.dart';
import 'package:openapi/src/model/smart_hookah_models_db_social_media.dart';
import 'package:openapi/src/model/business_hours_dto.dart';
import 'package:openapi/src/model/media_dto.dart';
import 'package:openapi/src/model/address_dto.dart';
import 'package:openapi/src/model/franchise_dto.dart';
import 'package:openapi/src/model/places_place_review_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlaceDto {
  /// Returns a new [PlaceDto] instance.
  PlaceDto({

     this.url,

     this.descriptions,

     this.baseHookahPrice,

     this.currency,

     this.seats,

     this.placeReviews,

     this.medias,

     this.haveReservation,

     this.minimumReservationTime,

     this.franchiseId,

     this.franchise,

     this.flags,

     this.socialMedias,

     this.id,

     this.name,

     this.shortDescriptions,

     this.description,

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
  });

  @JsonKey(
    
    name: r'Url',
    required: false,
    includeIfNull: false
  )


  String? url;



  @JsonKey(
    
    name: r'Descriptions',
    required: false,
    includeIfNull: false
  )


  String? descriptions;



  @JsonKey(
    
    name: r'BaseHookahPrice',
    required: false,
    includeIfNull: false
  )


  double? baseHookahPrice;



  @JsonKey(
    
    name: r'Currency',
    required: false,
    includeIfNull: false
  )


  String? currency;



  @JsonKey(
    
    name: r'Seats',
    required: false,
    includeIfNull: false
  )


  List<SeatDto>? seats;



  @JsonKey(
    
    name: r'PlaceReviews',
    required: false,
    includeIfNull: false
  )


  List<PlacesPlaceReviewDto>? placeReviews;



  @JsonKey(
    
    name: r'Medias',
    required: false,
    includeIfNull: false
  )


  List<MediaDto>? medias;



  @JsonKey(
    
    name: r'HaveReservation',
    required: false,
    includeIfNull: false
  )


  bool? haveReservation;



  @JsonKey(
    
    name: r'MinimumReservationTime',
    required: false,
    includeIfNull: false
  )


  int? minimumReservationTime;



  @JsonKey(
    
    name: r'FranchiseId',
    required: false,
    includeIfNull: false
  )


  int? franchiseId;



  @JsonKey(
    
    name: r'Franchise',
    required: false,
    includeIfNull: false
  )


  FranchiseDto? franchise;



  @JsonKey(
    
    name: r'Flags',
    required: false,
    includeIfNull: false
  )


  List<String>? flags;



  @JsonKey(
    
    name: r'SocialMedias',
    required: false,
    includeIfNull: false
  )


  List<SmartHookahModelsDbSocialMedia>? socialMedias;



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



  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaceDto &&
     other.url == url &&
     other.descriptions == descriptions &&
     other.baseHookahPrice == baseHookahPrice &&
     other.currency == currency &&
     other.seats == seats &&
     other.placeReviews == placeReviews &&
     other.medias == medias &&
     other.haveReservation == haveReservation &&
     other.minimumReservationTime == minimumReservationTime &&
     other.franchiseId == franchiseId &&
     other.franchise == franchise &&
     other.flags == flags &&
     other.socialMedias == socialMedias &&
     other.id == id &&
     other.name == name &&
     other.shortDescriptions == shortDescriptions &&
     other.description == description &&
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
     other.haveMana == haveMana;

  @override
  int get hashCode =>
    url.hashCode +
    descriptions.hashCode +
    baseHookahPrice.hashCode +
    currency.hashCode +
    seats.hashCode +
    placeReviews.hashCode +
    medias.hashCode +
    haveReservation.hashCode +
    minimumReservationTime.hashCode +
    franchiseId.hashCode +
    franchise.hashCode +
    flags.hashCode +
    socialMedias.hashCode +
    id.hashCode +
    name.hashCode +
    shortDescriptions.hashCode +
    description.hashCode +
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
    haveMana.hashCode;

  factory PlaceDto.fromJson(Map<String, dynamic> json) => _$PlaceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

