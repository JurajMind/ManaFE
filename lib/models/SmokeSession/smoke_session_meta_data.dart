import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
import 'package:app/models/PipeAccesory/tobacco.dart';
import 'package:app/models/PipeAccesory/tobacco_mix.dart';

class SmokeSessionMetaDataSelection {
  int id;
  int tobaccoId;
  double tobaccoWeight;
  int anonymPeopleCount;

  PipeAccesorySimple bowl;
  PipeAccesorySimple pipe;
  PipeAccesorySimple heatManager;
  PipeAccesorySimple coal;
  int packType;

  SmokeSessionMetaDataSelection(
      {this.id,
      this.tobaccoId,
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
        tobaccoWeight: metadata.tobaccoWeight,
        anonymPeopleCount: metadata.anonymPeopleCount,
        bowl: PipeAccesorySimple.fromAccesory(metadata.bowl),
        pipe: PipeAccesorySimple.fromAccesory(metadata.pipe),
        heatManager: PipeAccesorySimple.fromAccesory(metadata.heatManager),
        coal: PipeAccesorySimple.fromAccesory(metadata.coals),
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
    Tobacco tobacco =
        Tobacco.fromJson(json['TobaccoSimple'] as Map<String, dynamic>);
    PipeAccesory bowl =
        PipeAccesory.fromJson(json['Bowl'] as Map<String, dynamic>);
    PipeAccesory pipe =
        PipeAccesory.fromJson(json['Pipe'] as Map<String, dynamic>);
    PipeAccesory hms =
        PipeAccesory.fromJson(json['HeatManagement'] as Map<String, dynamic>);
    PipeAccesory coal =
        PipeAccesory.fromJson(json['Coal'] as Map<String, dynamic>);

    TobaccoMix mix;
    if (json['TobaccoMix'] != null) {
      mix = TobaccoMix.fromJson(json['TobaccoMix'] as Map<String, dynamic>);
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

  Tobacco tobacco;

  TobaccoMix mix;

  double tobaccoWeight;

  int anonymPeopleCount;

  int bowlId;

  PipeAccesory bowl;

  int pipeId;

  PipeAccesory pipe;

  int coalId;

  PipeAccesory coals;

  int heatManagerId;

  PipeAccesory heatManager;

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
