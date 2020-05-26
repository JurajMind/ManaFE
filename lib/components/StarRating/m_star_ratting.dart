import 'package:app/const/theme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

typedef void RatingChangeCallback(double rating);

class MStarRating extends StatelessWidget {
  final double rating;
  final String title;
  final int colorIndex;
  final RatingChangeCallback onRatingChanged;
  final int starSize;
  final TextStyle textStyle;
  const MStarRating({Key key, this.rating, this.title, this.colorIndex = 0, this.onRatingChanged, this.starSize = 30, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 300.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  "$title : ",
                  style: textStyle ?? Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SmoothStarRating(
                  allowHalfRating: true,
                  onRated: onRatingChanged,
                  starCount: 5,
                  rating: rating,
                  size: starSize + 0.0,
                  color: AppColors.colors[colorIndex],
                  borderColor: AppColors.colors[colorIndex],
                  spacing: 0.0)
            ],
          )),
    );
  }
}
