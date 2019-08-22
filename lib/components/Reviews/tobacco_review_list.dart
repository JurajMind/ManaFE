import 'package:app/components/Reviews/no_review.dart';
import 'package:app/components/Reviews/tobacco_review_item.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class TobaccoReviewList extends StatelessWidget {
  final List<GearTobaccoReviewDto> reviews;

  const TobaccoReviewList({Key key, this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (reviews == null) {
      return CircularProgressIndicator();
    }

    if ((reviews.length) == 0) {
      return NoReview(onAdd: () {});
    }

    return Container(
        child: Column(
      children: <Widget>[
        Text('Reviews'),
        ...reviews.map((f) => TobaccoReviewItem(
              review: f,
            ))
      ],
    ));
  }
}
