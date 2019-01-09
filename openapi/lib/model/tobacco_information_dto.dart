part of openapi.api;

class TobaccoInformationDto {
  
  TobaccoSimpleDto tobacco = null;
  
  List<TobaccoTasteDto> tobaccoTastes = [];
  
  PipeAccessoryStatisticsDto personTobaccoStats = null;
  
  PipeAccessoryStatisticsDto allTobaccoStats = null;
  
  List<SmokeSessionSimpleDto> smokeSessions = [];
  
  List<TobaccoReviewDto> reviews = [];
  TobaccoInformationDto();

  @override
  String toString() {
    return 'TobaccoInformationDto[tobacco=$tobacco, tobaccoTastes=$tobaccoTastes, personTobaccoStats=$personTobaccoStats, allTobaccoStats=$allTobaccoStats, smokeSessions=$smokeSessions, reviews=$reviews, ]';
  }

  TobaccoInformationDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    tobacco = new TobaccoSimpleDto.fromJson(json['Tobacco']);
    tobaccoTastes = TobaccoTasteDto.listFromJson(json['TobaccoTastes']);
    personTobaccoStats = new PipeAccessoryStatisticsDto.fromJson(json['PersonTobaccoStats']);
    allTobaccoStats = new PipeAccessoryStatisticsDto.fromJson(json['AllTobaccoStats']);
    smokeSessions = SmokeSessionSimpleDto.listFromJson(json['SmokeSessions']);
    reviews = TobaccoReviewDto.listFromJson(json['Reviews']);
  }

  Map<String, dynamic> toJson() {
    return {
      'Tobacco': tobacco,
      'TobaccoTastes': tobaccoTastes,
      'PersonTobaccoStats': personTobaccoStats,
      'AllTobaccoStats': allTobaccoStats,
      'SmokeSessions': smokeSessions,
      'Reviews': reviews
    };
  }

  static List<TobaccoInformationDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<TobaccoInformationDto>() : json.map((value) => new TobaccoInformationDto.fromJson(value)).toList();
  }

  static Map<String, TobaccoInformationDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, TobaccoInformationDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new TobaccoInformationDto.fromJson(value));
    }
    return map;
  }
}

