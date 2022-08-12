import 'package:openapi/openapi.dart';

PlaceSimpleDto? toSimpePlace(PlaceDto? place) {
  if (place == null) {
    return null;
  }
  var result = new PlaceSimpleDto(
    name: place.name,
    friendlyUrl: place.friendlyUrl,
    facebook: place.facebook,
    phoneNumber: place.phoneNumber,
    businessHours: place.businessHours,
    address: place.address,
    haveMana: place.haveMana,
    haveMenu: place.haveMenu,
    haveOrders: place.haveOrders,
  );

  return result;
}
