import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/components/StarRating/m_star_ratting.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/module.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class PlaceReview extends StatefulWidget {
  final PlaceSimpleDto place;
  PlaceReview({Key key, this.place}) : super(key: key);

  _PlaceReviewState createState() => _PlaceReviewState();
}

class _PlaceReviewState extends State<PlaceReview> {
  double ambience = 2.5;
  double service = 2.5;
  double overall = 2.5;
  bool posting = false;
  TextEditingController controller;

  @override
  initState() {
    controller = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTranslations.of(context).text("review.place_review"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
              title: 'Overall',
              rating: overall,
              colorIndex: 2,
              onRatingChanged: (r) => setState(() {
                overall = r;
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: new InputDecoration(
                    hintText: 'Place note',
                    labelText: 'Place note',
                    labelStyle: Theme.of(context).textTheme.headline5,
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
            posting
                ? CircularProgressIndicator()
                : MButton(
                    label: "common.save",
                    icon: Icons.save,
                    onPressed: () async {
                      var bloc = getIt.get<PlaceBloc>();

                      var review = new PlacesPlaceReviewDto();
                      review.placeId = widget.place.id;
                      review.ambience = (ambience * 2).toInt();
                      review.service = (service * 2).toInt();
                      review.overall = (overall * 2).toInt();
                      review.text = controller.text;
                      setState(() {
                        posting = true;
                      });
                      await bloc.addReview(widget.place.id, review).then((_) {
                        Navigator.of(context).pop();
                      });
                    },
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
