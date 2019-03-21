part of openapi.api;

class PlaceSimpleDto {
  int id = null;

  String name = null;

  String friendlyUrl = null;

  String logoPath = null;

  AddressDto address = null;

  List<BusinessHoursDto> businessHours = [];

  int rating = null;

  MediaDto media = null;

  String phoneNumber = null;

  String facebook = null;
  PlaceSimpleDto();

  @override
  String toString() {
    return 'PlaceSimpleDto[id=$id, name=$name, friendlyUrl=$friendlyUrl, logoPath=$logoPath, address=$address, businessHours=$businessHours, rating=$rating, media=$media, phoneNumber=$phoneNumber, facebook=$facebook, ]';
  }

  PlaceSimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    name = json['Name'];
    friendlyUrl = json['FriendlyUrl'];
    logoPath = json['LogoPath'];
    address = new AddressDto.fromJson(json['Address']);
    businessHours = BusinessHoursDto.listFromJson(json['BusinessHours']);
    rating = json['Rating'];
    media = MediaDto.fromJson(json['Media']);
    phoneNumber = json['PhoneNumber'];
    facebook = json['Facebook'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'FriendlyUrl': friendlyUrl,
      'LogoPath': logoPath,
      'Address': address,
      'BusinessHours': businessHours,
      'Rating': rating,
      'Media': media,
      'PhoneNumber': phoneNumber,
      'Facebook': facebook
    };
  }

  static List<PlaceSimpleDto> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<PlaceSimpleDto>()
        : json.map((value) => new PlaceSimpleDto.fromJson(value)).toList();
  }

  static Map<String, PlaceSimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceSimpleDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) =>
          map[key] = new PlaceSimpleDto.fromJson(value));
    }
    return map;
  }
}
