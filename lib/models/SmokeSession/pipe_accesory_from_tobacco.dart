import 'package:openapi/openapi.dart';

class PipeAccesoryFromTobacco {
  static PipeAccesorySimpleDto tobaccoToSimple(TobaccoSimpleDto tobacco) {
    return PipeAccesorySimpleDto(
      id: tobacco.id,
      name: tobacco.name,
      picture: tobacco.picture,
      type: "Tobacco",
      brand: tobacco.brand,
      brandId: tobacco.brandId,
    );
  }

  static TobaccoSimpleDto simpleToTobacco(PipeAccesorySimpleDto simple) {
    return new TobaccoSimpleDto(
      id: simple.id,
      name: simple.name,
      type: simple.type,
      brand: simple.brand,
      brandId: simple.brandId,
    );
  }
}
