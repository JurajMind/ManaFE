import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for StatisticsApi
void main() {
  final instance = Openapi().getStatisticsApi();

  group(StatisticsApi, () {
    //Future<PersonStatisticsOverallDto> statisticsGetStatistics(DateTime from, DateTime to) async
    test('test statisticsGetStatistics', () async {
      // TODO
    });

  });
}
