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
    if (json['Name'] == null) {
      name = null;
    } else {
          name = json['Name'];
    }
    if (json['Url'] == null) {
      url = null;
    } else {
          url = json['Url'];
    }
    if (json['Picture'] == null) {
      picture = null;
    } else {
          picture = json['Picture'];
    }
    if (json['Tobacco'] == null) {
      tobacco = null;
    } else {
          tobacco = json['Tobacco'];
    }
    if (json['Bowl'] == null) {
      bowl = null;
    } else {
          bowl = json['Bowl'];
    }
    if (json['Hookah'] == null) {
      hookah = null;
    } else {
          hookah = json['Hookah'];
    }
    if (json['Coal'] == null) {
      coal = null;
    } else {
          coal = json['Coal'];
    }
    if (json['HeatManagment'] == null) {
      heatManagment = null;
    } else {
          heatManagment = json['HeatManagment'];
    }
    if (json['TobaccoMixBrand'] == null) {
      tobaccoMixBrand = null;
    } else {
          tobaccoMixBrand = json['TobaccoMixBrand'];
    }
    if (json['PipeAccessories'] == null) {
      pipeAccessories = null;
    } else {
      pipeAccessories = PipeAccesorySimpleDto.listFromJson(json['PipeAccessories']);
    }
    if (json['SocialMedias'] == null) {
      socialMedias = null;
    } else {
      socialMedias = SmartHookahModelsDbSocialMedia.listFromJson(json['SocialMedias']);
    }
    if (json['Medias'] == null) {
      medias = null;
    } else {
      medias = MediaDto.listFromJson(json['Medias']);
    }
    if (json['DisplayName'] == null) {
      displayName = null;
    } else {
          displayName = json['DisplayName'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (name != null)
      json['Name'] = name;
    if (url != null)
      json['Url'] = url;
    if (picture != null)
      json['Picture'] = picture;
    if (tobacco != null)
      json['Tobacco'] = tobacco;
    if (bowl != null)
      json['Bowl'] = bowl;
    if (hookah != null)
      json['Hookah'] = hookah;
    if (coal != null)
      json['Coal'] = coal;
    if (heatManagment != null)
      json['HeatManagment'] = heatManagment;
    if (tobaccoMixBrand != null)
      json['TobaccoMixBrand'] = tobaccoMixBrand;
    if (pipeAccessories != null)
      json['PipeAccessories'] = pipeAccessories;
    if (socialMedias != null)
      json['SocialMedias'] = socialMedias;
    if (medias != null)
      json['Medias'] = medias;
    if (displayName != null)
      json['DisplayName'] = displayName;
    return json;
  }

  static List<BrandDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<BrandDto>() : json.map((value) => new BrandDto.fromJson(value)).toList();
  }

  static Map<String, BrandDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, BrandDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new BrandDto.fromJson(value));
    }
    return map;
  }
}

