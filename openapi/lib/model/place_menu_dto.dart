part of openapi.api;

class PlaceMenuDto {
  
  List<PipeAccesorySimpleDto> accessories = [];
  
  List<TobaccoMixSimpleDto> tobaccoMixes = [];
  
  List<SmartHookahModelsOrderExtraDto> orderExtras = [];
  
  double basePrice = null;
  
  String currency = null;
  
  List<SmartHookahControllersPriceGroupDto> priceGroup = [];
  
  Map<String, Map<String, double>> prices = {};
  PlaceMenuDto();

  @override
  String toString() {
    return 'PlaceMenuDto[accessories=$accessories, tobaccoMixes=$tobaccoMixes, orderExtras=$orderExtras, basePrice=$basePrice, currency=$currency, priceGroup=$priceGroup, prices=$prices, ]';
  }

  PlaceMenuDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    accessories = PipeAccesorySimpleDto.listFromJson(json['Accessories']);
    tobaccoMixes = TobaccoMixSimpleDto.listFromJson(json['TobaccoMixes']);
    orderExtras = SmartHookahModelsOrderExtraDto.listFromJson(json['OrderExtras']);
    basePrice = json['BasePrice'];
    currency = json['Currency'];
    priceGroup = SmartHookahControllersPriceGroupDto.listFromJson(json['PriceGroup']);
    prices = Map.mapFromJson(json['Prices']);
  }

  Map<String, dynamic> toJson() {
    return {
      'Accessories': accessories,
      'TobaccoMixes': tobaccoMixes,
      'OrderExtras': orderExtras,
      'BasePrice': basePrice,
      'Currency': currency,
      'PriceGroup': priceGroup,
      'Prices': prices
    };
  }

  static List<PlaceMenuDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceMenuDto>() : json.map((value) => new PlaceMenuDto.fromJson(value)).toList();
  }

  static Map<String, PlaceMenuDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceMenuDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceMenuDto.fromJson(value));
    }
    return map;
  }
}

