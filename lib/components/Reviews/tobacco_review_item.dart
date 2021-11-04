import 'package:app/components/SmokeSession/session_review_view.dart';
import 'package:app/const/theme.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/module.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TobaccoReviewItem extends StatelessWidget {
  final GearTobaccoReviewDto review;

  const TobaccoReviewItem({Key key, this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openAlertBox(context),
      child: Container(
          child: ListTile(
              title: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Text('Taste:'),
                        SmoothStarRating(
                            allowHalfRating: true,
                            starCount: 5,
                            rating: review.taste / 2,
                            size: 16.0,
                            color: AppColors.colors[1],
                            borderColor: AppColors.colors[1],
                            spacing: 0.0)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Text('Smoke:'),
                        SmoothStarRating(
                            allowHalfRating: true,
                            starCount: 5,
                            rating: review.smoke / 2,
                            size: 16.0,
                            color: AppColors.colors[2],
                            borderColor: AppColors.colors[2],
                            spacing: 0.0)
                      ],
                    ),
                  )
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Text('Strength:'),
                        SmoothStarRating(
                            allowHalfRating: true,
                            starCount: 5,
                            rating: review.strength / 2,
                            size: 18.0,
                            color: AppColors.colors[0],
                            borderColor: AppColors.colors[0],
                            spacing: 0.0)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.edit),
                        Text(review.text),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }

  openAlertBox(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bloc = getIt.get<PersonBloc>();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                  width: size.width * 0.9,
                  child: SessionReviewView(
                    gearReview: this.review,
                    bloc: bloc,
                  )));
        });
  }
}
