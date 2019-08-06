import 'package:app/components/StarRating/star_ratting.dart';
import 'package:flutter/material.dart';

class ReviewPlaceWidget extends StatefulWidget {
  @override
  _ReviewPlaceWidgetState createState() => _ReviewPlaceWidgetState();
}

class _ReviewPlaceWidgetState extends State<ReviewPlaceWidget> {
  List<int> reviews;

  @override
  void initState() {
    reviews = List<int>.generate(100, (i) {
      return i;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
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
              Icon(Icons.add,size:40)
            ],
          ),
          ...reviews.map((f) => PlaceReviewItem())
        ],
      ),
    );
  }
}

class PlaceReviewItem extends StatelessWidget {
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
              Text('Jack black'),
            ],
          ),
          new StarRating(
            size: 15.0,
            rating: 2.5,
            starCount: 5,
            color: Colors.white,
            borderColor: Colors.white,
          )
        ],
      ),
      subtitle: Text('It is simple and straight-forward to use list generate. Even though, it doesn’t work in all cases, it comes very handy in many situations.'),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
