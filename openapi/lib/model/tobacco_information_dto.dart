part of openapi.api;

class TobaccoInformationDto {
  
  TobaccoSimpleDto tobacco = null;
  
  List<TobaccoTasteDto> tobaccoTastes = [];
  
  PipeAccessoryStatisticsDto personTobaccoStats = null;
  
  PipeAccessoryStatisticsDto allTobaccoStats = null;
  
  List<SmokeSessionSimpleDto> smokeSessions = [];
  
  List<GearTobaccoReviewDto> reviews = [];
  TobaccoInformationDto();

  @override
  String toString() {
    return 'TobaccoInformationDto[tobacco=$tobacco, tobaccoTastes=$tobaccoTastes, personTobaccoStats=$personTobaccoStats, allTobaccoStats=$allTobaccoStats, smokeSessions=$smokeSessions, reviews=$reviews, ]';
  }

  TobaccoInformationDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Tobacco'] == null) {
      tobacco = null;
    } else {
      tobacco = new TobaccoSimpleDto.fromJson(json['Tobacco']);
    }
    if (json['TobaccoTastes'] == null) {
      tobaccoTastes = null;
    } else {
      tobaccoTastes = TobaccoTasteDto.listFromJson(json['TobaccoTastes']);
    }
    if (json['PersonTobaccoStats'] == null) {
      personTobaccoStats = null;
    } else {
      personTobaccoStats = new PipeAccessoryStatisticsDto.fromJson(json['PersonTobaccoStats']);
    }
    if (json['AllTobaccoStats'] == null) {
      allTobaccoStats = null;
    } else {
      allTobaccoStats = new PipeAccessoryStatisticsDto.fromJson(json['AllTobaccoStats']);
    }
    if (json['SmokeSessions'] == null) {
      smokeSessions = null;
    } else {
      smokeSessions = SmokeSessionSimpleDto.listFromJson(json['SmokeSessions']);
    }
    if (json['Reviews'] == null) {
      reviews = null;
    } else {
      reviews = GearTobaccoReviewDto.listFromJson(json['Reviews']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (tobacco != null)
      json['Tobacco'] = tobacco;
    if (tobaccoTastes != null)
      json['TobaccoTastes'] = tobaccoTastes;
    if (personTobaccoStats != null)
      json['PersonTobaccoStats'] = personTobaccoStats;
    if (allTobaccoStats != null)
      json['AllTobaccoStats'] = allTobaccoStats;
    if (smokeSessions != null)
      json['SmokeSessions'] = smokeSessions;
    if (reviews != null)
      json['Reviews'] = reviews;
    return json;
  }

  static List<TobaccoInformationDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<TobaccoInformationDto>() : json.map((value) => new TobaccoInformationDto.fromJson(value)).toList();
  }

  static Map<String, TobaccoInformationDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, TobaccoInformationDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new TobaccoInformationDto.fromJson(value));
    }
    return map;
  }
}

