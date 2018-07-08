import 'package:app/injection/dependency_injection.dart';
import 'package:app/models/tobacco_mix.dart';
import 'package:app/services/mix_repository.dart';

abstract class TobaccoMixListViewContract {
  void onLoadContactsComplete(List<TobaccoMix> items);
  void onLoadContactsError();
}

class TobacoMixListPresenter {
TobaccoMixListViewContract _view;
MixRepository _repository;


 TobacoMixListPresenter(this._view){
    _repository = new Injector().tobaccoMixRepository;
  }

  void loadTobaccoMix(){
    assert(_view != null);

    _repository.fetch().then((mix) => _view.onLoadContactsComplete(mix))
    .catchError((onError) {
      print(onError);
      _view.onLoadContactsError();
    })
  }

}