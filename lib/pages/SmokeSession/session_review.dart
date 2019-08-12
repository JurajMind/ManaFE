import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SessionReview extends StatefulWidget {
  SessionReview({Key key}) : super(key: key);

  _SessionReviewState createState() => _SessionReviewState();
}

class _SessionReviewState extends State<SessionReview> {
  double quality = 2.5;
  double taste = 2.5;
  double smoke = 2.5;
  double ambience = 2.5;
  double service = 2.5;
  double speed = 2.5;

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).smokeSessionBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTranslations.of(context).text("review.session_title"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (bloc.smokeSessionMetaData.value.tobacco != null ||
                bloc.smokeSessionMetaData.value.tobaccoMix != null) ...{
              Text(
                'Tobacco not filled, please fill tobacco metadata for precision data:',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display4,
              ),
            },
            Text(
              'Session:',
              style: Theme.of(context).textTheme.body2,
            ),
            MStarRating(
              title: 'Taste',
              rating: taste,
              colorIndex: 1,
              onRatingChanged: (r) => setState(() {
                taste = r;
              }),
            ),
            MStarRating(
              title: 'Smoke',
              rating: smoke,
              colorIndex: 2,
              onRatingChanged: (r) => setState(() {
                smoke = r;
              }),
            ),
            MStarRating(
              title: 'Strength',
              rating: quality,
              colorIndex: 0,
              onRatingChanged: (r) => setState(() {
                quality = r;
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: new InputDecoration(
                    hintText: 'Smoke note',
                    labelText: 'Smoke note',
                    labelStyle: Theme.of(context).textTheme.display2,
                    enabledBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white)),
                    focusedBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white)),
                    icon: Icon(Icons.edit, color: Colors.white)),
              ),
            ),
            Text(
              'Place:',
              style: Theme.of(context).textTheme.body2,
            ),
            MStarRating(
              title: 'Ambience',
              rating: ambience,
              colorIndex: 0,
              onRatingChanged: (r) => setState(() {
                ambience = r;
              }),
            ),
            MStarRating(
              title: 'Service',
              rating: service,
              colorIndex: 1,
              onRatingChanged: (r) => setState(() {
                service = r;
              }),
            ),
            MStarRating(
              title: 'Speed',
              rating: speed,
              colorIndex: 2,
              onRatingChanged: (r) => setState(() {
                speed = r;
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: new InputDecoration(
                    hintText: 'Place note',
                    labelText: 'Place note',
                    labelStyle: Theme.of(context).textTheme.display2,
                    enabledBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white)),
                    focusedBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white)),
                    icon: Icon(Icons.edit, color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            MButton(
              label: "common.save",
              icon: Icons.save,
              onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}

class MStarRating extends StatelessWidget {
  final double rating;
  final String title;
  final int colorIndex;
  final RatingChangeCallback onRatingChanged;
  const MStarRating(
      {Key key,
      this.rating,
      this.title,
      this.colorIndex = 0,
      this.onRatingChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              "$title : ",
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          SmoothStarRating(
              allowHalfRating: true,
              onRatingChanged: onRatingChanged,
              starCount: 5,
              rating: rating,
              size: 40.0,
              color: AppColors.colors[colorIndex],
              borderColor: AppColors.colors[colorIndex],
              spacing: 0.0)
        ],
      )),
    );
  }
}
