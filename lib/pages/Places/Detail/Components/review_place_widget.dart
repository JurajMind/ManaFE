import 'package:app/components/Reviews/no_review.dart';
import 'package:app/components/StarRating/star_ratting.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mix_card_expanded_shimmer.dart';
import 'package:app/pages/Places/place_review.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:openapi/api.dart';

class ReviewPlaceWidget extends StatefulWidget {
  final PlaceSimpleDto place;

  const ReviewPlaceWidget({Key key, this.place}) : super(key: key);

  @override
  _ReviewPlaceWidgetState createState() => _ReviewPlaceWidgetState();
}

class _ReviewPlaceWidgetState extends State<ReviewPlaceWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).placeSingleBloc;
    return StreamBuilder<List<PlacesPlaceReviewDto>>(
      stream: bloc.reviews,
      initialData: null,
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        }

        var itemCount = snapshot?.data?.length;
        if (itemCount != null) {
          itemCount++;
        }
        return Container(
            child: LazyLoadScrollView(
          onEndOfPage: () {
            if (!snapshot.data.contains(null)) bloc.loadReview();
          },
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: itemCount ?? 10,
            itemBuilder: (context, index) {
              if ((snapshot?.data?.length ?? 0) == 0) {
                return NoReview(
                  onAdd: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => PlaceReview(
                              place: widget.place,
                            )));
                  },
                );
              }

              if (index == 0) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Review:", style: Theme.of(context).textTheme.body1),
                    new StarRating(
                      size: 40.0,
                      rating: 2.5,
                      starCount: 5,
                      color: Colors.white,
                      borderColor: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(Icons.add, size: 40),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => PlaceReview(
                                  place: widget.place,
                                )));
                      },
                    )
                  ],
                );
              }

              if (snapshot.data != null && snapshot.data[index - 1] != null) {
                var item = snapshot.data[index - 1];
                return PlaceReviewItem(item);
              } else {
                return MixCardExpandedShimmer();
              }
            },
          ),
        ));
      },
    );
  }
}

class PlaceReviewItem extends StatelessWidget {
  final PlacesPlaceReviewDto review;

  const PlaceReviewItem(this.review, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.person),
              Text(review.author),
            ],
          ),
          new StarRating(
            size: 15.0,
            rating: review.overall / 2,
            starCount: 5,
            color: Colors.white,
            borderColor: Colors.white,
          )
        ],
      ),
      subtitle: Text(review.text ?? ''),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
