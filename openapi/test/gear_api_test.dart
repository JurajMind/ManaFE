import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for GearApi
void main() {
  final instance = Openapi().getGearApi();

  group(GearApi, () {
    //Future<PipeAccesorySimpleDto> gearAddGear(PipeAccesorySimpleDto accessory) async
    test('test gearAddGear', () async {
      // TODO
    });

    //Future<BrandDto> gearGetBrand(String brandName) async
    test('test gearGetBrand', () async {
      // TODO
    });

    //Future<GearGetBrands200Response> gearGetBrands() async
    test('test gearGetBrands', () async {
      // TODO
    });

    //Future<List<String>> gearGetBrandsPrefix(String prefix) async
    test('test gearGetBrandsPrefix', () async {
      // TODO
    });

    //Future<PipeAccessoryDetailsDto> gearGetDetails(int id) async
    test('test gearGetDetails', () async {
      // TODO
    });

    //Future<PipeAccesorySimpleDto> gearInfo(int id) async
    test('test gearInfo', () async {
      // TODO
    });

    //Future<PipeAccesorySimpleDto> gearMerge(int targetId, int sourceId) async
    test('test gearMerge', () async {
      // TODO
    });

    //Future<List<SearchPipeAccessory>> gearSearch(String search, { String type, int page, int pageSize, String searchType }) async
    test('test gearSearch', () async {
      // TODO
    });

    //Future<List<SmokeSessionSimpleDto>> gearSessions(int id, { int pageSize, int page }) async
    test('test gearSessions', () async {
      // TODO
    });

    //Future<Object> gearVote(int id, int value) async
    test('test gearVote', () async {
      // TODO
    });

  });
}
