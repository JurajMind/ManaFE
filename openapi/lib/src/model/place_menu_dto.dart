//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/smart_hookah_models_order_extra_dto.dart';
import 'package:openapi/src/model/tobacco_mix_simple_dto.dart';
import 'package:openapi/src/model/price_group_items.dart';
import 'package:openapi/src/model/pipe_accesory_simple_dto.dart';
import 'package:openapi/src/model/smart_hookah_controllers_price_group_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_menu_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlaceMenuDto {
  /// Returns a new [PlaceMenuDto] instance.
  PlaceMenuDto({

     this.accessories,

     this.tobaccoMixes,

     this.orderExtras,

     this.basePrice,

     this.currency,

     this.priceGroup,

     this.prices,
  });

  @JsonKey(
    
    name: r'Accessories',
    required: false,
    includeIfNull: false
  )


  List<PipeAccesorySimpleDto>? accessories;



  @JsonKey(
    
    name: r'TobaccoMixes',
    required: false,
    includeIfNull: false
  )


  List<TobaccoMixSimpleDto>? tobaccoMixes;



  @JsonKey(
    
    name: r'OrderExtras',
    required: false,
    includeIfNull: false
  )


  List<SmartHookahModelsOrderExtraDto>? orderExtras;



  @JsonKey(
    
    name: r'BasePrice',
    required: false,
    includeIfNull: false
  )


  double? basePrice;



  @JsonKey(
    
    name: r'Currency',
    required: false,
    includeIfNull: false
  )


  String? currency;



  @JsonKey(
    
    name: r'PriceGroup',
    required: false,
    includeIfNull: false
  )


  List<SmartHookahControllersPriceGroupDto>? priceGroup;



  @JsonKey(
    
    name: r'Prices',
    required: false,
    includeIfNull: false
  )


  List<PriceGroupItems>? prices;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaceMenuDto &&
     other.accessories == accessories &&
     other.tobaccoMixes == tobaccoMixes &&
     other.orderExtras == orderExtras &&
     other.basePrice == basePrice &&
     other.currency == currency &&
     other.priceGroup == priceGroup &&
     other.prices == prices;

  @override
  int get hashCode =>
    accessories.hashCode +
    tobaccoMixes.hashCode +
    orderExtras.hashCode +
    basePrice.hashCode +
    currency.hashCode +
    priceGroup.hashCode +
    prices.hashCode;

  factory PlaceMenuDto.fromJson(Map<String, dynamic> json) => _$PlaceMenuDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceMenuDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

