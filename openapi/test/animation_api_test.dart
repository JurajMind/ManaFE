import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AnimationApi
void main() {
  final instance = Openapi().getAnimationApi();

  group(AnimationApi, () {
    //Future<Animations> animationGetAnimations(String id) async
    test('test animationGetAnimations', () async {
      // TODO
    });

  });
}
