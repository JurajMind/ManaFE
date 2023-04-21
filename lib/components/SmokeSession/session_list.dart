import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/components/SmokeSession/smoke_session_list_item.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'dart:math' as math;

class SessionList extends StatelessWidget {
  final List<SmokeSessionSimpleDto>? sessions;
  final VoidCallback? onPressed;
  final int sessionCount;
  final TobaccoInformationDto? info;

  const SessionList({Key? key, this.sessions, this.onPressed, this.sessionCount = 5, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SmokeSessionSimpleDto>? data;
    if (info != null) {
      if (info!.smokeSessions == null) {
        data = <SmokeSessionSimpleDto>[];
      } else {
        data = info!.smokeSessions;
      }
    } else {
      data = sessions;
    }

    if (data == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    var sc = math.min(data.length, sessionCount);

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 800),
        child: Column(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'Sessions',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(Icons.list)
                ],
              ),
            ),
          ),
          if (data.length == 0)
            Text(
              AppTranslations.of(context)!.text('smoke_session.no_smoke_session'),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          if (data.length > 0) ...{
            ...data.take(sc).map((s) => SmokeSessionListItem(session: s)),
          },
          if (data.length > 0 && data.length > sc)
            MButton(
                iconColor: Colors.red,
                icon: Icons.clear_all,
                label: AppTranslations.of(context)!.text('smoke_session.all_session'),
                onPressed: onPressed),
        ]),
      ),
    );
  }
}
