import 'package:app/Helpers/date_utils.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class LastHookahWidget extends StatelessWidget {
  const LastHookahWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).statisticBloc;
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              AppTranslations.of(context).text('health.last_hookah'),
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            Text(AppTranslations.of(context).text('health.last_hookah_text')),
            SizedBox(
              height: 10,
            ),
            StreamBuilder<List<SmokeSessionSimpleDto>>(
                stream: bloc.smokeSessions,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container();
                  }

                  if (snapshot.data.length == 0) {
                    return Container();
                  }

                  var lastSession = snapshot.data.first;
                  var startTime = new DateTime.fromMillisecondsSinceEpoch(lastSession.statistic.start);
                  var since = DateTime.now().difference(startTime);

                  return Text(DateUtils.toStrungLongDuration(context, since), style: Theme.of(context).textTheme.headline6);
                })
          ],
        ),
      ),
    );
  }
}
