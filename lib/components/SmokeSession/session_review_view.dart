import 'package:app/components/Media/media.widget.dart';
import 'package:app/components/StarRating/m_star_ratting.dart';
import 'package:app/main.dart';
import 'package:app/module/person/person_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class SessionReviewView extends StatelessWidget {
  final SmartHookahModelsDbSessionDtoSessionReviewDto? review;
  final GearTobaccoReviewDto? gearReview;
  final PersonBloc? bloc;

  const SessionReviewView({Key? key, this.review, this.gearReview, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taste = review?.taste ?? gearReview?.taste ?? 0;
    var smoke = review?.smoke ?? gearReview?.smoke ?? 0;
    var strength = review?.strength ?? gearReview?.strength ?? 0;
    var authorId = review?.authorId ?? 0;
    var medias = review?.medias ?? gearReview!.medias ?? [];
    var text = review?.tobaccoReview?.text ?? gearReview!.text ?? '';

    var id = bloc!.info.value.personId;
    var placeSession = review?.placeReview != null;
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
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            MStarRating(
              title: 'Taste',
              rating: taste / 2,
              colorIndex: 1,
            ),
            MStarRating(
              title: 'Smoke',
              rating: smoke / 2,
              colorIndex: 2,
            ),
            MStarRating(
              title: 'Strength',
              rating: strength / 2,
              colorIndex: 0,
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(text)),
            if (placeSession) ...buildPlaceReview(context),
            SizedBox(
              height: 8,
            ),
            buildMediaGrid(medias, context),
            if (authorId == id)
              InkWell(
                onTap: () {
                  var sessionBloc = getIt.get<SmokeSessionBloc>();
                  sessionBloc.removeReview(review!);
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(32.0), bottomRight: Radius.circular(32.0)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.delete),
                      Text(
                        "Remove review",
                        style: Theme.of(context).textTheme.headline5,
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
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      MStarRating(
        title: 'Ambience',
        rating: review!.placeReview!.ambience! / 2,
        colorIndex: 0,
      ),
      MStarRating(
        title: 'Service',
        rating: review!.placeReview!.service! / 2,
        colorIndex: 1,
      ),
      Padding(padding: const EdgeInsets.all(8.0), child: Text(review?.placeReview?.text ?? ''))
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
          style: Theme.of(context).textTheme.headline5,
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
                    medias[0],
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
