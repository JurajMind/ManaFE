part of openapi.api;

class InlineResponse200 {
  
  List<BrandGroupDto> tobacco = [];
  
  List<BrandGroupDto> hookah = [];
  
  List<BrandGroupDto> coal = [];
  
  List<BrandGroupDto> heatmanagement = [];
  
  List<BrandGroupDto> tobaccoMix = [];
  
  List<BrandGroupDto> bowl = [];
  InlineResponse200();

  @override
  String toString() {
    return 'InlineResponse200[tobacco=$tobacco, hookah=$hookah, coal=$coal, heatmanagement=$heatmanagement, tobaccoMix=$tobaccoMix, bowl=$bowl, ]';
  }

  InlineResponse200.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    tobacco = BrandGroupDto.listFromJson(json['Tobacco']);
    hookah = BrandGroupDto.listFromJson(json['Hookah']);
    coal = BrandGroupDto.listFromJson(json['Coal']);
    heatmanagement = BrandGroupDto.listFromJson(json['Heatmanagement']);
    tobaccoMix = BrandGroupDto.listFromJson(json['TobaccoMix']);
    bowl = BrandGroupDto.listFromJson(json['Bowl']);
  }

  Map<String, dynamic> toJson() {
    return {
      'Tobacco': tobacco,
      'Hookah': hookah,
      'Coal': coal,
      'Heatmanagement': heatmanagement,
      'TobaccoMix': tobaccoMix,
      'Bowl': bowl
    };
  }

  static List<InlineResponse200> listFromJson(List<dynamic> json) {
    return json == null ? new List<InlineResponse200>() : json.map((value) => new InlineResponse200.fromJson(value)).toList();
  }

  static Map<String, InlineResponse200> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, InlineResponse200>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new InlineResponse200.fromJson(value));
    }
    return map;
  }
}

