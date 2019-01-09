import 'package:app/app/app.dart';
import 'package:rxdart/subjects.dart';
import 'package:openapi/api.dart';

class MenuBloc {
  BehaviorSubject<List<PipeAccesorySimpleDto>> hookahs =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>(
          seedValue: new List<PipeAccesorySimpleDto>());

  BehaviorSubject<List<PipeAccesorySimpleDto>> bowls =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>(
          seedValue: new List<PipeAccesorySimpleDto>());

  BehaviorSubject<List<PipeAccesorySimpleDto>> tobacco =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>(
          seedValue: new List<PipeAccesorySimpleDto>());

  BehaviorSubject<List<TobaccoMixSimpleDto>> tobaccoMix =
      new BehaviorSubject<List<TobaccoMixSimpleDto>>(
          seedValue: new List<TobaccoMixSimpleDto>());

  BehaviorSubject<List<SmartHookahModelsOrderExtraDto>> extra =
      new BehaviorSubject<List<SmartHookahModelsOrderExtraDto>>(
          seedValue: new List<SmartHookahModelsOrderExtraDto>());

  Future loadMenu(int placeId) async {
    var data = await App.http.getPlaceMenu(placeId);

    hookahs.add(data.accessories.where((s) => s.type == "Hookah").toList());
    bowls.add(data.accessories.where((s) => s.type == "Bowl").toList());
    tobacco.add(data.accessories.where((s) => s.type == "Tobacco").toList());

    tobaccoMix.add(data.tobaccoMixes);
    extra.add(data.orderExtras);
  }
}
