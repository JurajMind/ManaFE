part of openapi.api;

class SmokeSessionMetaDataDto {
  
  int id = null;
  
  int tobaccoId = null;
  
  PipeAccesorySimpleDto tobacco = null;
  
  TobaccoMixSimpleDto tobaccoMix = null;
  
  double tobaccoWeight = null;
  
  int anonymPeopleCount = null;
  
  int bowlId = null;
  
  PipeAccesorySimpleDto bowl = null;
  
  int pipeId = null;
  
  PipeAccesorySimpleDto pipe = null;
  
  int coalId = null;
  
  PipeAccesorySimpleDto coal = null;
  
  int heatManagementId = null;
  
  PipeAccesorySimpleDto heatManagement = null;
  
  int packType = null;
  //enum packTypeEnum {  0,  1,  2,  3,  4,  };{
  
  double coalCount = null;
  SmokeSessionMetaDataDto();

  @override
  String toString() {
    return 'SmokeSessionMetaDataDto[id=$id, tobaccoId=$tobaccoId, tobacco=$tobacco, tobaccoMix=$tobaccoMix, tobaccoWeight=$tobaccoWeight, anonymPeopleCount=$anonymPeopleCount, bowlId=$bowlId, bowl=$bowl, pipeId=$pipeId, pipe=$pipe, coalId=$coalId, coal=$coal, heatManagementId=$heatManagementId, heatManagement=$heatManagement, packType=$packType, coalCount=$coalCount, ]';
  }

  SmokeSessionMetaDataDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    tobaccoId = json['TobaccoId'];
    tobacco = new PipeAccesorySimpleDto.fromJson(json['Tobacco']);
    tobaccoMix = new TobaccoMixSimpleDto.fromJson(json['TobaccoMix']);
    tobaccoWeight = json['TobaccoWeight'];
    anonymPeopleCount = json['AnonymPeopleCount'];
    bowlId = json['BowlId'];
    bowl = new PipeAccesorySimpleDto.fromJson(json['Bowl']);
    pipeId = json['PipeId'];
    pipe = new PipeAccesorySimpleDto.fromJson(json['Pipe']);
    coalId = json['CoalId'];
    coal = new PipeAccesorySimpleDto.fromJson(json['Coal']);
    heatManagementId = json['HeatManagementId'];
    heatManagement = new PipeAccesorySimpleDto.fromJson(json['HeatManagement']);
    packType = json['PackType'];
    coalCount = json['CoalCount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'TobaccoId': tobaccoId,
      'Tobacco': tobacco,
      'TobaccoMix': tobaccoMix,
      'TobaccoWeight': tobaccoWeight,
      'AnonymPeopleCount': anonymPeopleCount,
      'BowlId': bowlId,
      'Bowl': bowl,
      'PipeId': pipeId,
      'Pipe': pipe,
      'CoalId': coalId,
      'Coal': coal,
      'HeatManagementId': heatManagementId,
      'HeatManagement': heatManagement,
      'PackType': packType,
      'CoalCount': coalCount
    };
  }

  static List<SmokeSessionMetaDataDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmokeSessionMetaDataDto>() : json.map((value) => new SmokeSessionMetaDataDto.fromJson(value)).toList();
  }

  static Map<String, SmokeSessionMetaDataDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmokeSessionMetaDataDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmokeSessionMetaDataDto.fromJson(value));
    }
    return map;
  }
}

