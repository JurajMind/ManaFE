import 'dart:collection';

import 'package:app/models/tobacco_mix.dart';

class MixologyPage {
  final List<TobaccoMix> _tobaccoMixes;

  final int startIndex;

  MixologyPage(this._tobaccoMixes, this.startIndex);

  int get count => _tobaccoMixes.length;

  int get endIndex => startIndex + count -1;

  UnmodifiableListView<TobaccoMix> get tobaccoMixes => UnmodifiableListView<TobaccoMix>(_tobaccoMixes);

  @override
  String toString() => "_MixologyPage($startIndex-$endIndex)";


  
}