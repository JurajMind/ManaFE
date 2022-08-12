class BrandGroup {
  BrandGroup({this.id, this.name, this.picture, this.itemCount});

  factory BrandGroup.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return BrandGroup();
    }
    return new BrandGroup(id: json['Id'], name: json['Name'], picture: json['Picture'], itemCount: json['ItemCount']);
  }

  String? id;

  String? name;

  String? picture;

  int? itemCount;
}
