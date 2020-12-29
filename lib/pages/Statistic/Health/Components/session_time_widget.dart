import 'package:app/Helpers/date_utils.dart' as dateUtils;
import 'package:app/module/data_provider.dart';
import 'package:app/module/person/statistic_bloc.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

class SessionTimeWidget extends StatelessWidget {
  const SessionTimeWidget({
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
              AppTranslations.of(context).text('health.time'),
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            Text(AppTranslations.of(context).text('health.time_text')),
            SizedBox(
              height: 10,
            ),
            StreamBuilder<StatisticRecap>(
                stream: bloc.recap,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container();
                  }
                  return Text(dateUtils.DateUtils.toStrungLongDuration(context, snapshot.data.smokingTime), style: Theme.of(context).textTheme.headline6);
                })
          ],
        ),
      ),
    );
  }
}
