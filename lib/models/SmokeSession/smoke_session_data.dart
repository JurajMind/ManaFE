import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:intl/intl.dart';

class SmokeStatisticDataModel extends SignalData {
  int pufCount = 0;
  double lastPuf = 0.0;
  DateTime lastPufTime = DateTime(2018);
  Duration smokeDuration = new Duration();
  DateTime start = DateTime(2018);
  Duration duration = new Duration();
  Duration longestPuf = new Duration();

  SmokeStatisticDataModel() : super(null);

  SmokeStatisticDataModel.fromSignal(List data) : super(data) {
    if (data[0].length < 1) {
      return;
    }
    var map = data[0] as Map;

    pufCount = map['pufCount'];
    final DateFormat df = new DateFormat('dd-MM-yyyy HH:mm:ss');
    lastPuf = double.parse(map['lastPuf']);
    lastPufTime = df.parse(map['lastPufTime']);
    smokeDuration = stringToDuration(map['smokeDuration']);

    start = df.parse(map['start']);

    duration = stringToDuration(map['duration']);

    longestPuf = new Duration(microseconds: map['longestPufMilis'].round());
  }

  SmokeStatisticDataModel.fromJson(Map<String, dynamic> json) : super(null) {
    try {
      pufCount = json['PufCount'];

      if(json['LastPuf'] == null) return;
            
      final DateFormat df = new DateFormat('dd-MM-yyyy HH:mm:ss');
      lastPuf = double.parse(json['LastPuf']);
      lastPufTime = df.parse(json['LastPufTime']);
      smokeDuration = stringToDuration(json['SmokeDuration']);

      start = df.parse(json['Start']);

      duration = stringToDuration(json['Duration']);

      longestPuf = new Duration(microseconds: json['LongestPufMilis'].round());
    } catch (e) {}
  }
}
