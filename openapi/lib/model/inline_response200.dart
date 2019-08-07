part of openapi.api;

class InlineResponse200 {
  
  List<BrandGroupDto> bowl = [];
  
  List<BrandGroupDto> tobacco = [];
  
  List<BrandGroupDto> tobaccoMix = [];
  
  List<BrandGroupDto> heatmanagement = [];
  
  List<BrandGroupDto> hookah = [];
  
  List<BrandGroupDto> coal = [];
  InlineResponse200();

  @override
  String toString() {
    return 'InlineResponse200[bowl=$bowl, tobacco=$tobacco, tobaccoMix=$tobaccoMix, heatmanagement=$heatmanagement, hookah=$hookah, coal=$coal, ]';
  }

  InlineResponse200.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Bowl'] == null) {
      bowl = null;
    } else {
      bowl = BrandGroupDto.listFromJson(json['Bowl']);
    }
    if (json['Tobacco'] == null) {
      tobacco = null;
    } else {
      tobacco = BrandGroupDto.listFromJson(json['Tobacco']);
    }
    if (json['TobaccoMix'] == null) {
      tobaccoMix = null;
    } else {
      tobaccoMix = BrandGroupDto.listFromJson(json['TobaccoMix']);
    }
    if (json['Heatmanagement'] == null) {
      heatmanagement = null;
    } else {
      heatmanagement = BrandGroupDto.listFromJson(json['Heatmanagement']);
    }
    if (json['Hookah'] == null) {
      hookah = null;
    } else {
      hookah = BrandGroupDto.listFromJson(json['Hookah']);
    }
    if (json['Coal'] == null) {
      coal = null;
    } else {
      coal = BrandGroupDto.listFromJson(json['Coal']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (bowl != null)
      json['Bowl'] = bowl;
    if (tobacco != null)
      json['Tobacco'] = tobacco;
    if (tobaccoMix != null)
      json['TobaccoMix'] = tobaccoMix;
    if (heatmanagement != null)
      json['Heatmanagement'] = heatmanagement;
    if (hookah != null)
      json['Hookah'] = hookah;
    if (coal != null)
      json['Coal'] = coal;
    return json;
  }

  static List<InlineResponse200> listFromJson(List<dynamic> json) {
    return json == null ? new List<InlineResponse200>() : json.map((value) => new InlineResponse200.fromJson(value)).toList();
  }

  static Map<String, InlineResponse200> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, InlineResponse200>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new InlineResponse200.fromJson(value));
    }
    return map;
  }
}

