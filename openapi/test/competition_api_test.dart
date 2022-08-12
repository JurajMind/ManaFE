import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CompetitionApi
void main() {
  final instance = Openapi().getCompetitionApi();

  group(CompetitionApi, () {
    //Future<bool> competitionAddEntry(String name, double time) async
    test('test competitionAddEntry', () async {
      // TODO
    });

    //Future<bool> competitionClean() async
    test('test competitionClean', () async {
      // TODO
    });

    //Future<List<SmartHookahModelsRedisCompetitionEntry>> competitionGetResults() async
    test('test competitionGetResults', () async {
      // TODO
    });

  });
}
