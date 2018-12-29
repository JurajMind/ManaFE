import 'package:app/models/PipeAccesory/pipe_accesory.dart';

class BrandGroup {
  BrandGroup({this.id, this.name, this.picture, this.itemCount});

  factory BrandGroup.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return new BrandGroup(
        id: json['Id'],
        name: json['Name'],
        picture: json['Picture'],
        itemCount: json['TypItemCounte']);
  }

  String id;

  String name;

  String picture;

  int itemCount;
}
