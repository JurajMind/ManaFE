// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'AddressDto',
      json,
      ($checkedConvert) {
        final val = AddressDto(
          id: $checkedConvert('Id', (v) => v as int?),
          street: $checkedConvert('Street', (v) => v as String?),
          city: $checkedConvert('City', (v) => v as String?),
          number: $checkedConvert('Number', (v) => v as String?),
          ZIP: $checkedConvert('ZIP', (v) => v as String?),
          lat: $checkedConvert('Lat', (v) => v as String?),
          lng: $checkedConvert('Lng', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'street': 'Street',
        'city': 'City',
        'number': 'Number',
        'lat': 'Lat',
        'lng': 'Lng'
      },
    );

Map<String, dynamic> _$AddressDtoToJson(AddressDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Street', instance.street);
  writeNotNull('City', instance.city);
  writeNotNull('Number', instance.number);
  writeNotNull('ZIP', instance.ZIP);
  writeNotNull('Lat', instance.lat);
  writeNotNull('Lng', instance.lng);
  return val;
}
