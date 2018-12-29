import 'package:app/app/app.dart';
import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:rxdart/rxdart.dart';

class PersonBloc {
  bool _loadedGear = false;

  BehaviorSubject<List<PipeAccesory>> myGear =
      new BehaviorSubject<List<PipeAccesory>>(
          seedValue: new List<PipeAccesory>());

  loadMyGear(bool reload) async {
    if (_loadedGear && !reload) return;

    var gear = await App.http.getMyGear();
    _loadedGear = true;
    myGear.add(gear);
  }
}
