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
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['TobaccoId'] == null) {
      tobaccoId = null;
    } else {
          tobaccoId = json['TobaccoId'];
    }
    if (json['Tobacco'] == null) {
      tobacco = null;
    } else {
      tobacco = new PipeAccesorySimpleDto.fromJson(json['Tobacco']);
    }
    if (json['TobaccoMix'] == null) {
      tobaccoMix = null;
    } else {
      tobaccoMix = new TobaccoMixSimpleDto.fromJson(json['TobaccoMix']);
    }
    if (json['TobaccoWeight'] == null) {
      tobaccoWeight = null;
    } else {
          tobaccoWeight = json['TobaccoWeight'];
    }
    if (json['AnonymPeopleCount'] == null) {
      anonymPeopleCount = null;
    } else {
          anonymPeopleCount = json['AnonymPeopleCount'];
    }
    if (json['BowlId'] == null) {
      bowlId = null;
    } else {
          bowlId = json['BowlId'];
    }
    if (json['Bowl'] == null) {
      bowl = null;
    } else {
      bowl = new PipeAccesorySimpleDto.fromJson(json['Bowl']);
    }
    if (json['PipeId'] == null) {
      pipeId = null;
    } else {
          pipeId = json['PipeId'];
    }
    if (json['Pipe'] == null) {
      pipe = null;
    } else {
      pipe = new PipeAccesorySimpleDto.fromJson(json['Pipe']);
    }
    if (json['CoalId'] == null) {
      coalId = null;
    } else {
          coalId = json['CoalId'];
    }
    if (json['Coal'] == null) {
      coal = null;
    } else {
      coal = new PipeAccesorySimpleDto.fromJson(json['Coal']);
    }
    if (json['HeatManagementId'] == null) {
      heatManagementId = null;
    } else {
          heatManagementId = json['HeatManagementId'];
    }
    if (json['HeatManagement'] == null) {
      heatManagement = null;
    } else {
      heatManagement = new PipeAccesorySimpleDto.fromJson(json['HeatManagement']);
    }
    if (json['PackType'] == null) {
      packType = null;
    } else {
          packType = json['PackType'];
    }
    if (json['CoalCount'] == null) {
      coalCount = null;
    } else {
          coalCount = json['CoalCount'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (tobaccoId != null)
      json['TobaccoId'] = tobaccoId;
    if (tobacco != null)
      json['Tobacco'] = tobacco;
    if (tobaccoMix != null)
      json['TobaccoMix'] = tobaccoMix;
    if (tobaccoWeight != null)
      json['TobaccoWeight'] = tobaccoWeight;
    if (anonymPeopleCount != null)
      json['AnonymPeopleCount'] = anonymPeopleCount;
    if (bowlId != null)
      json['BowlId'] = bowlId;
    if (bowl != null)
      json['Bowl'] = bowl;
    if (pipeId != null)
      json['PipeId'] = pipeId;
    if (pipe != null)
      json['Pipe'] = pipe;
    if (coalId != null)
      json['CoalId'] = coalId;
    if (coal != null)
      json['Coal'] = coal;
    if (heatManagementId != null)
      json['HeatManagementId'] = heatManagementId;
    if (heatManagement != null)
      json['HeatManagement'] = heatManagement;
    if (packType != null)
      json['PackType'] = packType;
    if (coalCount != null)
      json['CoalCount'] = coalCount;
    return json;
  }

  static List<SmokeSessionMetaDataDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmokeSessionMetaDataDto>() : json.map((value) => new SmokeSessionMetaDataDto.fromJson(value)).toList();
  }

  static Map<String, SmokeSessionMetaDataDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmokeSessionMetaDataDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmokeSessionMetaDataDto.fromJson(value));
    }
    return map;
  }
}

