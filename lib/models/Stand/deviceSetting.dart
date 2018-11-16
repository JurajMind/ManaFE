import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StandSettings {
  StateSetting blow;
  StateSetting idle;
  StateSetting puf;

  StandSettings.empty() {
    this.blow = StateSetting.empty();
    this.idle = StateSetting.empty();
    this.puf = StateSetting.empty();
  }

  StandSettings.fromJson(Map<String, dynamic> json) {
    this.blow =
        StateSetting.fromJson(json['BlowSettings'] as Map<String, dynamic>);
    this.idle =
        StateSetting.fromJson(json['IdleSettings'] as Map<String, dynamic>);
    this.puf =
        StateSetting.fromJson(json['PuffSettings'] as Map<String, dynamic>);
  }

  StateSetting getStateSetting(SmokeState state) {
    switch (state) {
      case SmokeState.blow:
        return this.blow;
      case SmokeState.idle:
        return this.idle;
      case SmokeState.puf:
        return this.puf;
    }
    return null;
  }

  void setStateSetting(SmokeState state, StateSetting stateSetting) {
    switch (state) {
      case SmokeState.blow:
        this.blow = stateSetting;
        break;
      case SmokeState.idle:
        this.idle = stateSetting;
        break;
      case SmokeState.puf:
        this.puf = stateSetting;
        break;
    }
  }
}

class StateSetting {
  HSVColor color;
  int animationId;
  int brightness;
  int speed;

  StateSetting({this.color, this.animationId, this.brightness, this.speed});

  StateSetting.empty() {
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

    double hue = (rawHue / (255 / 360));
    double saturation = (rawSaturation / 255);
    double value = (rawValue / 255);

    this.color = new HSVColor.fromAHSV(1.0, hue, saturation, value);
  }
}
