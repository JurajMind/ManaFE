import 'dart:convert';

import 'package:app/app/app.dart';
import 'package:app/models/SignalR/device_online.dart';
import 'package:app/module/signal_bloc.dart';
import 'package:app/services/authorization.dart';
import 'package:app/services/signal_r.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';
import 'package:rxdart/rxdart.dart';

class PersonBloc extends SignalBloc {
  bool _loadedGear = false;
  bool _loadedInit = false;

  static final PersonBloc _instance = new PersonBloc._();

  factory PersonBloc() => PersonBloc._instance;

  PersonBloc._() {
    this.connect();
  }

  @override
  handleCall(String method, List<dynamic> data) {
    switch (method) {
      case 'deviceOnline':
        {
          handleDeviceOnline(data);
          break;
        }
    }
  }

  BehaviorSubject<PersonInfoDto> info = new BehaviorSubject<PersonInfoDto>();

  BehaviorSubject<List<PipeAccesorySimpleDto>> myGear =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>();

  BehaviorSubject<List<PlacesReservationsReservationDto>> myReservations =
      new BehaviorSubject<List<PlacesReservationsReservationDto>>();

  BehaviorSubject<List<DeviceSimpleDto>> devices =
      new BehaviorSubject<List<DeviceSimpleDto>>.seeded(
          new List<DeviceSimpleDto>());

  BehaviorSubject<List<SmokeSessionSimpleDto>> smokeSessions =
      new BehaviorSubject<List<SmokeSessionSimpleDto>>.seeded(
          new List<SmokeSessionSimpleDto>());

  BehaviorSubject<List<SmokeSessionSimpleDto>> smokeSessionsCodes =
      new BehaviorSubject<List<SmokeSessionSimpleDto>>.seeded(
          new List<SmokeSessionSimpleDto>());

  loadMyGear(bool reload) async {
    if (_loadedGear && !reload) return;
    _loadedGear = true;
    var gear = await App.http.getMyGear();

    myGear.add(gear);
  }

  addSmokeSession(SmokeSessionSimpleDto smokeSessionId) {
    var newCodes = smokeSessionsCodes.value;

    var collection = new Collection(newCodes);
    var match = collection.where$1(
        (predicate, index) => predicate.sessionId == smokeSessionId.sessionId);

    if (match.count() > 0) {
      return;
    }
    newCodes.insert(0, smokeSessionId);
    newCodes = newCodes.toSet().toList();
    this.smokeSessionsCodes.add(newCodes);
  }

  Future addMyGear(PipeAccesorySimpleDto accesory, int count) async {
    PipeAccesorySimpleDto addedAccesory =
        await App.http.addMyGear(accesory.id, count);
    var oldGear = this.myGear.value;
    oldGear.add(addedAccesory);
    this.myGear.add(oldGear.toSet().toList());
  }

  Future removeMyGear(PipeAccesorySimpleDto accesory, int count) async {
    var removed = await App.http.removeMyGear(accesory.id);
    var oldGear = this.myGear.value;
    oldGear.removeWhere((a) => a.id == accesory.id);
    this.myGear.add(oldGear.toSet().toList());
  }

  loadInitData({bool reload = false}) async {
    if (_loadedInit && !reload) return;
    _loadedInit = true;
    loadInitDataFromCache();
    var init = await App.http.getPersonInitData();
    var db = await App.cache.getDatabase();
    var key = await db.put(json.encode(init), 'person');
    var infoTask = App.http.getPersonInfo();
    devices.add(init.devices);
    var sessions = new Collection(init.activeSmokeSessions);
    sessions
        .orderBy((s) => s.device.isOnline ? 0 : 1)
        .thenBy((s) => s.device.name);
    smokeSessions.add(sessions.toList());
    smokeSessionsCodes.add(sessions.toList());
    myReservations.add(init.activeReservations);
    var info = await infoTask;
    this.info.add(info);
    _loadedInit = true;
    try {
      var signal = new SignalR();
      List<String> params = new List<String>();
      var auth = new Authorize();
      params.add(await auth.getUserName());
      signal.callServerFunction(
          new ServerCallParam(name: 'JoinPerson', params: params));
    } catch (e) {}
  }

  Future loadInitDataFromCache() async {
    try {
      var db = await App.cache.getDatabase();
      var value = await db.get('person');
      if (value == null) {
        return;
      }
      var it = json.decode(value);
      var fromCache = PersonActiveDataDto.fromJson(it);
      devices.add(fromCache.devices);
      myReservations.add(fromCache.activeReservations);
    } catch (e) {
      print('error');
      print(e);
    }
  }

  Future loadSessions() async {
    var activeSmokeSessions = await App.http.getPersonSessions();
    var sessions = new Collection(activeSmokeSessions);
    sessions
        .orderBy(
          (s) => s.device.isOnline ? 0 : 1,
        )
        .thenBy((s) => s.device.name)
        .reverse();

    this.smokeSessions.add(sessions.toList());
    this.smokeSessionsCodes.add(sessions.toList());
    return;
  }

  void handleDeviceOnline(List<dynamic> incomingData) {
    var data = new DeviceOnline.fromSignal(incomingData);
    var smokeSession = new SmokeSessionSimpleDto();
    smokeSession.device = DeviceSimpleDto();
    smokeSession.device.name = data.deviceName;
    smokeSession.sessionId = data.sessionCode;
    this.addSmokeSession(smokeSession);
  }

  Future<DeviceSimpleDto> addDevice(
      String id, String code, String newName) async {
    var addedDevice = await App.http.addDevice(id, newName, code);
    var oldDevices = this.devices.value;
    oldDevices.add(addedDevice);
    this.devices.add(oldDevices);
    return addedDevice;
  }

  Future<DeviceSimpleDto> removeDevice(String id) async {
    var addedDevice = await App.http.removeDevice(id);
    var oldDevices = this.devices.value;
    oldDevices.removeWhere((addedDevice) => addedDevice.code == id);
    this.devices.add(oldDevices);
    return addedDevice;
  }
}
