import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/models/SmokeSession/smoke_session_meta_data.dart';
import 'package:flutter/material.dart';

class SmokeSession {
  final String sessionId;
  final Hookah hookah;
  final SmokeSessionMetaData metaData;
  final SmokeStatisticDataModel smokeSessionData;
  final StandSettings standSettings;

  SmokeSession(
      {this.sessionId, this.hookah, this.metaData, this.smokeSessionData,this.standSettings, });

  factory SmokeSession.fromJson(Map<String, dynamic> json) {
    var sessionId = json['SessionId'];
    var hookah = Hookah.fromJson(json['Hookah'] as Map<String, dynamic>);
    var metaData =
        SmokeSessionMetaData.fromJson(json["MetaData"] as Map<String, dynamic>);
    var smokeSessionData = SmokeStatisticDataModel.fromJson(
        json['Statistic'] as Map<String, dynamic>);

    var standSetting = StandSettings.fromJson(json["StandSettings"] as Map<String, dynamic>);

    return SmokeSession(
        hookah: hookah,
        metaData: metaData,
        sessionId: sessionId,
        smokeSessionData: smokeSessionData,
        standSettings: standSetting);
  }
}

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

class StandSettings {
  StateSetting blow;
  StateSetting idle;
  StateSetting puf;

  StandSettings.fromJson(Map<String,dynamic> json){
    this.blow = StateSetting.fromJson(json['BlowSettings'] as Map<String,dynamic>);
    this.idle = StateSetting.fromJson(json['IdleSettings'] as Map<String,dynamic>);
    this.puf = StateSetting.fromJson(json['PuffSettings'] as Map<String,dynamic>);
  }

  StandSettings.empty(){
    this.blow = StateSetting.empty();
    this.idle = StateSetting.empty();
    this.puf = StateSetting.empty();
  }
}

class StateSetting {
  HSVColor color;
  int animationId;
  int brightness;
  int speed;

 StateSetting(
      {this.color, this.animationId, this.brightness, this.speed});

  StateSetting.empty(){
     StateSetting(
      color: new HSVColor.fromColor(Colors.white),
      animationId: 0,
      speed: 100,
      brightness: 255,
    );
  }  

  StateSetting.fromJson(Map<String, dynamic> json) {
    this.animationId = json['AnimationId'];
    this.brightness = json['Brightness'];
    this.speed = json['Speed'];
    int rawHue = json['Color']['Hue'];
    int rawSaturation = json['Color']['Saturation'];
    int rawValue = json['Color']['Value'];

    double hue = (rawHue / (255/360));
    double saturation = (rawSaturation / (1/250));
    double value = (rawValue / (255/360));

    this.color = new HSVColor.fromAHSV(1.0, hue, saturation, value);
  }
}
