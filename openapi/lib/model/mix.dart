part of openapi.api;

class Mix {
  
  int id = null;
  
  String accName = null;
  
  List<TobaccoInMix> tobaccos = [];
  
  int used = null;
  
  double overall = null;
  Mix();

  @override
  String toString() {
    return 'Mix[id=$id, accName=$accName, tobaccos=$tobaccos, used=$used, overall=$overall, ]';
  }

  Mix.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    accName = json['AccName'];
    tobaccos = TobaccoInMix.listFromJson(json['Tobaccos']);
    used = json['Used'];
    overall = json['Overall'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'AccName': accName,
      'Tobaccos': tobaccos,
      'Used': used,
      'Overall': overall
    };
  }

  static List<Mix> listFromJson(List<dynamic> json) {
    return json == null ? new List<Mix>() : json.map((value) => new Mix.fromJson(value)).toList();
  }

  static Map<String, Mix> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Mix>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Mix.fromJson(value));
    }
    return map;
  }
}

