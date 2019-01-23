import 'package:app/components/StarRating/star_ratting.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MixCardExpandedShimmer extends StatelessWidget {
  const MixCardExpandedShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400],
      highlightColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(
                  Icons.add,
                ),
                Expanded(flex: 1, child: Container(width: 1.0,height: 12.0, color:Colors.white)),
                Expanded(flex: 1, child: Container(width: 1.0,height: 12.0)),
                Expanded(
                    flex: 1,
                    child: new StarRating(
                      size: 15.0,
                      rating: 0.0,
                      starCount: 5,
                      color: Colors.white,
                      borderColor: Colors.white,
                    )),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 45.0,
                      ),
                    ),
                  ),
                ],
              ),
              elevation: 8.0,
              margin: EdgeInsets.zero,
            )
          ],
        ),
      ),
    );
  }
}
