part of openapi.api;

class BrandDto {
  
  String name = null;
  
  String url = null;
  
  String picture = null;
  
  bool tobacco = null;
  
  bool bowl = null;
  
  bool hookah = null;
  
  bool coal = null;
  
  bool heatManagment = null;
  
  bool tobaccoMixBrand = null;
  
  List<PipeAccesorySimpleDto> pipeAccessories = [];
  
  List<SmartHookahModelsDbSocialMedia> socialMedias = [];
  
  List<MediaDto> medias = [];
  
  String displayName = null;
  BrandDto();

  @override
  String toString() {
    return 'BrandDto[name=$name, url=$url, picture=$picture, tobacco=$tobacco, bowl=$bowl, hookah=$hookah, coal=$coal, heatManagment=$heatManagment, tobaccoMixBrand=$tobaccoMixBrand, pipeAccessories=$pipeAccessories, socialMedias=$socialMedias, medias=$medias, displayName=$displayName, ]';
  }

  BrandDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['Name'];
    url = json['Url'];
    picture = json['Picture'];
    tobacco = json['Tobacco'];
    bowl = json['Bowl'];
    hookah = json['Hookah'];
    coal = json['Coal'];
    heatManagment = json['HeatManagment'];
    tobaccoMixBrand = json['TobaccoMixBrand'];
    pipeAccessories = PipeAccesorySimpleDto.listFromJson(json['PipeAccessories']);
    socialMedias = SmartHookahModelsDbSocialMedia.listFromJson(json['SocialMedias']);
    medias = MediaDto.listFromJson(json['Medias']);
    displayName = json['DisplayName'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Url': url,
      'Picture': picture,
      'Tobacco': tobacco,
      'Bowl': bowl,
      'Hookah': hookah,
      'Coal': coal,
      'HeatManagment': heatManagment,
      'TobaccoMixBrand': tobaccoMixBrand,
      'PipeAccessories': pipeAccessories,
      'SocialMedias': socialMedias,
      'Medias': medias,
      'DisplayName': displayName
    };
  }

  static List<BrandDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<BrandDto>() : json.map((value) => new BrandDto.fromJson(value)).toList();
  }

  static Map<String, BrandDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, BrandDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new BrandDto.fromJson(value));
    }
    return map;
  }
}

