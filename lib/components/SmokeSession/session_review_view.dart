import 'package:app/components/Media/media.widget.dart';
import 'package:app/components/StarRating/m_star_ratting.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Places/place_review.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class SessionReviewView extends StatelessWidget {
  final SmartHookahModelsDbSessionDtoSessionReviewDto review;

  const SessionReviewView({Key key, this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).personBloc;
    var id = bloc.info.value.personId;
    var placeSession = review.placeReview != null;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Session:',
                style: Theme.of(context).textTheme.display2,
              ),
            ),
            MStarRating(
              title: 'Taste',
              rating: review.taste / 2,
              colorIndex: 1,
            ),
            MStarRating(
              title: 'Smoke',
              rating: review.smoke / 2,
              colorIndex: 2,
            ),
            MStarRating(
              title: 'Strength',
              rating: review.strength / 2,
              colorIndex: 0,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(review?.tobaccoReview?.text ?? '')),
            if (placeSession) ...buildPlaceReview(context),
            SizedBox(
              height: 8,
            ),
            buildMediaGrid(context),
            if (review.authorId == id)
              InkWell(
                onTap: () {
                  var sessionBloc =
                      DataProvider.getData(context).smokeSessionBloc;
                  sessionBloc
                      .removeReview(review)
                      .then((_) => Navigator.of(context).pop());
                },
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32.0),
                        bottomRight: Radius.circular(32.0)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.delete),
                      Text(
                        "Remove review",
                        style: Theme.of(context).textTheme.display2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildPlaceReview(context) {
    return [
      Divider(
        color: Colors.white,
      ),
      SizedBox(
        height: 8,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Place:',
          style: Theme.of(context).textTheme.display2,
        ),
      ),
      MStarRating(
        title: 'Ambience',
        rating: review.placeReview.ambience / 2,
        colorIndex: 0,
      ),
      MStarRating(
        title: 'Service',
        rating: review.placeReview.service / 2,
        colorIndex: 1,
      ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(review?.placeReview?.text ?? ''))
    ];
  }

  Widget buildMediaGrid(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          color: Colors.white,
        ),
        Text(
          'Media',
          style: Theme.of(context).textTheme.display2,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 250,
          child: Center(
            child: review.medias.length == 1
                ? Center(
                    child: MediaWidget(
                    review.medias[0],
                    openOnClick: true,
                  ))
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: review.medias.length,
                    itemBuilder: (context, index) {
                      var media = review.medias[index];
                      return Hero(
                          tag: "media_hero_${media.id}",
                          child: MediaWidget(
                            media,
                            openOnClick: true,
                          ));
                    },
                  ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
