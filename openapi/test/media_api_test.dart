import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for MediaApi
void main() {
  final instance = Openapi().getMediaApi();

  group(MediaApi, () {
    //Future<MediaDto> mediaAddGearPicture(int id, MultipartFile file) async
    test('test mediaAddGearPicture', () async {
      // TODO
    });

    //Future<MediaDto> mediaAddPlacePicture(int id, MultipartFile file) async
    test('test mediaAddPlacePicture', () async {
      // TODO
    });

    //Future<MediaDto> mediaAddPlaceReview(int id, MultipartFile file) async
    test('test mediaAddPlaceReview', () async {
      // TODO
    });

    //Future<MediaDto> mediaAddSessionReview(int id, MultipartFile file) async
    test('test mediaAddSessionReview', () async {
      // TODO
    });

  });
}
