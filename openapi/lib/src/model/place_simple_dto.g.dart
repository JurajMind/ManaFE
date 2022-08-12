// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_simple_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSimpleDto _$PlaceSimpleDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PlaceSimpleDto',
      json,
      ($checkedConvert) {
        final val = PlaceSimpleDto(
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
          franchiseId: $checkedConvert('FranchiseId', (v) => v as int?),
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
          haveReservation:
              $checkedConvert('HaveReservation', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'name': 'Name',
        'shortDescriptions': 'ShortDescriptions',
        'description': 'Description',
        'franchiseId': 'FranchiseId',
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
        'haveMana': 'HaveMana',
        'haveReservation': 'HaveReservation'
      },
    );

Map<String, dynamic> _$PlaceSimpleDtoToJson(PlaceSimpleDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('ShortDescriptions', instance.shortDescriptions);
  writeNotNull('Description', instance.description);
  writeNotNull('FranchiseId', instance.franchiseId);
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
  writeNotNull('HaveReservation', instance.haveReservation);
  return val;
}
