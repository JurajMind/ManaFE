import 'package:app/const/theme.dart';
import 'package:app/main.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/color_picker_page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../components/Buttons/freya_circle_button.dart';
import '../animation_picker_page.dart';

class FreyaSessionControllRow extends StatelessWidget {
  const FreyaSessionControllRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var smokeSessionBloc = getIt.get<SmokeSessionBloc>();
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, mainAxisSize: MainAxisSize.max, children: <Widget>[
        Column(
          children: <Widget>[
            Container(
                child: FreyaCircleButton(
              child: Icon(Icons.remove_red_eye, color: AppColors.white, size: 50),
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context) {
                    return new AnimationPickerPage();
                  })),
            )),
          ],
        ),
        StreamBuilder<StandSettings?>(
            stream: smokeSessionBloc.standSettings,
            builder: (context, snapshot) {
              return NeumorphicButton(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                  shape: NeumorphicShape.convex,
                  color: AppColors.freyaBlack,
                  depth: 2,
                  shadowDarkColor: Colors.black,
                  border: NeumorphicBorder(isEnabled: true, width: 1, color: Colors.black87),
                ),
                tooltip: AppTranslations.of(context)!.text("tabs.mixology"),
                child: RepaintBoundary(
                  child: Image.asset(
                    'assets/rgb_circle.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                onPressed: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        return new ColorPickerPage(initData: snapshot.data);
                      }),
                ),
              );
            }),
        StreamBuilder<StandSettings?>(
            stream: smokeSessionBloc.standSettings,
            builder: (context, snapshot) {
              return InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        return new ColorPickerPage(initData: snapshot.data);
                      })),
                  child: FreyaCircleButton(
                    child: Icon(Icons.av_timer_sharp, color: AppColors.white, size: 50),
                    onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) {
                          return new AnimationPickerPage();
                        })),
                  ));
            })
      ]),
    );
  }
}
