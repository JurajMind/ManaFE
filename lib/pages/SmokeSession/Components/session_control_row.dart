import 'package:app/const/theme.dart';
import 'package:app/main.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/color_picker_page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

import '../../../models/SmokeSession/smoke_session.dart';
import '../animation_picker_page.dart';

class SessionControllRow extends StatelessWidget {
  const SessionControllRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var smokeSessionBloc = getIt.get<SmokeSessionBloc>();
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, mainAxisSize: MainAxisSize.max, children: <Widget>[
      InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return new AnimationPickerPage(
                actions: [SmokeState.idle, SmokeState.blow, SmokeState.puf],
              );
            })),
        child: Column(
          children: <Widget>[
            Container(
              child: Icon(Icons.list, color: AppColors.colors[1], size: 50),
            ),
            Text(
              AppTranslations.of(context)!.text('smoke_session.animations'),
              style: Theme.of(context).textTheme.titleLarge!.apply(color: AppColors.colors[1]),
            )
          ],
        ),
      ),
      StreamBuilder<StandSettings?>(
          stream: smokeSessionBloc.standSettings,
          builder: (context, snapshot) {
            var color = snapshot.data?.idle?.color?.toColor() ?? AppColors.colors[3];
            return InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context) {
                    return new ColorPickerPage(initData: snapshot.data);
                  })),
              child: Column(
                children: <Widget>[
                  Icon(Icons.color_lens, color: color, size: 50),
                  StreamBuilder<StandSettings?>(
                      stream: smokeSessionBloc.standSettings,
                      builder: (context, snapshot) {
                        return Text(AppTranslations.of(context)!.text('smoke_session.colors'),
                            style: Theme.of(context).textTheme.titleLarge!.apply(color: color));
                      })
                ],
              ),
            );
          })
    ]);
  }
}
