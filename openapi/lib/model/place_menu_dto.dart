//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlaceMenuDto {
  /// Returns a new [PlaceMenuDto] instance.
  PlaceMenuDto({
    this.accessories = const [],
    this.tobaccoMixes = const [],
    this.orderExtras = const [],
    this.basePrice,
    this.currency,
    this.priceGroup = const [],
    this.prices = const [],
  });

  List<PipeAccesorySimpleDto> accessories;

  List<TobaccoMixSimpleDto> tobaccoMixes;

  List<SmartHookahModelsOrderExtraDto> orderExtras;

  double basePrice;

  String currency;

  List<SmartHookahControllersPriceGroupDto> priceGroup;

  List<PriceGroupItems> prices;

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
    (accessories == null ? 0 : accessories.hashCode) +
    (tobaccoMixes == null ? 0 : tobaccoMixes.hashCode) +
    (orderExtras == null ? 0 : orderExtras.hashCode) +
    (basePrice == null ? 0 : basePrice.hashCode) +
    (currency == null ? 0 : currency.hashCode) +
    (priceGroup == null ? 0 : priceGroup.hashCode) +
    (prices == null ? 0 : prices.hashCode);

  @override
  String toString() => 'PlaceMenuDto[accessories=$accessories, tobaccoMixes=$tobaccoMixes, orderExtras=$orderExtras, basePrice=$basePrice, currency=$currency, priceGroup=$priceGroup, prices=$prices]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (accessories != null) {
      json[r'Accessories'] = accessories;
    }
    if (tobaccoMixes != null) {
      json[r'TobaccoMixes'] = tobaccoMixes;
    }
    if (orderExtras != null) {
      json[r'OrderExtras'] = orderExtras;
    }
    if (basePrice != null) {
      json[r'BasePrice'] = basePrice;
    }
    if (currency != null) {
      json[r'Currency'] = currency;
    }
    if (priceGroup != null) {
      json[r'PriceGroup'] = priceGroup;
    }
    if (prices != null) {
      json[r'Prices'] = prices;
    }
    return json;
  }

  /// Returns a new [PlaceMenuDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlaceMenuDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlaceMenuDto(
        accessories: PipeAccesorySimpleDto.listFromJson(json[r'Accessories']),
        tobaccoMixes: TobaccoMixSimpleDto.listFromJson(json[r'TobaccoMixes']),
        orderExtras: SmartHookahModelsOrderExtraDto.listFromJson(json[r'OrderExtras']),
        basePrice: json[r'BasePrice'],
        currency: json[r'Currency'],
        priceGroup: SmartHookahControllersPriceGroupDto.listFromJson(json[r'PriceGroup']),
        prices: PriceGroupItems.listFromJson(json[r'Prices']),
    );

  static List<PlaceMenuDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlaceMenuDto>[]
      : json.map((v) => PlaceMenuDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlaceMenuDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlaceMenuDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlaceMenuDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlaceMenuDto-objects as value to a dart map
  static Map<String, List<PlaceMenuDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlaceMenuDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlaceMenuDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

