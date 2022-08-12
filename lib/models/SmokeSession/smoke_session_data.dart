import 'package:app/Helpers/date_utils.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:intl/intl.dart';
import 'package:openapi/openapi.dart';

class SmokeStatisticDataModel extends SignalData {
  int? pufCount = 0;
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
    smokeDuration = DateUtils.stringToDuration(map['smokeDuration']);

    start = df.parse(map['start']).add(new Duration(hours: 2));

    duration = DateUtils.stringToDuration(map['duration']);

    longestPuf = new Duration(milliseconds: map['longestPufMilis'].round());
  }

  SmokeStatisticDataModel.fromJson(Map<String, dynamic> json) : super(null) {
    try {
      pufCount = json['PufCount'];
      var parsed = DynamicSmokeStatisticRawDto.fromJson(json);
      longestPuf = new Duration(milliseconds: parsed.longestPufMilis!);
      lastPuf = parsed.lastPuf! / 10000000;
      duration = new Duration(milliseconds: parsed.duration!);
      smokeDuration = new Duration(milliseconds: parsed.smokeDuration!);
      start = DateTime.fromMillisecondsSinceEpoch(parsed.start!);
    } catch (e) {}
  }
}
