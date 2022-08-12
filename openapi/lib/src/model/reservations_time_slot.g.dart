// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservations_time_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationsTimeSlot _$ReservationsTimeSlotFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ReservationsTimeSlot',
      json,
      ($checkedConvert) {
        final val = ReservationsTimeSlot(
          value: $checkedConvert('Value', (v) => v as int?),
          text: $checkedConvert('Text', (v) => v as String?),
          reserved: $checkedConvert('Reserved', (v) => v as bool?),
          capacityLeft: $checkedConvert('CapacityLeft', (v) => v as int?),
          tablesLeft: $checkedConvert('TablesLeft', (v) => v as int?),
          maxTable: $checkedConvert('MaxTable', (v) => v as int?),
          id: $checkedConvert('Id', (v) => v as int?),
          orderIndex: $checkedConvert('OrderIndex', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'value': 'Value',
        'text': 'Text',
        'reserved': 'Reserved',
        'capacityLeft': 'CapacityLeft',
        'tablesLeft': 'TablesLeft',
        'maxTable': 'MaxTable',
        'id': 'Id',
        'orderIndex': 'OrderIndex'
      },
    );

Map<String, dynamic> _$ReservationsTimeSlotToJson(
    ReservationsTimeSlot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Value', instance.value);
  writeNotNull('Text', instance.text);
  writeNotNull('Reserved', instance.reserved);
  writeNotNull('CapacityLeft', instance.capacityLeft);
  writeNotNull('TablesLeft', instance.tablesLeft);
  writeNotNull('MaxTable', instance.maxTable);
  writeNotNull('Id', instance.id);
  writeNotNull('OrderIndex', instance.orderIndex);
  return val;
}
