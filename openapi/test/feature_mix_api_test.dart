import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for FeatureMixApi
void main() {
  final instance = Openapi().getFeatureMixApi();

  group(FeatureMixApi, () {
    //Future featureMixAddFollow(int id) async
    test('test featureMixAddFollow', () async {
      // TODO
    });

    //Future featureMixFix() async
    test('test featureMixFix', () async {
      // TODO
    });

    //Future<FeatureMixCreatorDto> featureMixGetFeatureMixCreator(int id) async
    test('test featureMixGetFeatureMixCreator', () async {
      // TODO
    });

    //Future<List<FeatureMixCreatorSimpleDto>> featureMixGetFeatureMixCreators({ int page, int pageSize, String orderBy, String order }) async
    test('test featureMixGetFeatureMixCreators', () async {
      // TODO
    });

    //Future<List<FeatureMixCreatorSimpleDto>> featureMixGetFollowedCreators() async
    test('test featureMixGetFollowedCreators', () async {
      // TODO
    });

    //Future<List<TobaccoMixSimpleDto>> featureMixGetMixes(int id, int page, int pageSize, String orderBy, String order) async
    test('test featureMixGetMixes', () async {
      // TODO
    });

    //Future featureMixRemoveFollow(int id) async
    test('test featureMixRemoveFollow', () async {
      // TODO
    });

  });
}
