import 'package:app/components/SmokeSession/session_review_view.dart';
import 'package:app/const/theme.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/module.dart';
import 'package:app/pages/SmokeSession/session_review.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewsSmall extends StatelessWidget {
  final List<SmartHookahModelsDbSessionDtoSessionReviewDto>? reviews;

  const ReviewsSmall({Key? key, this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(AppTranslations.of(context)!.text('smoke_session.review'),
                style: Theme.of(context).textTheme.headline6),
            IconButton(icon: Icon(Icons.add), onPressed: () => addSessionReview(context))
          ],
        ),
        ...reviews!.map((f) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReviewSmallItem(
                review: f,
              ));
        })
      ],
    );
  }

  addSessionReview(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true, builder: (context) => SessionReview()));
  }
}

class ReviewSmallItem extends StatelessWidget {
  final SmartHookahModelsDbSessionDtoSessionReviewDto? review;

  const ReviewSmallItem({Key? key, this.review}) : super(key: key);

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
                            rating: review!.taste! / 2,
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
                            rating: review!.smoke! / 2,
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
                            rating: review!.strength! / 2,
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
                        Text(review!.tobaccoReview?.text ?? ''),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
                width: size.width * 0.9,
                child: SessionReviewView(
                  review: review,
                  bloc: bloc,
                )),
          );
        });
  }
}
