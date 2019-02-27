import 'package:app/app/app.dart';
import 'package:rxdart/subjects.dart';
import 'package:openapi/api.dart';

class MenuBloc {
  var _loadedPlace = 0;
  BehaviorSubject<List<PipeAccesorySimpleDto>> hookahs =
      new BehaviorSubject<List<PipeAccesorySimpleDto>> 
      .seeded(new List<PipeAccesorySimpleDto>());

  BehaviorSubject<List<PipeAccesorySimpleDto>> bowls =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>.seeded(new List<PipeAccesorySimpleDto>());

  BehaviorSubject<List<PipeAccesorySimpleDto>> tobacco =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>.seeded(new List<PipeAccesorySimpleDto>());

  BehaviorSubject<List<TobaccoMixSimpleDto>> tobaccoMix =
      new BehaviorSubject<List<TobaccoMixSimpleDto>>.seeded(new List<TobaccoMixSimpleDto>());

  BehaviorSubject<List<SmartHookahModelsOrderExtraDto>> extra =
      new BehaviorSubject<List<SmartHookahModelsOrderExtraDto>>.seeded(new List<SmartHookahModelsOrderExtraDto>());

  Future loadMenu(int placeId) async {
    if(placeId != _loadedPlace){
      hookahs.add(null);
      bowls.add(null);
      tobacco.add(null);
      tobaccoMix.add(null);
      extra.add(null);
    }
    var data = await App.http.getPlaceMenu(placeId);

    hookahs.add(data.accessories.where((s) => s.type == "Hookah").toList());
    bowls.add(data.accessories.where((s) => s.type == "Bowl").toList());
    tobacco.add(data.accessories.where((s) => s.type == "Tobacco").toList());

    tobaccoMix.add(data.tobaccoMixes);
    extra.add(data.orderExtras);
  }
}
