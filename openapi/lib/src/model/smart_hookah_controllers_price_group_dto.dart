//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_controllers_price_group_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahControllersPriceGroupDto {
  /// Returns a new [SmartHookahControllersPriceGroupDto] instance.
  SmartHookahControllersPriceGroupDto({

     this.id,

     this.name,

     this.price,
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
    
    name: r'Price',
    required: false,
    includeIfNull: false
  )


  double? price;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahControllersPriceGroupDto &&
     other.id == id &&
     other.name == name &&
     other.price == price;

  @override
  int get hashCode =>
    id.hashCode +
    name.hashCode +
    price.hashCode;

  factory SmartHookahControllersPriceGroupDto.fromJson(Map<String, dynamic> json) => _$SmartHookahControllersPriceGroupDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahControllersPriceGroupDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

