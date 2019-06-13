import 'package:app/const/theme.dart';
import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/Components/picker_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomControllBar extends StatelessWidget {
  final SmokeState state;
  final bool haveLeftChevron;
  final bool haveRightChevron;
  final String label;

  const BottomControllBar({
    Key key,
    this.state,
    this.haveLeftChevron,
    this.haveRightChevron,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sessionBlock = DataProvider.getData(context).smokeSessionBloc;
    return StreamBuilder<StandSettings>(
        stream: sessionBlock.standSettings,
        initialData: StandSettings.empty(),
        builder: (context, snapshot) {
          var setting = snapshot.data.getStateSetting(state);
          return new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              haveLeftChevron ?? true
                  ? Icon(Icons.chevron_left)
                  : Container(
                      width: 20.0,
                    ),
              InkWell(
                onTap: () => showBrDialog(context, setting, sessionBlock),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                  child: Icon(Icons.settings_brightness),
                ),
              ),
              Text(
                label,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              ),
              InkWell(
                onTap: () => showSpeedDialog(context, setting, sessionBlock),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                  child: Icon(Icons.shutter_speed),
                ),
              ),
              haveRightChevron ?? true
                  ? Icon(Icons.chevron_right)
                  : Container(
                      width: 20.0,
                    )
            ],
          );
        });
  }

  Future<void> showSpeedDialog(
      BuildContext context, StateSetting setting, SmokeSessionBloc bloc) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) => new SizedBox(
            width: 20.0,
            height: MediaQuery.of(context).size.height - 80,
            child: SimpleDialog(
              elevation: 2.0,
              backgroundColor: Colors.transparent,
              title: Center(child: const Text('Speed')),
              children: <Widget>[
                SizedBox(
                  height: 400.0,
                  width: 200.0,
                  child: SpringySlider(
                    markCount: 12,
                    positiveColor: AppColors.colors[0],
                    negativeColor: AppColors.colors[1],
                    positiveIcon: Icons.pause,
                    negativeIcon: Icons.fast_forward,
                    minValue: 0.0,
                    maxValue: 255.0,
                    initValue: 255.0 - setting.speed,
                    onChanged: (value) =>
                        bloc.setSpeed(255 - value.round(), state),
                  ),
                )
              ],
            )));
  }

  Future<void> showBrDialog(
      BuildContext context, StateSetting setting, SmokeSessionBloc bloc) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) => new SizedBox(
            width: 20.0,
            height: MediaQuery.of(context).size.height - 80,
            child: SimpleDialog(
              title: Center(child: const Text('Brightness')),
              backgroundColor: Colors.transparent,
              children: <Widget>[
                SizedBox(
                  height: 400.0,
                  width: 200.0,
                  child: SpringySlider(
                    markCount: 12,
                    positiveColor: AppColors.colors[2],
                    negativeColor: AppColors.colors[3],
                    positiveIcon: FontAwesomeIcons.moon,
                    negativeIcon: FontAwesomeIcons.sun,
                    minValue: 0.0,
                    maxValue: 255.0,
                    initValue: setting.brightness + 0.0,
                    onChanged: (value) =>
                        bloc.setBrigtness(value.round(), state),
                  ),
                )
              ],
            )));
  }
}
