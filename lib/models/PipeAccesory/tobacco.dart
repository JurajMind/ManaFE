import 'package:app/models/PipeAccesory/pipe_accesory.dart';

class Tobacco extends PipeAccesory {
  Tobacco(PipeAccesory ac) {
    this.id = ac.id;
    this.name = ac.name;
    this.brand = ac.brand;
    this.brandId = ac.brandId;
    this.picture = ac.picture;
    this.type = "Tobacco";
  }

  factory Tobacco.fromJson(Map<String, dynamic> json) {
    var pipeAccespry = PipeAccesory.fromJson(json);
    var result = Tobacco(pipeAccespry);
    return result;
  }
}
