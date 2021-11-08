import 'dart:async';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:app/app/app.dart';
import 'package:app/const/theme.dart';
import 'package:app/models/SignalR/device_online.dart';
import 'package:app/models/SignalR/signal_r_models.dart';
import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/models/SmokeSession/timer_dependency.dart';
import 'package:app/models/SmokeSession/tobacco_edit_model.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/models/Stand/preset.dart';
import 'package:app/services/signal_r.dart';
import 'package:app/utils/color.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

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

  Stream<int> get smokeStateBroadcast {
    return this.smokeState.asBroadcastStream();
  }

  PufTimerDependencies pufTimerDependencies;

  BehaviorSubject<String> lastSession = new BehaviorSubject<String>();

  BehaviorSubject<SmokeSessionMetaDataDto> smokeSessionMetaData =
      new BehaviorSubject<SmokeSessionMetaDataDto>.seeded(
          new SmokeSessionMetaDataDto());

  BehaviorSubject<SmokeSessionSimpleDto> smokeSession =
      new BehaviorSubject<SmokeSessionSimpleDto>.seeded(
          new SmokeSessionSimpleDto());

  BehaviorSubject<StandSettings> standSettings =
      new BehaviorSubject<StandSettings>.seeded(new StandSettings.empty());

  BehaviorSubject<List<SmartHookahHelpersAnimation>> animations =
      new BehaviorSubject<List<SmartHookahHelpersAnimation>>.seeded(
          new List<SmartHookahHelpersAnimation>());

  BehaviorSubject<List<Color>> sessionColor =
      new BehaviorSubject<List<Color>>();

  PublishSubject<Tuple2<StandSettings, SmokeState>> futureSettings =
      new PublishSubject<Tuple2<StandSettings, SmokeState>>();

  Stream<Tuple2<StandSettings, SmokeState>> futureSettingDebounce;

  BehaviorSubject<List<DevicePreset>> devicePresets =
      new BehaviorSubject<List<DevicePreset>>.seeded(new List<DevicePreset>());

  BehaviorSubject<DevicePreset> selectedPreset =
      new BehaviorSubject<DevicePreset>.seeded(DevicePreset.empty());

  BehaviorSubject<List<SmartHookahModelsDbSessionDtoSessionReviewDto>>
      sessionReviews = new BehaviorSubject<
          List<SmartHookahModelsDbSessionDtoSessionReviewDto>>();

  PublishSubject<DevicePreset> futureDevicePreset =
      new PublishSubject<DevicePreset>();
  Stream<DevicePreset> futureDevicePresetDebounce;

  StreamController<Flushbar<Map<String, dynamic>>> notifications =
      new StreamController<Flushbar<Map<String, dynamic>>>.broadcast();

  pauseSession() {
    smokeState.add(0);
  }

  setColor(Color color, SmokeState smokeState) async {
    sessionColor.add([color, ColorHelper.getOpositeColor(color)]);
    await App.http.changeColor(
        this.hookahCode, new HSVColor.fromColor(color), smokeState);
    HapticFeedback.selectionClick();
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

    HapticFeedback.selectionClick();
  }

  setSpeed(int speed, SmokeState smokeState) async {
    var curentSetting = standSettings.value;
    var editSetting = curentSetting.getStateSetting(smokeState);
    if (editSetting.brightness == speed) return;

    await App.http.changeSpeed(speed, smokeState, hookahCode);

    editSetting.speed = speed;
    curentSetting.setStateSetting(smokeState, editSetting);

    HapticFeedback.selectionClick();
  }

  _futureSetAnimation(Tuple2<StandSettings, SmokeState> data) async {
    var animationId = data.value1.getStateSetting(data.value2).animationId;
    await App.http.changeAnimation(animationId, data.value2, hookahCode);
    standSettings.add(data.value1);

    HapticFeedback.selectionClick();
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

  Future<SmokeSessionSimpleDto> endSession() async {
    var endedSession = await App.http.endSession(this.activeSessionId);

    if (endedSession != null) {
      _leaveOldSession(activeSessionId);
      this.activeSessionId = '';
    }

    return endedSession;
  }

  Future _joinSession(String sessionCode) async {
    List<String> params = new List<String>();
    params.add(sessionCode);
    this.signalR.callServerFunction(
        new ServerCallParam(name: 'JoinSession', params: params));
    lastSession.add(sessionCode);
    await loadSessionData();
  }

  Future loadSessionData() async {
    if (this.activeSessionId == null) return;
    var sessionData = await App.http.getInitData(this.activeSessionId);
    App.http.getSessionReview(sessionData.dtoSession.id).then((reviews) {
      sessionReviews.add(reviews);
    });
    standSettings.add(sessionData.setting);
    sessionColor.add([
      sessionData.setting.puf.color.toColor(),
      ColorHelper.getOpositeColor(sessionData.setting.puf.color.toColor())
    ]);
    smokeStatistic.add(sessionData.session.smokeSessionData);
    smokeSessionMetaData.add(sessionData.dtoSession.metaData);
    smokeSession.add(sessionData.dtoSession);
    hookahCode = sessionData.session.hookah.code;
    if (animations.value == null) {
      animations
          .add(await App.http.getAnimations(sessionData.session.hookah.code));
    }
  }

  loadAnimation() async {
    var list = await App.http.getAnimations(hookahCode);
    animations.add(list);
  }

  setTobacco(TobaccoEditModel setModel) {
    metaDataChanged = true;
    var selection = this.smokeSessionMetaData.value;

    if (setModel == null) {
      selection.tobaccoId = 0;
      selection.tobacco = null;
      selection.tobaccoMix = null;
      this.smokeSessionMetaData.add(selection);
      saveMetaData();
      return;
    }

    if (setModel.mix == null) {
      selection.tobacco = setModel.tobacco;
      selection.tobaccoId = setModel.tobacco.id;
      selection.tobaccoWeight = setModel.weight.toDouble();
      selection.tobaccoMix = null;
    } else {
      selection.tobaccoMix = setModel.mix;
      if (setModel.mix.id != null) {
        selection.tobaccoId = setModel.mix.id;
      }
      selection.tobacco = null;
    }

    this.smokeSessionMetaData.add(selection);
    saveMetaData();
  }

  setMetadataAccesory(PipeAccesorySimpleDto accesory, {String type}) {
    metaDataChanged = true;
    var selection = this.smokeSessionMetaData.value;
    switch (accesory?.type?.toLowerCase() ?? type?.toLowerCase()) {
      case 'hookah':
        selection.pipe = accesory;
        selection.pipeId = accesory?.id;
        break;

      case 'pipe':
        selection.pipe = accesory;
        selection.pipeId = accesory?.id;
        break;

      case 'bowl':
        selection.bowl = accesory;
        selection.bowlId = accesory?.id;
        break;

      case 'heatmanagement':
        selection.heatManagement = accesory;
        selection.heatManagementId = accesory?.id;
        break;

      case 'heatmanagment':
        selection.heatManagement = accesory;
        selection.heatManagementId = accesory?.id;
        break;

      case 'coal':
        selection.coal = accesory;
        selection.coalId = accesory?.id;
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
        futureSettings.debounceTime(Duration(milliseconds: 800));
    futureSettingDebounce.listen((onData) => _futureSetAnimation(onData));

    futureDevicePresetDebounce =
        futureDevicePreset.debounceTime(Duration(milliseconds: 800));
    futureDevicePresetDebounce.listen((onData) => _futureSetPreset(onData));

    pufTimerDependencies = new PufTimerDependencies(this);
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
        case 'settingChanged':
          {
            handleSettingChanged(f);
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
    Flushbar<Map<String, dynamic>> bar;
    bar = new Flushbar<Map<String, dynamic>>(
      message: '${data.deviceName} come online',
      mainButton: FlatButton(
        onPressed: () {
          var map = new Map<String, dynamic>();
          map['sessionId'] = data.sessionCode;
          bar.dismiss(map);
        },
        child: Text(
          "TO SESSION",
          style: TextStyle(color: Colors.amber),
        ),
      ),
      icon: Icon(
        Icons.cloud,
        size: 28.0,
        color: AppColors.colors[1],
      ),
      duration: Duration(seconds: 10),
      leftBarIndicatorColor: AppColors.colors[1],
    );

    this.notifications.add(bar);
  }

  loadPresets() async {
    var presets = await App.http.getDevicePresets();
    devicePresets.add(presets);
  }

  Future _futureSetPreset(DevicePreset newPreset) async {
    if (newPreset.id != -1)
      await App.http.setDevicePreset(this.hookahCode, newPreset.id);
    selectedPreset.add(newPreset);
    HapticFeedback.selectionClick();
  }

  _leaveOldSession(String activeSessionId) {
    List<String> params = new List<String>();
    params.add(activeSessionId);
    this.signalR.callServerFunction(
        new ServerCallParam(name: 'LeaveSession', params: params));
    animations.add(null);
    sessionReviews.add(null);
    smokeSession.add(null);
    smokeSessionMetaData.add(new SmokeSessionMetaDataDto());
  }

  void handleSettingChanged(ClientMethod f) {
    var newSettingJson =
        StandSettings.fromJson(f.Data[0] as Map<String, dynamic>);

    this.standSettings.add(newSettingJson);
  }

  Future saveReview(SmartHookahModelsDbSessionDtoSessionReviewDto review,
      List<File> media) async {
    var newReview = await App.http.addSessionReview(review);

    var mediaDto = new List<MediaDto>();
    if (media != null && media.length > 0) {
      media.forEach((f) async {
        try {
          mediaDto.add(await App.http.uploadSessionReviewFile(newReview.id, f));
        } catch (e) {
          print(e);
        }
      });
    }
    newReview.medias = mediaDto;

    var allReviews = sessionReviews.value;
    allReviews.insert(0, newReview);
    sessionReviews.add(allReviews);
  }

  Future removeReview(
      SmartHookahModelsDbSessionDtoSessionReviewDto review) async {
    var state = await App.http.removeSessionReview(review.id);
    var allReviews = List<SmartHookahModelsDbSessionDtoSessionReviewDto>.from(
        sessionReviews.value);
    var reviewIndex = allReviews.indexWhere((test) => test.id == review.id);
    allReviews.removeAt(reviewIndex);
    sessionReviews.add(allReviews);
  }

  Future<bool> unAssignSession() async {
    await App.http.unAssignSession(this.smokeSession.value.id);
    this._leaveOldSession(activeSessionId);
    return true;
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

abstract class SignalData {
  SignalData(List<dynamic> data);
}
