import 'package:app/app/app.dart';
import 'package:app/models/App/Gear/gear_model.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class GearBloc {
  static final GearBloc _instance = new GearBloc._();

  factory GearBloc() => GearBloc._instance;

  BehaviorSubject<List<BrandGroup>> tobacco =
      new BehaviorSubject<List<BrandGroup>>();

  BehaviorSubject<List<BrandGroup>> hookah =
      new BehaviorSubject<List<BrandGroup>>();

  BehaviorSubject<List<BrandGroup>> bowls =
      new BehaviorSubject<List<BrandGroup>>();

  BehaviorSubject<List<BrandGroup>> hms =
      new BehaviorSubject<List<BrandGroup>>();

  BehaviorSubject<List<BrandGroup>> coals =
      new BehaviorSubject<List<BrandGroup>>();

  BehaviorSubject<List<PipeAccesorySimpleDto>> brandAccesory =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>();

  GearBloc._() {
    this.loadGearBrans();
  }

  loadGearBrans() async {
    var gear = await App.http.getGearBrans();
    tobacco.add(gear["Tobacco"]);
    hookah.add(gear["Hookah"]);
    bowls.add(gear["Bowl"]);
    hms.add(gear["Heatmanagement"]);
    coals.add(gear["Coal"]);
  }

  String loadedBrand;
  String loadedType;
  loadBrandAccesory(String brand, String type) async {
    brandAccesory.add(null);
    var accesory = await App.http
        .searchGear(brand.trim(), type, 0, 1000, searchType: "Brand");
    brandAccesory.add(accesory);
  }

  BehaviorSubject<List<BrandGroup>> getBrandsByType(String type) {
    switch (type) {
      case "Tobacco":
        return this.tobacco;
      case "Hookah":
        return this.hookah;
      case "Bowl":
        return this.bowls;
      case "HeatManagement":
        return this.hms;
      case "Coal":
        return this.coals;

        break;
      default:
        return null;
    }
  }

  Future<PipeAccesorySimpleDto> addGear(PipeAccesorySimpleDto newGear) async {
    var created = await App.http.addGear(newGear);
    // todo create
    return created;
  }
}
