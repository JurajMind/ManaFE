import 'package:app/models/PipeAccesory/tobacco.dart';
import 'package:app/models/PipeAccesory/tobacco_mix.dart';
import 'package:openapi/api.dart';

class SmokeSessionMetaDataSelection {
  int id;
  int tobaccoId;
  double tobaccoWeight;
  int anonymPeopleCount;

  PipeAccesorySimpleDto bowl;
  PipeAccesorySimpleDto pipe;
  PipeAccesorySimpleDto heatManager;
  PipeAccesorySimpleDto coal;
  PipeAccesorySimpleDto tobacco;
  int packType;

  SmokeSessionMetaDataSelection(
      {this.id,
      this.tobaccoId,
      this.tobacco,
      this.tobaccoWeight,
      this.anonymPeopleCount,
      this.bowl,
      this.pipe,
      this.heatManager,
      this.coal,
      this.packType});

  factory SmokeSessionMetaDataSelection.fromMetadata(
      SmokeSessionMetaData metadata) {
    return new SmokeSessionMetaDataSelection(
        id: metadata.id,
        tobaccoId: metadata.tobaccoId,
        tobacco: metadata.tobacco,
        tobaccoWeight: metadata.tobaccoWeight,
        anonymPeopleCount: metadata.anonymPeopleCount,
        bowl: metadata.bowl,
        pipe: metadata.pipe,
        heatManager: metadata.heatManager,
        coal: metadata.coals,
        packType: PackType.values.indexOf(metadata.packType));
  }
}

class SmokeSessionMetaData {
  SmokeSessionMetaData(
      {this.id,
      this.tobaccoId,
      this.tobacco,
      this.mix,
      this.tobaccoWeight,
      this.anonymPeopleCount,
      bowlId,
      this.bowl,
      this.pipeId,
      this.pipe,
      this.packType,
      this.heatManagerId,
      this.heatManager,
      this.coalId,
      this.coals,
      this.coalsCount});

  factory SmokeSessionMetaData.fromJson(Map<String, dynamic> json) {
    PipeAccesorySimpleDto tobacco = PipeAccesorySimpleDto.fromJson(
        json['TobaccoSimple'] as Map<String, dynamic>);
    PipeAccesorySimpleDto bowl =
        PipeAccesorySimpleDto.fromJson(json['Bowl'] as Map<String, dynamic>);
    PipeAccesorySimpleDto pipe =
        PipeAccesorySimpleDto.fromJson(json['Pipe'] as Map<String, dynamic>);
    PipeAccesorySimpleDto hms = PipeAccesorySimpleDto.fromJson(
        json['HeatManagement'] as Map<String, dynamic>);
    PipeAccesorySimpleDto coal =
        PipeAccesorySimpleDto.fromJson(json['Coal'] as Map<String, dynamic>);

    TobaccoMixSimpleDto mix;
    if (json['TobaccoMix'] != null) {
      mix = TobaccoMixSimpleDto.fromJson(
          json['TobaccoMix'] as Map<String, dynamic>);
    }

    return SmokeSessionMetaData(
        id: json['Id'],
        tobaccoId: json['TobaccoId'],
        tobacco: tobacco,
        mix: mix,
        tobaccoWeight: json['TobaccoWeight'],
        anonymPeopleCount: json['AnonymPeopleCount'],
        bowlId: json['BowlId'],
        bowl: bowl,
        pipe: pipe,
        pipeId: json['PipeId'],
        packType: PackType.values[json['PackType']],
        heatManager: hms,
        heatManagerId: json['HeatManagementId'],
        coalId: json['CoalId'],
        coals: coal,
        coalsCount: json['CoalCount']);
  }

  int id;

  int tobaccoId;

  PipeAccesorySimpleDto tobacco;

  TobaccoMixSimpleDto mix;

  double tobaccoWeight;

  int anonymPeopleCount;

  int bowlId;

  PipeAccesorySimpleDto bowl;

  int pipeId;

  PipeAccesorySimpleDto pipe;

  int coalId;

  PipeAccesorySimpleDto coals;

  int heatManagerId;

  PipeAccesorySimpleDto heatManager;

  PackType packType;
  //enum packTypeEnum {  0,  1,  2,  3,  4,  };

  HeatKeeper heatKeeper;
  //enum heatKeeperEnum {  0,  1,  2,  3,  4,  5,  };

  CoalType coalType;
  //enum coalTypeEnum {  0,  1,  2,  3,  };

  double coalsCount;
}

enum HeatKeeper {
  Unknown,
  Foil,
  HMS,
  Ignis,
  Kazach,
  Badcha,
}

enum PackType {
  Unknown,
  Fluffy,
  SemiDense,
  Dense,
  OverPack,
}

enum CoalType {
  Unknown,
  InstantLight,
  Coconut,
  Bamboo,
}
