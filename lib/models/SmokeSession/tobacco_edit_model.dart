import 'package:openapi/api.dart';

class TobaccoEditModel {
  TobaccoEditModel({this.tobacco, this.weight, this.mix});

  PipeAccesorySimpleDto tobacco;
  int weight;
  TobaccoMixSimpleDto mix;
}
