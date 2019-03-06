import 'package:app/app/app.dart';
import 'package:app/models/SignalR/device_online.dart';
import 'package:app/models/SignalR/signal_r_models.dart';
import 'package:app/services/authorization.dart';
import 'package:app/services/signal_r.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class PersonBloc {
  bool _loadedGear = false;
  bool _loadedInit = false;
  final SignalR _signalR = new SignalR();

  static final PersonBloc _instance = new PersonBloc._();

  factory PersonBloc() => PersonBloc._instance;

  PersonBloc._() {
    _signalR.connect().then((value) {
      _signalR.clientCalls.listen((onData) {
        proceddCalls(onData);
      });
    });
  }

  proceddCalls(ClientCall onData) {
    if (onData.Data == null) return;

    onData.Data.forEach((f) {
      switch (f.Method) {
        case 'deviceOnline':
          {
            handleDeviceOnline(f);
            break;
          }
      }
    });
  }

  BehaviorSubject<PersonInfoDto> info = new BehaviorSubject<PersonInfoDto>();

  BehaviorSubject<List<PipeAccesorySimpleDto>> myGear =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>();

  BehaviorSubject<List<ReservationDto>> myReservations =
      new BehaviorSubject<List<ReservationDto>>();

  BehaviorSubject<List<PipeAccesorySimpleDto>> hookahs =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>.seeded(
          new List<PipeAccesorySimpleDto>());

  BehaviorSubject<List<PipeAccesorySimpleDto>> bowls =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>.seeded(
          new List<PipeAccesorySimpleDto>());

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

  loadInitData({bool reload = false}) async {
    if (_loadedInit && !reload) return;
    _loadedInit = true;
    var init = await App.http.getPersonInitData();
    var infoTask = App.http.getPersonInfo();
    devices.add(init.devices);
    smokeSessions.add(init.activeSmokeSessions);
    smokeSessionsCodes.add(init.activeSmokeSessions);
    myReservations.add(init.activeReservations);
    this.info.add(await infoTask);
    _loadedInit = true;
    try {
      var signal = new SignalR();
      List<String> params = new List<String>();
      var auth = new Authorize();
      params.add(await auth.getUserName());
      signal.callServerFunction(name: 'JoinPerson', params: params);
    } catch (e) {}
  }

  void handleDeviceOnline(ClientMethod f) {
    var data = new DeviceOnline.fromSignal(f.Data);
    var smokeSession = new SmokeSessionSimpleDto();
    smokeSession.device = DeviceSimpleDto();
    smokeSession.device.name = data.deviceName;
    smokeSession.sessionId = data.sessionCode;
    this.addSmokeSession(smokeSession);
  }
}
