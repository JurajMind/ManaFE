import 'package:openapi/api.dart';
import 'package:test/test.dart';


/// tests for TobaccoApi
void main() {
  var instance = new TobaccoApi();

  group('tests for TobaccoApi', () {
    //Future<TobaccoSimpleDto> tobaccoGetTobacco(int id) async 
    test('test tobaccoGetTobacco', () async {
      // TODO
    });

    //Future<TobaccoInformationDto> tobaccoGetTobaccoInfo(int id) async 
    test('test tobaccoGetTobaccoInfo', () async {
      // TODO
    });

    //Future<List<TobaccoReviewDto>> tobaccoGetTobaccoReviews(int id, { int pageSize, int page }) async 
    test('test tobaccoGetTobaccoReviews', () async {
      // TODO
    });

    //Future<PipeAccessoryStatisticsDto> tobaccoGetTobaccoSatistics(int id) async 
    test('test tobaccoGetTobaccoSatistics', () async {
      // TODO
    });

    //Future<List<SmokeSessionSimpleDto>> tobaccoGetTobaccoSessions(int id, { int pageSize, int page }) async 
    test('test tobaccoGetTobaccoSessions', () async {
      // TODO
    });

    //Future<List<TobaccoTasteDto>> tobaccoGetTobaccoTaste(int id) async 
    test('test tobaccoGetTobaccoTaste', () async {
      // TODO
    });

    //Future<List<TobaccoDto>> tobaccoSearch(int page, int pageSize, { List<int> filterTastes, int filterSortBy, String filterBrand, bool filterOwned, bool filterSmoked, int filterSortDirection }) async 
    test('test tobaccoSearch', () async {
      // TODO
    });

  });
}
