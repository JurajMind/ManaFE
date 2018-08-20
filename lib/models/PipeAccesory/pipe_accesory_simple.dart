class PipeAccesorySimple {
  PipeAccesorySimple({this.id, this.name, this.brand, this.type, this.owned});

  factory PipeAccesorySimple.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return new PipeAccesorySimple(
        id: json['Id'],
        name: json['Name'],
        brand: json['Brand'],
        type: json['Type'],
        owned: json['Owned'] == 1);
  }

  int id;

  String name;

  String brand;

  String type;

  bool owned;
}
