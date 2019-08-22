import 'package:app/components/Reviews/no_review.dart';
import 'package:app/components/Reviews/tobacco_review_item.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class TobaccoReviewList extends StatelessWidget {
  final List<GearTobaccoReviewDto> reviews;
  final bool label;
  final TobaccoInformationDto info;

  const TobaccoReviewList({Key key, this.reviews, this.label = false, this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<GearTobaccoReviewDto> data = null;
    if (info != null) {
      if (info.reviews == null) {
        data = new List<GearTobaccoReviewDto>();
      }
      else{
        data = info.reviews;
      }
    } else {
      data = reviews;
    }

    if (data == null) {
      return Center(
          child: SizedBox(
              height: 60, width: 60, child: CircularProgressIndicator()));
    }

    if ((data.length) == 0) {
      return Column(
        children: <Widget>[
          if (label) ...{
            Text(
              AppTranslations.of(context).text('review.session_title'),
              style: Theme.of(context).textTheme.display1,
            )
          },
          NoReview(onAdd: () {}),
        ],
      );
    }

    return Container(
        child: Column(
      children: <Widget>[
        if (label) ...{
          Text(
            AppTranslations.of(context).text('review.session_title'),
            style: Theme.of(context).textTheme.display1,
          )
        },
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Reviews :", style: Theme.of(context).textTheme.display2),
            IconButton(
              icon: Icon(Icons.add, size: 40),
              onPressed: () {},
            )
          ],
        ),
        ...data.map((f) => TobaccoReviewItem(
              review: f,
            ))
      ],
    ));
  }
}
