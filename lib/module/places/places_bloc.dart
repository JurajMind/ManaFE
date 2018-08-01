import 'package:app/models/Places/place.dart';
import 'package:app/services/http.service.dart';
import 'package:rxdart/rxdart.dart';

class PlacesBloc {
  BehaviorSubject<List<Place>> places =
      new BehaviorSubject<List<Place>>(seedValue: new List<Place>());

  BehaviorSubject<bool> loading = new BehaviorSubject(seedValue: false);

  static final PlacesBloc _instance = new PlacesBloc._();

  factory PlacesBloc() => PlacesBloc._instance;

  PlacesBloc._() {
    ApiClient apiClient = ApiClient();
    this.loading.add(true);
    apiClient.getNearbyPlaces().then((places) {
      this.places.add(places);
      this.loading.add(false);
    });
  }
}
