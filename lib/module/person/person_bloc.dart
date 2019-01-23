import 'package:app/app/app.dart';
import 'package:app/services/authorization.dart';
import 'package:app/services/signal_r.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class PersonBloc {
  bool _loadedGear = false;
  bool _loadedInit = false;

  BehaviorSubject<List<PipeAccesorySimpleDto>> myGear =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>(seedValue: null);

  BehaviorSubject<List<PipeAccesorySimpleDto>> hookahs =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>(
          seedValue: new List<PipeAccesorySimpleDto>());

  BehaviorSubject<List<PipeAccesorySimpleDto>> bowls =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>(
          seedValue: new List<PipeAccesorySimpleDto>());

  BehaviorSubject<List<DeviceSimpleDto>> devices =
      new BehaviorSubject<List<DeviceSimpleDto>>(
          seedValue: new List<DeviceSimpleDto>());

  BehaviorSubject<List<SmokeSessionSimpleDto>> smokeSessions =
      new BehaviorSubject<List<SmokeSessionSimpleDto>>(
          seedValue: new List<SmokeSessionSimpleDto>());

  BehaviorSubject<List<String>> smokeSessionsCodes =
      new BehaviorSubject<List<String>>(seedValue: new List<String>());

  loadMyGear(bool reload) async {
    if (_loadedGear && !reload) return;
    _loadedGear = true;
    var gear = await App.http.getMyGear();

    myGear.add(gear);
  }

  addSmokeSession(String smokeSessionId) {
    var newCodes = smokeSessionsCodes.value;
    newCodes.insert(0, smokeSessionId);
    newCodes = newCodes.toSet().toList();
    this.smokeSessionsCodes.add(newCodes);
  }

  loadInitData({bool reload = false}) async {
    if (_loadedInit && !reload) return;
    _loadedInit = true;
    var init = await App.http.getPersonInitData();
    devices.add(init.devices);
    smokeSessions.add(init.activeSmokeSessions);
    smokeSessionsCodes
        .add(init.activeSmokeSessions.map((f) => f.sessionId).toList());
    _loadedInit = true;
    try {
      var signal = new SignalR();
      List<String> params = new List<String>();
      var auth = new Authorize();
      params.add(await auth.getUserName());
      signal.callServerFunction(name: 'JoinPerson', params: params);
    } catch (e) {}
  }
}
