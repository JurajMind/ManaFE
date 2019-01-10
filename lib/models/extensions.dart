import 'package:app/app/app.dart';
import 'package:openapi/api.dart';

class Extensions {
  static String getPlaceImage(PlaceSimpleDto place) {
    var image = place?.medias?.first?.path;
    if (image == null) {
      return 'https://${App.baseUri}/Content/place/placeholder.jpg';
    }
    return 'https://${App.baseUri}${image}original.jpg';
  }

  static String adress(SmartHookahModelsAddress adress) {
    return '${adress.street} ${adress.number} ${adress.city}';
  }
}
