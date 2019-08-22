import 'package:flutter/material.dart';

typedef AddCallback = void Function();

class NoReview extends StatelessWidget {
  @required
  final AddCallback onAdd;

  const NoReview({Key key, this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              'review.no_review',
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => onAdd(),
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Text('review.add_new_review'),
                  Icon(
                    Icons.add,
                    size: 40,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
