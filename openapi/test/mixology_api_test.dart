import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for MixologyApi
void main() {
  final instance = Openapi().getMixologyApi();

  group(MixologyApi, () {
    //Future<TobaccoMixSimpleDto> mixologyAddToMix(TobaccoMixSimpleDto newMix) async
    test('test mixologyAddToMix', () async {
      // TODO
    });

    //Future<List<TobaccoMixSimpleDto>> mixologyGetMiFromTobaccos(List<int> ids, { int pageSize, int page, bool own }) async
    test('test mixologyGetMiFromTobaccos', () async {
      // TODO
    });

    //Future<List<TobaccoMixSimpleDto>> mixologyGetMixes({ int page, int pageSize, String author, String orderBy, String order }) async
    test('test mixologyGetMixes', () async {
      // TODO
    });

    //Future<TobaccoMixSimpleDto> mixologyGetTobaccoMix(int id) async
    test('test mixologyGetTobaccoMix', () async {
      // TODO
    });

    //Future<Map<String, List<TobaccoTasteDto>>> mixologyGetTobaccoMixTastes(int id) async
    test('test mixologyGetTobaccoMixTastes', () async {
      // TODO
    });

    //Future<Dto> mixologyRemoveMix(int mixId) async
    test('test mixologyRemoveMix', () async {
      // TODO
    });

    //Future<TobaccoMixSimpleDto> mixologyRenameMix(int id, String newName) async
    test('test mixologyRenameMix', () async {
      // TODO
    });

    //Future<List<TobaccoSimpleDto>> mixologySuggestMixTobacco(List<int> ids, { int pageSize, int page, bool own }) async
    test('test mixologySuggestMixTobacco', () async {
      // TODO
    });

    //Future<Object> mixologyVote(int id, int value) async
    test('test mixologyVote', () async {
      // TODO
    });

  });
}
