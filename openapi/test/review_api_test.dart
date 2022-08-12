import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ReviewApi
void main() {
  final instance = Openapi().getReviewApi();

  group(ReviewApi, () {
    //Future<PlacesPlaceReviewDto> reviewAddPlaceReview(String id, PlacesPlaceReviewDto reviewDto) async
    test('test reviewAddPlaceReview', () async {
      // TODO
    });

    //Future<SmartHookahModelsDbSessionDtoSessionReviewDto> reviewAddSessionReview(int id, SmartHookahModelsDbSessionDtoSessionReviewDto reviewDto) async
    test('test reviewAddSessionReview', () async {
      // TODO
    });

    //Future<GearTobaccoReviewDto> reviewAddTobaccoReview(String id, GearTobaccoReviewDto reviewDto) async
    test('test reviewAddTobaccoReview', () async {
      // TODO
    });

    //Future<List<PlacesPlaceReviewDto>> reviewGetPlaceReviews(int id, { int pageSize, int page }) async
    test('test reviewGetPlaceReviews', () async {
      // TODO
    });

    //Future<List<SmartHookahModelsDbSessionDtoSessionReviewDto>> reviewGetSessionReview(int id, { int pageSize, int page }) async
    test('test reviewGetSessionReview', () async {
      // TODO
    });

    //Future<List<GearTobaccoReviewDto>> reviewGetTobaccoReview(int id, { int pageSize, int page }) async
    test('test reviewGetTobaccoReview', () async {
      // TODO
    });

    //Future<bool> reviewRemovePlaceReview(int id) async
    test('test reviewRemovePlaceReview', () async {
      // TODO
    });

    //Future<bool> reviewRemoveSessionReview(int id) async
    test('test reviewRemoveSessionReview', () async {
      // TODO
    });

    //Future<bool> reviewRemoveTobaccoReview(int id) async
    test('test reviewRemoveTobaccoReview', () async {
      // TODO
    });

    //Future<GearTobaccoReviewDetailDto> reviewTobaccoReviewDetail(int id) async
    test('test reviewTobaccoReviewDetail', () async {
      // TODO
    });

  });
}
