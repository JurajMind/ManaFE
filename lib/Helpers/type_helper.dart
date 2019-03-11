import 'package:openapi/api.dart';

PlaceSimpleDto toSimpePlace(PlaceDto place) {
  if (place == null) {
    return null;
  }
  var result = new PlaceSimpleDto();
  result.name = place.name;
  result.friendlyUrl = place.friendlyUrl;
  result.facebook = place.facebook;
  result.phoneNumber = place.phoneNumber;
  result.businessHours = place.businessHours.map((m) {
    var o = new OpeningDay();
    o.day = m.day;
    o.openTime = m.openTine;
    o.closeTime = m.closeTime;
    return o;
  }).toList();
  result.address = new SmartHookahModelsDbAddress();
  result.address.city = place.address.city;
  result.address.lat = place.address.lat;
  result.address.lng = place.address.lng;
  result.address.number = place.address.number;
  result.address.street = place.address.street;
  result.address.ZIP = place.address.ZIP;
  return result;
}
