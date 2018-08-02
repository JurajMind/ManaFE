import 'package:app/app/app.dart';

class Place {
  Place(
      {this.id,
      this.name,
      this.friendlyUrl,
      this.logoPath,
      this.address,
      this.rating});

  factory Place.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> adressMap = json['Address'];
    var adress = Address.fromJson(adressMap);
    return new Place(
        id: json['Id'],
        name: json['Name'],
        friendlyUrl: json['FriendlyUrl'],
        logoPath: 'https://${App.baseUri}${json['LogoPath']}',
        address: adress,
        rating: json['Rating']);
  }
  int id;

  String name;

  String friendlyUrl;

  String logoPath;

  Address address;

  int rating;
}

class Address {
  Address({this.street, this.city, this.number, this.zip, this.lat, this.lng});

  Address.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        street = json['Street'],
        number = json['Number'],
        city = json['City'],
        zip = json['Zip'],
        lat = json['lat'],
        lng = json['lng'];

  int id;

  String street;

  String city;

  String number;

  String zip;

  double lat;

  double lng;

  @override
  String toString() {
    // TODO: implement toString
    return '${this.street} ${this.number} ${this.city}';
  }
}
