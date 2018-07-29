import 'package:app/models/SmokeSession/smoke_session_meta_data.dart';

class SmokeSession{
  String sessionId;
  Hookah hookah;
  SmokeSessionMetaData metaData;
}

class Hookah {
  String name;
  String code;
  bool isOnline;
}