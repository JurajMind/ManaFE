class PipeAccesory {
  PipeAccesory(
      {this.id, this.name, this.brand, this.brandId, this.picture, this.type});

  factory PipeAccesory.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return new PipeAccesory(
        id: json['Id'],
        name: json['Name'],
        brand: json['Brand'],
        brandId: json['BrandId'],
        picture: json['Picture'],
        type: json['Type']);
  }

  int id;

  String name;

  String brand;

  String brandId;

  String picture;

  String type;

  String get fullName {
    return "$brand $name";
  }
}
