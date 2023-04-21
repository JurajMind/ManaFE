import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

class SmokeIntakeWidget extends StatelessWidget {
  const SmokeIntakeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              AppTranslations.of(context)!.text('health.gas'),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 10,
            ),
            Text(AppTranslations.of(context)!.text('health.gas_text')),
          ],
        ),
      ),
    );
  }
}
