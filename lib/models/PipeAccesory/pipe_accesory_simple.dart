import 'package:app/models/PipeAccesory/pipe_accesory.dart';

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

  factory PipeAccesorySimple.fromAccesory(PipeAccesory accesory) {
    return new PipeAccesorySimple(
        id: accesory.id,
        name: accesory.name,
        brand: accesory.name,
        type: accesory.type,
        owned: true);
  }

  int id;

  String name;

  String brand;

  String type;

  bool owned;
}
