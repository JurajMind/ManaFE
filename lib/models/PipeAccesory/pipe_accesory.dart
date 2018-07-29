class PipeAccesory {
  PipeAccesory(
      {this.id, this.name, this.brand, this.brandId, this.picture, this.type});

  PipeAccesory.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['Name'],
        brand = json['Brand'],
        brandId = json['BrandId'],
        picture = json['Picture'],
        type = json['Type'];

  int id;

  String name;

  String brand;

  String brandId;

  String picture;

  String type;
}
