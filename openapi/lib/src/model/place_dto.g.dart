// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDto _$PlaceDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'PlaceDto',
      json,
      ($checkedConvert) {
        final val = PlaceDto(
          url: $checkedConvert('Url', (v) => v as String?),
          descriptions: $checkedConvert('Descriptions', (v) => v as String?),
          baseHookahPrice: $checkedConvert(
              'BaseHookahPrice', (v) => (v as num?)?.toDouble()),
          currency: $checkedConvert('Currency', (v) => v as String?),
          seats: $checkedConvert(
              'Seats',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => SeatDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          placeReviews: $checkedConvert(
              'PlaceReviews',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      PlacesPlaceReviewDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          medias: $checkedConvert(
              'Medias',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => MediaDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          haveReservation:
              $checkedConvert('HaveReservation', (v) => v as bool?),
          minimumReservationTime:
              $checkedConvert('MinimumReservationTime', (v) => v as int?),
          franchiseId: $checkedConvert('FranchiseId', (v) => v as int?),
          franchise: $checkedConvert(
              'Franchise',
              (v) => v == null
                  ? null
                  : FranchiseDto.fromJson(v as Map<String, dynamic>)),
          flags: $checkedConvert('Flags',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          socialMedias: $checkedConvert(
              'SocialMedias',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => SmartHookahModelsDbSocialMedia.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          id: $checkedConvert('Id', (v) => v as int?),
          name: $checkedConvert('Name', (v) => v as String?),
          shortDescriptions: $checkedConvert(
              'ShortDescriptions',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, e as String),
                  )),
          description: $checkedConvert(
              'Description',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, e as String),
                  )),
          franchiseName: $checkedConvert('FranchiseName', (v) => v as String?),
          franchiseLogo: $checkedConvert('FranchiseLogo', (v) => v as String?),
          friendlyUrl: $checkedConvert('FriendlyUrl', (v) => v as String?),
          logoPath: $checkedConvert('LogoPath', (v) => v as String?),
          address: $checkedConvert(
              'Address',
              (v) => v == null
                  ? null
                  : AddressDto.fromJson(v as Map<String, dynamic>)),
          businessHours: $checkedConvert(
              'BusinessHours',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      BusinessHoursDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          rating: $checkedConvert('Rating', (v) => v as int?),
          media: $checkedConvert(
              'Media',
              (v) => v == null
                  ? null
                  : MediaDto.fromJson(v as Map<String, dynamic>)),
          phoneNumber: $checkedConvert('PhoneNumber', (v) => v as String?),
          facebook: $checkedConvert('Facebook', (v) => v as String?),
          haveMenu: $checkedConvert('HaveMenu', (v) => v as bool?),
          haveOrders: $checkedConvert('HaveOrders', (v) => v as bool?),
          haveMana: $checkedConvert('HaveMana', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'url': 'Url',
        'descriptions': 'Descriptions',
        'baseHookahPrice': 'BaseHookahPrice',
        'currency': 'Currency',
        'seats': 'Seats',
        'placeReviews': 'PlaceReviews',
        'medias': 'Medias',
        'haveReservation': 'HaveReservation',
        'minimumReservationTime': 'MinimumReservationTime',
        'franchiseId': 'FranchiseId',
        'franchise': 'Franchise',
        'flags': 'Flags',
        'socialMedias': 'SocialMedias',
        'id': 'Id',
        'name': 'Name',
        'shortDescriptions': 'ShortDescriptions',
        'description': 'Description',
        'franchiseName': 'FranchiseName',
        'franchiseLogo': 'FranchiseLogo',
        'friendlyUrl': 'FriendlyUrl',
        'logoPath': 'LogoPath',
        'address': 'Address',
        'businessHours': 'BusinessHours',
        'rating': 'Rating',
        'media': 'Media',
        'phoneNumber': 'PhoneNumber',
        'facebook': 'Facebook',
        'haveMenu': 'HaveMenu',
        'haveOrders': 'HaveOrders',
        'haveMana': 'HaveMana'
      },
    );

Map<String, dynamic> _$PlaceDtoToJson(PlaceDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Url', instance.url);
  writeNotNull('Descriptions', instance.descriptions);
  writeNotNull('BaseHookahPrice', instance.baseHookahPrice);
  writeNotNull('Currency', instance.currency);
  writeNotNull('Seats', instance.seats?.map((e) => e.toJson()).toList());
  writeNotNull(
      'PlaceReviews', instance.placeReviews?.map((e) => e.toJson()).toList());
  writeNotNull('Medias', instance.medias?.map((e) => e.toJson()).toList());
  writeNotNull('HaveReservation', instance.haveReservation);
  writeNotNull('MinimumReservationTime', instance.minimumReservationTime);
  writeNotNull('FranchiseId', instance.franchiseId);
  writeNotNull('Franchise', instance.franchise?.toJson());
  writeNotNull('Flags', instance.flags);
  writeNotNull(
      'SocialMedias', instance.socialMedias?.map((e) => e.toJson()).toList());
  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('ShortDescriptions', instance.shortDescriptions);
  writeNotNull('Description', instance.description);
  writeNotNull('FranchiseName', instance.franchiseName);
  writeNotNull('FranchiseLogo', instance.franchiseLogo);
  writeNotNull('FriendlyUrl', instance.friendlyUrl);
  writeNotNull('LogoPath', instance.logoPath);
  writeNotNull('Address', instance.address?.toJson());
  writeNotNull(
      'BusinessHours', instance.businessHours?.map((e) => e.toJson()).toList());
  writeNotNull('Rating', instance.rating);
  writeNotNull('Media', instance.media?.toJson());
  writeNotNull('PhoneNumber', instance.phoneNumber);
  writeNotNull('Facebook', instance.facebook);
  writeNotNull('HaveMenu', instance.haveMenu);
  writeNotNull('HaveOrders', instance.haveOrders);
  writeNotNull('HaveMana', instance.haveMana);
  return val;
}
