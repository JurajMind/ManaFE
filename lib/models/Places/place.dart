import 'package:app/app/app.dart';

class Place {
  Place(
      {this.id,
      this.name,
      this.friendlyUrl,
      this.logoPath,
      this.address,
      this.images,
      this.rating});

  factory Place.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> adressMap = json['Address'];
    List<dynamic> imageMap = json['Medias'];
    var adress = Address.fromJson(adressMap);
    var images = imageMap.map((f) => (f['Path']+".jpg") as String).toList();
    return new Place(
        id: json['Id'],
        name: json['Name'],
        friendlyUrl: json['FriendlyUrl'],
        logoPath: 'https://${App.baseUri}${json['LogoPath']}',
        address: adress,
        images: images,
        rating: json['Rating']);
  }
  int id;

  String name;

  String friendlyUrl;

  String logoPath;

  Address address;

  List<String> images;

  int rating;

  String getPlaceImage(){
    if(images.length == 0)
    {
      return 'https://${App.baseUri}/Content/place/placeholder.jpg';
    }
    return 'https://${App.baseUri}/${images.last}';
  }
}


class Address {
  Address({this.street, this.city, this.number, this.zip, this.lat, this.lng});

  Address.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        street = json['Street'],
        number = json['Number'],
        city = json['City'],
        zip = json['Zip'],
        lat = double.parse(json['Lat']),
        lng = double.parse(json['Lng']);

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
