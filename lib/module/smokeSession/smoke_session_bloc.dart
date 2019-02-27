import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/models/SignalR/device_online.dart';
import 'package:app/models/SignalR/signal_r_models.dart';
import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/models/SmokeSession/tobacco_edit_model.dart';
import 'package:app/models/Stand/animation.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/models/Stand/preset.dart';
import 'package:app/pages/home.page.dart';
import 'package:app/services/signal_r.dart';
import 'package:app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';
import 'package:vibrate/vibrate.dart';

class SmokeSessionBloc {
  String hookahCode;

  bool metaDataChanged = false;

  Sink get test => _indexController.sink;
  final _indexController = PublishSubject();
  String activeSessionId;

  final SignalR signalR = new SignalR();

  void testChannel(String msg) {
    signalR.connect();
  }

  static final SmokeSessionBloc _instance = new SmokeSessionBloc._();

  factory SmokeSessionBloc() => SmokeSessionBloc._instance;

  BehaviorSubject<int> smokeState = new BehaviorSubject<int>.seeded(0);
  BehaviorSubject<SmokeStatisticDataModel> smokeStatistic =
      new BehaviorSubject<SmokeStatisticDataModel>();

  Observable<int> get smokeStateBroadcast {
    return this.smokeState.asBroadcastStream();
  }

  BehaviorSubject<List<String>> recentSessions =
      new BehaviorSubject<List<String>>.seeded(new List<String>());

  BehaviorSubject<SmokeSessionMetaDataDto> smokeSessionMetaData =
      new BehaviorSubject<SmokeSessionMetaDataDto>
      .seeded(new SmokeSessionMetaDataDto());

  BehaviorSubject<StandSettings> standSettings =
      new BehaviorSubject<StandSettings>.seeded(new StandSettings.empty());

  BehaviorSubject<List<StandAnimation>> animations =
      new BehaviorSubject<List<StandAnimation>>
      .seeded(new List<StandAnimation>());

  BehaviorSubject<List<Color>> sessionColor =
      new BehaviorSubject<List<Color>>();

  PublishSubject<Tuple2<StandSettings, SmokeState>> futureSettings =
      new PublishSubject<Tuple2<StandSettings, SmokeState>>();

  Observable<Tuple2<StandSettings, SmokeState>> futureSettingDebounce;

  BehaviorSubject<List<DevicePreset>> devicePresets =
      new BehaviorSubject<List<DevicePreset>>.seeded(new List<DevicePreset>());

  BehaviorSubject<DevicePreset> selectedPreset =
      new BehaviorSubject<DevicePreset>.seeded(DevicePreset.empty());

  PublishSubject<DevicePreset> futureDevicePreset =
      new PublishSubject<DevicePreset>();
  Observable<DevicePreset> futureDevicePresetDebounce;

  setColor(Color color) async {
    sessionColor.add([color, ColorHelper.getOpositeColor(color)]);
    await App.http.changeColor(this.hookahCode, new HSVColor.fromColor(color));
    Vibrate.feedback(FeedbackType.medium);
  }

  setAnimation(int animationIndex, SmokeState smokeState) {
    var curentSetting = standSettings.value;
    var editSetting = curentSetting.getStateSetting(smokeState);
    if (editSetting.animationId == animationIndex) return;

    editSetting.animationId = animationIndex;
    curentSetting.setStateSetting(smokeState, editSetting);
    futureSettings.add(new Tuple2(curentSetting, smokeState));
  }

  setBrigtness(int brigtness, SmokeState smokeState) async {
    var curentSetting = standSettings.value;
    var editSetting = curentSetting.getStateSetting(smokeState);
    if (editSetting.brightness == brigtness) return;

    await App.http.changeBrightness(brigtness, smokeState, hookahCode);

    editSetting.brightness = brigtness;
    curentSetting.setStateSetting(smokeState, editSetting);
    futureSettings.add(new Tuple2(curentSetting, smokeState));
    Vibrate.feedback(FeedbackType.medium);
  }

  setSpeed(int speed, SmokeState smokeState) async {
    var curentSetting = standSettings.value;
    var editSetting = curentSetting.getStateSetting(smokeState);
    if (editSetting.brightness == speed) return;

    await App.http.changeSpeed(speed, smokeState, hookahCode);

    editSetting.speed = speed;
    curentSetting.setStateSetting(smokeState, editSetting);
    futureSettings.add(new Tuple2(curentSetting, smokeState));
    Vibrate.feedback(FeedbackType.medium);
  }

  _futureSetAnimation(Tuple2<StandSettings, SmokeState> data) async {
    var animationId = data.item1.getStateSetting(data.item2).animationId;
    await App.http.changeAnimation(animationId, data.item2, hookahCode);
    standSettings.add(data.item1);

    Vibrate.feedback(FeedbackType.light);
  }

  Future joinSession(String sessionCode) async {
    if (sessionCode == null) {
      sessionCode = this.activeSessionId;
    }

    if (this.activeSessionId == sessionCode) {
      await loadSessionData();
    } else {
      if (this.activeSessionId != null) {
        await _leaveOldSession(this.activeSessionId);
      }

      this.activeSessionId = sessionCode;
    }

    await _joinSession(sessionCode);
  }

  Future rejoinSession() async {
    if (this.activeSessionId != null) {
      await _joinSession(this.activeSessionId);
    }
  }

  Future _joinSession(String sessionCode) async {
    List<String> params = new List<String>();
    params.add(sessionCode);
    this.signalR.callServerFunction(name: 'JoinSession', params: params);
    var list = new List<String>.from(recentSessions.value);
    list.add(sessionCode);
    //recentSessions.add(list);
    await loadSessionData();
  }

  Future loadSessionData() async {
    var sessionData = await App.http.getInitData(this.activeSessionId);
    standSettings.add(sessionData.item2);
    smokeStatistic.add(sessionData.item1.smokeSessionData);
    smokeSessionMetaData.add(sessionData.item1.metaData);
    hookahCode = sessionData.item1.hookah.code;
    if (animations.value == null) {
      animations
          .add(await App.http.getAnimations(sessionData.item1.hookah.code));
    }
  }

  loadAnimation() async {
    var list = await App.http.getAnimations(hookahCode);
    animations.add(list);
  }

  setTobacco(TobaccoEditModel setModel) {
    metaDataChanged = true;
    var selection = this.smokeSessionMetaData.value;
    if (setModel.mix == null) {
      selection.tobacco = setModel.tobacco;
      selection.tobaccoWeight = setModel.weight.toDouble();
    } else {
      selection.tobaccoMix = setModel.mix;
      selection.tobacco = null;
    }

    this.smokeSessionMetaData.add(selection);
    saveMetaData();
  }

  setMetadataAccesory(PipeAccesorySimpleDto accesory, String type) {
    metaDataChanged = true;
    var selection = this.smokeSessionMetaData.value;
    switch (type) {
      case 'Hookah':
        selection.pipe = accesory;
        selection.pipeId = accesory.id;
        break;

      case 'Bowl':
        selection.bowl = accesory;
        selection.bowlId = accesory.id;
        break;

      case 'heatmanagement':
        selection.heatManagement = accesory;
        selection.heatManagementId = accesory.id;
        break;

      case 'coal':
        selection.coal = accesory;
        selection.coalId = accesory.id;
        break;
    }

    this.smokeSessionMetaData.add(selection);
  }

  saveMetaData() async {
    if (!metaDataChanged) return;
    var metadataOld = smokeSessionMetaData.value;

    var newMetadata = await App.http
        .postMetadata(this.activeSessionId, smokeSessionMetaData.value);
    // this.smokeSessionMetaData.add(newMetadata);
    if (newMetadata.tobaccoMix?.id != metadataOld.tobaccoMix?.id) {
      metadataOld.tobaccoMix.id = newMetadata.tobaccoMix?.id;
      this.smokeSessionMetaData.add(metadataOld);
    }
    //this.smokeSessionMetaData.add(newMetadata);
    metaDataChanged = false;
  }

  SmokeSessionBloc._() {
    _indexController.stream
        // Don't try to update too frequently.
        .bufferTime(Duration(milliseconds: 500))
        // Don't update when there is no need.
        .where((batch) => batch.isNotEmpty)
        .listen(_handleIndexes);
    signalR.clientCalls.listen((onData) {
      proceddCalls(onData);
    });

    futureSettingDebounce =
        futureSettings.debounce(Duration(milliseconds: 800));
    futureSettingDebounce.listen((onData) => _futureSetAnimation(onData));

    futureDevicePresetDebounce =
        futureDevicePreset.debounce(Duration(milliseconds: 800));
    futureDevicePresetDebounce.listen((onData) => _futureSetPreset(onData));
  }

  proceddCalls(ClientCall onData) {
    if (onData.Data == null) return;

    onData.Data.forEach((f) {
      switch (f.Method) {
        case 'pufChange':
          {
            handlePufChange(f);
            break;
          }
        case 'updateStats':
          {
            handleUpdateStats(f);
            break;
          }
        case 'deviceOnline':
          {
            handleDeviceOnline(f);
            break;
          }
        case 'reconect':
          {
            rejoinSession();
            this.loadSessionData();
            break;
          }
      }
    });
  }

  void _handleIndexes(dynamic indexes) {
    print('click');
  }

  void handlePufChange(ClientMethod f) {
    var data = new PuffChangeDataModel(f.Data);
    smokeState.add(data.state);
  }

  void handleUpdateStats(ClientMethod f) {
    var data = new SmokeStatisticDataModel.fromSignal(f.Data);
    smokeStatistic.add(data);
  }

  void handleDeviceOnline(ClientMethod f) {
    var data = new DeviceOnline.fromSignal(f.Data);
    final snackBar = SnackBar(
      content: Text('${data.deviceName} come online'),
      action: SnackBarAction(
        label: 'TO SESSION',
        onPressed: () => {},
        // onPressed: () => navigatorKey.currentState
        //        .push(new MaterialPageRoute(builder: (BuildContext context) {
        //      return new SmokeSessionPage(sessionId: data.sessionCode);
        //    })),
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  loadPresets() async {
    var presets = await App.http.getDevicePresets();
    devicePresets.add(presets);
  }

  Future _futureSetPreset(DevicePreset newPreset) async {
    if (newPreset.id != -1)
      await App.http.setDevicePreset(this.hookahCode, newPreset.id);
    selectedPreset.add(newPreset);
    Vibrate.feedback(FeedbackType.light);
  }

  _leaveOldSession(String activeSessionId) {
    List<String> params = new List<String>();
    params.add(activeSessionId);
    this.signalR.callServerFunction(name: 'LeaveSession', params: params);
    animations.add(null);
  }
}

class PuffChangeDataModel extends SignalData {
  int state;
  String stateName;

  PuffChangeDataModel(List<dynamic> data) : super(data) {
    if (data.length > 1) {
      if (data[1] is int) {
        state = data[1];
      }
      if (data[0] is String) {
        {
          stateName = data[0];
        }
      }
    }
  }
}

Duration stringToDuration(String sDuration) {
  var chunks = sDuration.split(':');
  var parts = chunks.map((f) {
    if (f.startsWith('0')) {
      return int.parse(f[1]);
    }
    return int.parse(f);
  }).toList();
  return new Duration(hours: parts[0], minutes: parts[1], seconds: parts[2]);
}

abstract class SignalData {
  SignalData(List<dynamic> data);
}
