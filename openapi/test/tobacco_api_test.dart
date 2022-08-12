import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for TobaccoApi
void main() {
  final instance = Openapi().getTobaccoApi();

  group(TobaccoApi, () {
    //Future<TobaccoSimpleDto> tobaccoGetTobacco(int id) async
    test('test tobaccoGetTobacco', () async {
      // TODO
    });

    //Future<List<TobaccoMixSimpleDto>> tobaccoGetTobaccoInMixes(int id, { int pageSize, int page }) async
    test('test tobaccoGetTobaccoInMixes', () async {
      // TODO
    });

    //Future<TobaccoInformationDto> tobaccoGetTobaccoInfo(int id) async
    test('test tobaccoGetTobaccoInfo', () async {
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

    //Future<List<TobaccoDto>> tobaccoSearch(int page, int pageSize, { List<int> filterPeriodTastes, int filterPeriodSortBy, String filterPeriodBrand, bool filterPeriodOwned, bool filterPeriodSmoked, int filterPeriodSortDirection }) async
    test('test tobaccoSearch', () async {
      // TODO
    });

  });
}
