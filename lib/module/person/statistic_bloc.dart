import 'package:app/app/app.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';
import 'package:rxdart/rxdart.dart';

class StatisticBloc {
  static final StatisticBloc _instance = new StatisticBloc._();

  factory StatisticBloc() => StatisticBloc._instance;

  StatisticBloc._() {
    loadStatistic(
        DateTime.now().subtract(new Duration(days: 365)), DateTime.now());
  }

  BehaviorSubject<PersonStatisticsOverallDto> statistic =
      new BehaviorSubject<PersonStatisticsOverallDto>();

  BehaviorSubject<List<StatisticItem>> topGraphData =
      new BehaviorSubject<List<StatisticItem>>();

  BehaviorSubject<StatisticRecap> recap = new BehaviorSubject<StatisticRecap>();

  loadStatistic(DateTime from, DateTime to) async {
    var result = await App.http.getStatistic(from, to);
    this.statistic.add(result);

    var statistic =
        this.getDisplayStatistic(from, to, result.smokeSessions, month: true);
    topGraphData.add(statistic);

    var recap = this.getStatsRecap(result.smokeSessions);
    this.recap.add(recap);
  }

  List<StatisticItem> getDisplayStatistic(
      DateTime from, DateTime to, List<SmokeSessionSimpleDto> statistic,
      {bool month = false}) {
    var result = new List<StatisticItem>();
    var curentDate = from;
    while (curentDate.isBefore(to)) {
      var key = curentDate.toString();

      var thisDaySmokeSession = statistic.where((s) {
        var start = DateTime.fromMillisecondsSinceEpoch(s.statistic.start);
        if (month) {
          return start.month == curentDate.month;
        }
        return start.difference(curentDate).inDays == 0;
      });

      var item = new StatisticItem();
      item.label = key.toString();
      if (thisDaySmokeSession.length > 0) {
        thisDaySmokeSession.forEach((f) {
          item.pufCount = item.pufCount + f.statistic?.pufCount ?? 0;
          item.smoking = item.smoking + f.statistic?.smokeDuration ?? 0;
          item.activity = item.activity + f.statistic?.duration ?? 0;
          item.smokeSessions = item.smokeSessions + 1;
        });
      }
      ;
      result.add(item);
      curentDate = curentDate
          .add(month ? new Duration(days: 31) : new Duration(days: 1));
    }

    return result;
  }

  StatisticRecap getStatsRecap(List<SmokeSessionSimpleDto> sessions) {
    var sessionCollection = Collection(sessions);
    var pufCount =
        sessionCollection.sum$1((selector) => selector.statistic.pufCount);
    var smokingTimeMilis =
        sessionCollection.sum$1((selector) => selector.statistic.smokeDuration);

    var activityMilis =
        sessionCollection.sum$1((selector) => selector.statistic.duration);

    var smokingTime = new Duration(milliseconds: smokingTimeMilis);
    var activityTyme = new Duration(milliseconds: activityMilis);
    return StatisticRecap(
        pufCount: pufCount,
        smokingTime: smokingTime,
        activity: activityTyme,
        sessionCount: sessions.length);
  }
}

class StatisticItem {
  StatisticItem() {
    this.pufCount = 0;
    this.smoking = 0;
    this.activity = 0;
    this.smokeSessions = 0;
  }
  String label;

  int pufCount;

  int smoking;

  int activity;

  int smokeSessions;
}

class StatisticRecap {
  StatisticRecap(
      {this.sessionCount, this.pufCount, this.smokingTime, this.activity});

  int pufCount;

  Duration smokingTime;

  Duration activity;

  int sessionCount;
}
