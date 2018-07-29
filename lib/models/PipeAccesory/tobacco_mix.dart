import 'package:app/models/PipeAccesory/tobacco.dart';
import 'package:tuple/tuple.dart';

class TobaccoMix {
  TobaccoMix({this.id, this.name, this.tobaccos});

  int id;
  String name;
  List<Tuple2<Tobacco, int>> tobaccos;

  factory TobaccoMix.fromJson(Map<String, dynamic> json) {
    String name = json['AccName'];
    int id = json['id'];
    final tobaccosListMap = json['Tobaccos'] as List;

    var tobaccos = tobaccosListMap.map((item) {
      Map<String, dynamic> map = item;
      int fraction = map['Fraction'];
      Map<String, dynamic> tobaccoMap = map['Tobacco'];
      Tobacco tobacco = Tobacco.fromJson(tobaccoMap);
      return Tuple2<Tobacco, int>(tobacco, fraction);
    }).toList();

    return new TobaccoMix(name: name, id: id, tobaccos: tobaccos);
  }
}
