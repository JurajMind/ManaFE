import 'package:app/components/Media/media.widget.dart';
import 'package:app/components/StarRating/m_star_ratting.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class ReviewView extends StatelessWidget {
  final SmartHookahModelsDbSessionDtoSessionReviewDto review;
  final PlacesPlaceReviewDto placeReview;

  const ReviewView({Key key, this.review, this.placeReview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).personBloc;
    var id = bloc.info.value.personId;

    var pReview = review?.placeReview ?? placeReview;
    var medias = List<MediaDto>();

    if(review?.medias != null){
      medias.addAll(review?.medias);
    }
    
    if(placeReview?.medias != null){
      medias.addAll(placeReview?.medias);
    }
    
    var authorId = review?.authorId ?? placeReview.authorId;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (review != null) ...{
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
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 8,
              ),
            },
            if (pReview != null) ...buildPlaceReview(context, pReview),
            SizedBox(
              height: 8,
            ),
            buildMediaGrid(medias, context),
            if (authorId == id)
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

  List<Widget> buildPlaceReview(context, PlacesPlaceReviewDto pReview) {
    return [
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
        rating: pReview.ambience / 2,
        colorIndex: 0,
      ),
      MStarRating(
        title: 'Service',
        rating: pReview.service / 2,
        colorIndex: 1,
      ),
      Padding(
          padding: const EdgeInsets.all(8.0), child: Text(pReview?.text ?? ''))
    ];
  }

  Widget buildMediaGrid(List<MediaDto> medias, BuildContext context) {
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
            child: medias.length == 1
                ? Center(
                    child: MediaWidget(
                    review.medias[0],
                    openOnClick: true,
                  ))
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: medias.length,
                    itemBuilder: (context, index) {
                      var media = medias[index];
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
