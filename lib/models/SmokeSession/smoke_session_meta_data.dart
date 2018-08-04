import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/models/PipeAccesory/tobacco.dart';
import 'package:app/models/PipeAccesory/tobacco_mix.dart';

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
      this.heatKeeper,
      this.coalType,
      this.coalsCount});

  factory SmokeSessionMetaData.fromJson(Map<String, dynamic> json) {
    Tobacco tobacco =
        Tobacco.fromJson(json['TobaccoSimple'] as Map<String, dynamic>);
    PipeAccesory bowl =
        PipeAccesory.fromJson(json['Bowl'] as Map<String, dynamic>);
    PipeAccesory pipe =
        PipeAccesory.fromJson(json['Pipe'] as Map<String, dynamic>);

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
        heatKeeper: HeatKeeper.values[json['PackType']],
        coalType: CoalType.values[json['PackType']],
        coalsCount: json['CoalsCount']);
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
