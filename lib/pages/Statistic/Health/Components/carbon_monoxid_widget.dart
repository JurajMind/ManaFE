import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/utils/translations/app_translations.dart';

import 'package:flutter/material.dart';

import 'package:openapi/openapi.dart';

class CarbonMonoxideWidget extends StatelessWidget {
  final DateTime? from;
  final DateTime? to;
  const CarbonMonoxideWidget(
    this.from,
    this.to, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context)!.statisticBloc;
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              AppTranslations.of(context)!.text('health.co'),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 10,
            ),
            Text(AppTranslations.of(context)!.text('health.co_text')),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              child: StreamBuilder<List<SmokeSessionSimpleDto>?>(
                  stream: bloc.smokeSessions,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container();
                    }

                    var days = to!.difference(from!).inDays;
                    var hookah = snapshot.data!.length;
                    var value = num.parse((hookah / days).toStringAsFixed(1));
                    return Placeholder();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
