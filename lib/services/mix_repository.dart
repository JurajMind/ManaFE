import 'dart:async';

import 'package:app/models/tobacco_mix.dart';

abstract class MixRepository {
  Future<List<TobaccoMix>> fetch();
  }
  
class MockMixRepository implements MixRepository{

  Future<List<TobaccoMix>> fetch(){
    return new Future.value(staticMix);
  }
}

const staticMix = const <TobaccoMix>[
    const TobaccoMix(
     'TestMix1'
    ),
    const TobaccoMix(
    'TestMix2'
    )
];