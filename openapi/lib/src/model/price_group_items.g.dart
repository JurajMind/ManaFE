// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_group_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceGroupItems _$PriceGroupItemsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PriceGroupItems',
      json,
      ($checkedConvert) {
        final val = PriceGroupItems(
          groupId: $checkedConvert('GroupId', (v) => v as int?),
          price: $checkedConvert(
              'Price',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, (e as num).toDouble()),
                  )),
        );
        return val;
      },
      fieldKeyMap: const {'groupId': 'GroupId', 'price': 'Price'},
    );

Map<String, dynamic> _$PriceGroupItemsToJson(PriceGroupItems instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupId', instance.groupId);
  writeNotNull('Price', instance.price);
  return val;
}
