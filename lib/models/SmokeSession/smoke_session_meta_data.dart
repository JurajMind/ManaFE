import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/models/PipeAccesory/tobacco.dart';

class SmokeSessionMetaData {
  SmokeSessionMetaData(
      {this.id,
      this.tobaccoId,
      this.tobacco,
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
    Tobacco tobacco = Tobacco.fromJson(json['TobaccoSimpleSimpleDto']);
    PipeAccesory bowl = PipeAccesory.fromJson(json['bowl']);
    PipeAccesory pipe = PipeAccesory.fromJson(json['pipe']);

    return SmokeSessionMetaData(
        id: json['id'],
        tobaccoId: json['tobaccoId'],
        tobacco: tobacco,
        tobaccoWeight: json['tobaccoWeight'],
        anonymPeopleCount: json['anonymPeopleCount'],
        bowlId: json['bowlId'],
        bowl: bowl,
        pipe: pipe,
        pipeId: json['pipeId'],
        packType: PackType.values[json['packType']],
        heatKeeper: HeatKeeper.values[json['packType']],
        coalType: CoalType.values[json['packType']],
        coalsCount: json['coalsCount']);
  }

  int id;

  int tobaccoId;

  Tobacco tobacco;

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
