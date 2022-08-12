//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'price_group_items.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PriceGroupItems {
  /// Returns a new [PriceGroupItems] instance.
  PriceGroupItems({

     this.groupId,

     this.price,
  });

  @JsonKey(
    
    name: r'GroupId',
    required: false,
    includeIfNull: false
  )


  int? groupId;



  @JsonKey(
    
    name: r'Price',
    required: false,
    includeIfNull: false
  )


  Map<String, double>? price;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PriceGroupItems &&
     other.groupId == groupId &&
     other.price == price;

  @override
  int get hashCode =>
    groupId.hashCode +
    price.hashCode;

  factory PriceGroupItems.fromJson(Map<String, dynamic> json) => _$PriceGroupItemsFromJson(json);

  Map<String, dynamic> toJson() => _$PriceGroupItemsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

