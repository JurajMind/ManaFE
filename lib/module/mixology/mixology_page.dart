import 'dart:collection';
import 'package:openapi/api.dart';

class MixologyPage {
  final List<TobaccoMixSimpleDto> _tobaccoMixes;

  final int startIndex;

  MixologyPage(this._tobaccoMixes, this.startIndex);

  int get count => _tobaccoMixes.length;

  int get endIndex => startIndex + count - 1;

  UnmodifiableListView<TobaccoMixSimpleDto> get tobaccoMixes =>
      UnmodifiableListView<TobaccoMixSimpleDto>(_tobaccoMixes);

  @override
  String toString() => "_MixologyPage($startIndex-$endIndex)";
}
