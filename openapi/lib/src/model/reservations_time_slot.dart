//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'reservations_time_slot.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReservationsTimeSlot {
  /// Returns a new [ReservationsTimeSlot] instance.
  ReservationsTimeSlot({

     this.value,

     this.text,

     this.reserved,

     this.capacityLeft,

     this.tablesLeft,

     this.maxTable,

     this.id,

     this.orderIndex,
  });

  @JsonKey(
    
    name: r'Value',
    required: false,
    includeIfNull: false
  )


  int? value;



  @JsonKey(
    
    name: r'Text',
    required: false,
    includeIfNull: false
  )


  String? text;



  @JsonKey(
    
    name: r'Reserved',
    required: false,
    includeIfNull: false
  )


  bool? reserved;



  @JsonKey(
    
    name: r'CapacityLeft',
    required: false,
    includeIfNull: false
  )


  int? capacityLeft;



  @JsonKey(
    
    name: r'TablesLeft',
    required: false,
    includeIfNull: false
  )


  int? tablesLeft;



  @JsonKey(
    
    name: r'MaxTable',
    required: false,
    includeIfNull: false
  )


  int? maxTable;



  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'OrderIndex',
    required: false,
    includeIfNull: false
  )


  int? orderIndex;



  @override
  bool operator ==(Object other) => identical(this, other) || other is ReservationsTimeSlot &&
     other.value == value &&
     other.text == text &&
     other.reserved == reserved &&
     other.capacityLeft == capacityLeft &&
     other.tablesLeft == tablesLeft &&
     other.maxTable == maxTable &&
     other.id == id &&
     other.orderIndex == orderIndex;

  @override
  int get hashCode =>
    value.hashCode +
    text.hashCode +
    reserved.hashCode +
    capacityLeft.hashCode +
    tablesLeft.hashCode +
    maxTable.hashCode +
    id.hashCode +
    orderIndex.hashCode;

  factory ReservationsTimeSlot.fromJson(Map<String, dynamic> json) => _$ReservationsTimeSlotFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationsTimeSlotToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

