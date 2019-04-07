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
  result.businessHours = place.businessHours;
  result.address = place.address;
  result.haveMana = place.haveMana;
  result.haveMenu = place.haveMenu;
  result.haveOrders = place.haveOrders;
  result.haveReservation = place.haveReservation;
  return result;
}
