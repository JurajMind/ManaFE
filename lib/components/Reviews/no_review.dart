import 'package:app/utils/translations/app_translations.dart';
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
              AppTranslations.of(context).text('review.no_review'),
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => onAdd(),
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Text(
                    AppTranslations.of(context).text('review.add_new_review'),
                  ),
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
