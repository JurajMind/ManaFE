import 'package:app/app/app.dart';
import 'package:app/models/App/Gear/gear_model.dart';
import 'package:rxdart/rxdart.dart';

class GearBloc {
  BehaviorSubject<List<BrandGroup>> tobacco =
      new BehaviorSubject<List<BrandGroup>>(seedValue: new List<BrandGroup>());

  BehaviorSubject<List<BrandGroup>> hookah =
      new BehaviorSubject<List<BrandGroup>>(seedValue: new List<BrandGroup>());

  BehaviorSubject<List<BrandGroup>> bowls =
      new BehaviorSubject<List<BrandGroup>>(seedValue: new List<BrandGroup>());

  BehaviorSubject<List<BrandGroup>> hms =
      new BehaviorSubject<List<BrandGroup>>(seedValue: new List<BrandGroup>());

  BehaviorSubject<List<BrandGroup>> coals =
      new BehaviorSubject<List<BrandGroup>>(seedValue: new List<BrandGroup>());

  loadGearBrans() async {
    var gear = await App.http.getGearBrans();
    tobacco.add(gear["Tobacco"]);
    hookah.add(gear["Hookah"]);
    bowls.add(gear["Bowl"]);
    hms.add(gear["Heatmanagement"]);
    coals.add(gear["Coal"]);
  }
}
