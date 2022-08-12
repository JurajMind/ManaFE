//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_models_order_extra_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahModelsOrderExtraDto {
  /// Returns a new [SmartHookahModelsOrderExtraDto] instance.
  SmartHookahModelsOrderExtraDto({

     this.id,

     this.currency,

     this.price,

     this.name,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Currency',
    required: false,
    includeIfNull: false
  )


  String? currency;



  @JsonKey(
    
    name: r'Price',
    required: false,
    includeIfNull: false
  )


  double? price;



  @JsonKey(
    
    name: r'Name',
    required: false,
    includeIfNull: false
  )


  String? name;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsOrderExtraDto &&
     other.id == id &&
     other.currency == currency &&
     other.price == price &&
     other.name == name;

  @override
  int get hashCode =>
    id.hashCode +
    currency.hashCode +
    price.hashCode +
    name.hashCode;

  factory SmartHookahModelsOrderExtraDto.fromJson(Map<String, dynamic> json) => _$SmartHookahModelsOrderExtraDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahModelsOrderExtraDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

