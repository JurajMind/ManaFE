import 'package:app/services/mix_repository.dart';

enum Flavor {
  MOCK,
  PRO
}

/// Simple DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  MixRepository get tobaccoMixRepository {
    switch(_flavor) {
      case Flavor.MOCK: return new MockMixRepository();
      default: // Flavor.PRO:
       return new MockMixRepository();
    }
  }
}