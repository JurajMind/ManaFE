import 'package:app/app/app.dart';
import 'package:openapi/api.dart';
import 'package:darq/darq.dart';
import 'package:rxdart/rxdart.dart';

class StatisticBloc {
  static final StatisticBloc _instance = new StatisticBloc._();

  factory StatisticBloc() => StatisticBloc._instance;

  StatisticBloc._() {
    var now = DateTime.now();
    loadStatistic(now.subtract(new Duration(days: 30)), DateTime.now());
  }

  DateTime from;
  DateTime to;

  BehaviorSubject<PersonStatisticsOverallDto> statistic = new BehaviorSubject<PersonStatisticsOverallDto>();

  BehaviorSubject<List<StatisticItem>> topGraphData = new BehaviorSubject<List<StatisticItem>>();

  BehaviorSubject<List<SmokeSessionSimpleDto>> smokeSessions = new BehaviorSubject<List<SmokeSessionSimpleDto>>();

  BehaviorSubject<List<PipeAccessoryUsageDto>> gearUsage = new BehaviorSubject<List<PipeAccessoryUsageDto>>();

  BehaviorSubject<StatisticRecap> recap = new BehaviorSubject<StatisticRecap>();

  Future loadStatistic(DateTime from, DateTime to) async {
    this.from = from;
    this.to = to;
    var result = await App.http.getStatistic(from, to);
    this.statistic.add(result);
    var month = false;
    if (to.difference(from).inDays > 60) {
      month = true;
    }

    var statistic = this.getDisplayStatistic(from, to, result.smokeSessions, month: month);
    topGraphData.add(statistic);

    var recap = this.getStatsRecap(result.smokeSessions);
    this.recap.add(recap);
    this.smokeSessions.add(result.smokeSessions);
    this.gearUsage.add(result.accessoriesUsage);
  }

  List<StatisticItem> getDisplayStatistic(DateTime from, DateTime to, List<SmokeSessionSimpleDto> statistic,
      {bool month = false}) {
    var result = new List<StatisticItem>();
    var curentDate = from;
    while (curentDate.isBefore(to)) {
      var key = curentDate.toString();

      var thisDaySmokeSession = statistic.where((s) {
        var start = DateTime.fromMillisecondsSinceEpoch(s.statistic.start);
        if (month) {
          return start.month == curentDate.month && start.year == curentDate.year;
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
      result.add(item);
      curentDate = curentDate.add(month ? new Duration(days: 31) : new Duration(days: 1));
    }

    return result;
  }

  StatisticRecap getStatsRecap(List<SmokeSessionSimpleDto> sessions) {
    var sessionCollection = List.from(sessions);
    var pufCount = sessionCollection.sum<int>((selector) => selector.statistic.pufCount) ?? 0;
    var smokingTimeMilis = sessionCollection.sum<int>((selector) => selector.statistic.smokeDuration) ?? 0;

    var activityMilis = sessionCollection.sum<int>((selector) => selector.statistic.duration) ?? 0;

    var smokingTime = new Duration(milliseconds: smokingTimeMilis);
    var activityTyme = new Duration(milliseconds: activityMilis);
    return StatisticRecap(
        pufCount: pufCount, smokingTime: smokingTime, activity: activityTyme, sessionCount: sessions.length);
  }

  Future<bool> unAssignSession(int id) async {
    var session = this.smokeSessions.value;
    session.removeWhere((a) => a.id == id);
    this.smokeSessions.add(session);

    await App.http.unAssignSession(id);
    this.loadStatistic(from, to);
    return true;
  }

  Future<bool> assignSession(int id) async {
    var session = await App.http.assignSession(id);
    var sessions = this.smokeSessions.value;
    sessions.add(session);
    this.smokeSessions.add(sessions);

    await App.http.assignSession(id);
    this.loadStatistic(from, to);
    return true;
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
  StatisticRecap({this.sessionCount, this.pufCount, this.smokingTime, this.activity});

  int pufCount;

  Duration smokingTime;

  Duration activity;

  int sessionCount;
}
