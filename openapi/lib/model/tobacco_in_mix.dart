part of openapi.api;

class TobaccoInMix {
  
  TobaccoSimpleDto tobacco = null;
  
  int fraction = null;
  TobaccoInMix();

  @override
  String toString() {
    return 'TobaccoInMix[tobacco=$tobacco, fraction=$fraction, ]';
  }

  TobaccoInMix.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    tobacco = new TobaccoSimpleDto.fromJson(json['Tobacco']);
    fraction = json['Fraction'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Tobacco': tobacco,
      'Fraction': fraction
    };
  }

  static List<TobaccoInMix> listFromJson(List<dynamic> json) {
    return json == null ? new List<TobaccoInMix>() : json.map((value) => new TobaccoInMix.fromJson(value)).toList();
  }

  static Map<String, TobaccoInMix> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, TobaccoInMix>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new TobaccoInMix.fromJson(value));
    }
    return map;
  }
}

