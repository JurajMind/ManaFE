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
    if (json['Tobacco'] == null) {
      tobacco = null;
    } else {
      tobacco = new TobaccoSimpleDto.fromJson(json['Tobacco']);
    }
    if (json['Fraction'] == null) {
      fraction = null;
    } else {
          fraction = json['Fraction'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (tobacco != null)
      json['Tobacco'] = tobacco;
    if (fraction != null)
      json['Fraction'] = fraction;
    return json;
  }

  static List<TobaccoInMix> listFromJson(List<dynamic> json) {
    return json == null ? new List<TobaccoInMix>() : json.map((value) => new TobaccoInMix.fromJson(value)).toList();
  }

  static Map<String, TobaccoInMix> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, TobaccoInMix>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new TobaccoInMix.fromJson(value));
    }
    return map;
  }
}

