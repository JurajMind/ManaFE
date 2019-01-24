import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/models/SmokeSession/smoke_session_meta_data.dart';

class Hookah {
  String name;
  String code;
  bool isOnline;

  Hookah({this.name, this.code, this.isOnline});

  Hookah.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        code = json['Code'],
        isOnline = json['IsOnline'];
}

class SmokeSession {
  final String sessionId;
  final Hookah hookah;
  final SmokeSessionMetaData metaData;
  final SmokeStatisticDataModel smokeSessionData;
  SmokeSession(
      {this.sessionId, this.hookah, this.metaData, this.smokeSessionData});

  factory SmokeSession.fromJson(Map<String, dynamic> json) {
    var sessionId = json['SessionId'];
    var hookah = Hookah.fromJson(json['Device'] as Map<String, dynamic>);
    var metaData =
        SmokeSessionMetaData.fromJson(json["MetaData"] as Map<String, dynamic>);
    var smokeSessionData = SmokeStatisticDataModel.fromJson(
        json['Statistic'] as Map<String, dynamic>);

    return SmokeSession(
      hookah: hookah,
      metaData: metaData,
      sessionId: sessionId,
      smokeSessionData: smokeSessionData,
    );
  }
}

enum SmokeState { idle, puf, blow }
