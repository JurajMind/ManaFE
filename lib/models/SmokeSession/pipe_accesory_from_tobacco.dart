import 'package:openapi/api.dart';

class PipeAccesoryFromTobacco {
  static PipeAccesorySimpleDto tobaccoToSimple(TobaccoSimpleDto tobacco) {
    var simple = PipeAccesorySimpleDto();
    simple.id = tobacco.id;
    simple.name = tobacco.name;
    simple.picture = tobacco.picture;
    simple.type = "Tobacco";
    simple.brand = tobacco.brand;
    simple.brandId = tobacco.brandId;
    return simple;
  }

  static TobaccoSimpleDto simpleToTobacco(PipeAccesorySimpleDto simple) {
    var tobacco = new TobaccoSimpleDto();
    tobacco.id = simple.id;
    tobacco.name = simple.name;
    tobacco.type = simple.type;
    tobacco.brand = simple.brand;
    tobacco.brandId = simple.brandId;

    return tobacco;
  }
}
