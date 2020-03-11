part of openapi.api;

class PlaceMenuDto {
  
  List<PipeAccesorySimpleDto> accessories = [];
  
  List<TobaccoMixSimpleDto> tobaccoMixes = [];
  
  List<SmartHookahModelsOrderExtraDto> orderExtras = [];
  
  double basePrice = null;
  
  String currency = null;
  
  List<SmartHookahControllersPriceGroupDto> priceGroup = [];
  
  List<PriceGroupItems> prices = [];
  PlaceMenuDto();

  @override
  String toString() {
    return 'PlaceMenuDto[accessories=$accessories, tobaccoMixes=$tobaccoMixes, orderExtras=$orderExtras, basePrice=$basePrice, currency=$currency, priceGroup=$priceGroup, prices=$prices, ]';
  }

  PlaceMenuDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Accessories'] == null) {
      accessories = null;
    } else {
      accessories = PipeAccesorySimpleDto.listFromJson(json['Accessories']);
    }
    if (json['TobaccoMixes'] == null) {
      tobaccoMixes = null;
    } else {
      tobaccoMixes = TobaccoMixSimpleDto.listFromJson(json['TobaccoMixes']);
    }
    if (json['OrderExtras'] == null) {
      orderExtras = null;
    } else {
      orderExtras = SmartHookahModelsOrderExtraDto.listFromJson(json['OrderExtras']);
    }
    if (json['BasePrice'] == null) {
      basePrice = null;
    } else {
          basePrice = json['BasePrice'];
    }
    if (json['Currency'] == null) {
      currency = null;
    } else {
          currency = json['Currency'];
    }
    if (json['PriceGroup'] == null) {
      priceGroup = null;
    } else {
      priceGroup = SmartHookahControllersPriceGroupDto.listFromJson(json['PriceGroup']);
    }
    if (json['Prices'] == null) {
      prices = null;
    } else {
      prices = PriceGroupItems.listFromJson(json['Prices']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (accessories != null)
      json['Accessories'] = accessories;
    if (tobaccoMixes != null)
      json['TobaccoMixes'] = tobaccoMixes;
    if (orderExtras != null)
      json['OrderExtras'] = orderExtras;
    if (basePrice != null)
      json['BasePrice'] = basePrice;
    if (currency != null)
      json['Currency'] = currency;
    if (priceGroup != null)
      json['PriceGroup'] = priceGroup;
    if (prices != null)
      json['Prices'] = prices;
    return json;
  }

  static List<PlaceMenuDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceMenuDto>() : json.map((value) => new PlaceMenuDto.fromJson(value)).toList();
  }

  static Map<String, PlaceMenuDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceMenuDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceMenuDto.fromJson(value));
    }
    return map;
  }
}

