import 'package:app/components/SmokeSession/tobacco_widget.dart';
import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/models/SmokeSession/tobacco_edit_model.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/Components/freya_container.dart';
import 'package:app/pages/SmokeSession/tobacco_edit.dart';
import 'package:app/utils/translations/app_translations.dart';

import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../app/app.dart';

class TobaccoSessionWidget extends StatelessWidget {
  final PipeAccesorySimpleDto? tobacco;
  final TobaccoMixSimpleDto? tobaccoMix;
  final SmokeSessionBloc? smokeSessionBloc;
  final GlobalKey<NavigatorState>? Function(int)? callback;

  const TobaccoSessionWidget({this.tobacco, this.tobaccoMix, this.smokeSessionBloc, this.callback});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new StreamBuilder<SmokeStatisticDataModel?>(
            stream: smokeSessionBloc!.smokeStatistic,
            builder: (context, snapShot) {
              double percentage = ((snapShot.data?.pufCount ?? 0) / 300) * 100;

              if (percentage > 100) {
                percentage = 100;
              }

              percentage = 100 - percentage;
              if (App.appType == AppType.freya) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppTranslations.of(context)!.text("gear.tobacco").toUpperCase(),
                          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text(
                          percentage.toStringAsFixed(2) + '%',
                          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FreyaContainer(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LinearPercentIndicator(
                            width: 200.0,
                            lineHeight: 8.0,
                            barRadius: Radius.circular(10),
                            percent: percentage / 100,
                            progressColor: Color(0xffb40002),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    AppTranslations.of(context)!.text("gear.tobacco").toUpperCase(),
                    style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  LinearPercentIndicator(
                    width: 200.0,
                    lineHeight: 4.0,
                    backgroundColor: Colors.grey,
                    percent: percentage / 100,
                    progressColor: Colors.white,
                  ),
                  Text(percentage.toStringAsFixed(2) + '%')
                ],
              );
            },
          ),
          TobaccoWidget(
            tobacco: this.tobacco,
            tobaccoMix: this.tobaccoMix,
            onPressed: (context) => showTobaccoDialog(context),
          )
        ],
      ),
    );
  }

  showTobaccoDialog(BuildContext context) async {
    TobaccoEditModel? tobacco = await Navigator.of(context).push(new MaterialPageRoute<TobaccoEditModel>(
        builder: (BuildContext context) {
          return new TobaccoEditWidget(
            callback: callback,
            tobaccoWeight: this.smokeSessionBloc!.smokeSessionMetaData.value!.tobaccoWeight!.toInt(),
            tobacco: this.smokeSessionBloc!.smokeSessionMetaData.value!.tobacco,
            mix: this.smokeSessionBloc!.smokeSessionMetaData.value!.tobaccoMix,
          );
        },
        fullscreenDialog: true));

    if (tobacco != null) this.smokeSessionBloc!.setTobacco(tobacco);
  }
}
