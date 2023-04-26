import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'dart:math' as math;

class InMixList extends StatelessWidget {
  final List<TobaccoMixSimpleDto>? mixes;
  final int? sourceTobacco;
  final VoidCallback? onPressed;
  final int mixCount;

  const InMixList({Key? key, this.mixes, this.onPressed, this.mixCount = 5, this.sourceTobacco}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mixes == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    var sc = math.min(mixes!.length, mixCount);

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
                    AppTranslations.of(context)!.text("mix.used_in_mixes"),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(Icons.pie_chart)
                ],
              ),
            ),
          ),
          if (mixes!.length == 0)
            Text(
              'smoke_session.no_smoke_session',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          if (mixes!.length > 0) ...{
            ...mixes!.take(sc).map((s) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: MixCardExpanded(
                    tobaccoMix: s,
                    highlightId: sourceTobacco,
                  ),
                )),
          },
          if (mixes!.length > 0 && mixes!.length >= sc)
            MButton(
                iconColor: Colors.red,
                icon: Icons.clear_all,
                label: AppTranslations.of(context)!.text("mix.all_ussage_in_mix"),
                onPressed: onPressed),
        ]),
      ),
    );
  }
}
