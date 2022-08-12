import 'package:openapi/openapi.dart';

class TobaccoEditModel {
  TobaccoEditModel({this.tobacco, this.weight, this.mix});

  PipeAccesorySimpleDto? tobacco;
  int? weight;
  TobaccoMixSimpleDto? mix;
}
