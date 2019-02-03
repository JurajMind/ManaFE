import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
import 'package:app/models/PipeAccesory/tobacco.dart';
import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/models/SmokeSession/tobacco_edit_model.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/tobacco_edit.dart';

import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TobaccoWidget extends StatelessWidget {
  final PipeAccesorySimpleDto tobacco;
  final TobaccoMixSimpleDto tobacoMix;
  final SmokeSessionBloc smokeSessionBloc;

  const TobaccoWidget({this.tobacco, this.tobacoMix, this.smokeSessionBloc});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          new StreamBuilder<SmokeStatisticDataModel>(
            stream: smokeSessionBloc.smokeStatistic,
            builder: (context, snapShot) {
              double percentage = ((snapShot?.data?.pufCount ?? 0) / 300) * 100;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'TOBACCO',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: this.tobacoMix?.tobaccos != null &&
                          this.tobacoMix.tobaccos.length > 0
                      ? tobacoMixBody(tobacoMix)
                      : tobacoBody(context, tobacco),
                ),
                Expanded(
                  child: IconButton(
                      icon: Icon(Icons.add_box),
                      onPressed: () => showTobaccoDialog(context: context)),
                  flex: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future showTobaccoDialog({BuildContext context}) async {
    TobaccoEditModel tobacco = await Navigator.of(context)
        .push(new MaterialPageRoute<TobaccoEditModel>(
            builder: (BuildContext context) {
              return new TobaccoEditWidget(
                tobaccoWeight: this
                    .smokeSessionBloc
                    .smokeSessionMetaData
                    .value
                    .tobaccoWeight
                    .toInt(),
                tobacco:
                    this.smokeSessionBloc.smokeSessionMetaData.value.tobacco,
                mix:
                    this.smokeSessionBloc.smokeSessionMetaData.value.tobaccoMix,
              );
            },
            fullscreenDialog: true));

    if (tobacco != null) this.smokeSessionBloc.setTobacco(tobacco);
  }

  Widget tobacoMixBody(TobaccoMixSimpleDto tobacoMix) {
    return MixCardExpanded(
      tobaccoMix: tobacoMix,
      noTitle: true,
    );
  }

  Column tobacoMixPart(PipeAccesorySimple tobacco) {
    return Column(
      children: <Widget>[
        Text(
          tobacco.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(tobacco.brand,
            style: TextStyle(color: Colors.black, fontSize: 10.0))
      ],
    );
  }

  Widget tobacoBody(BuildContext context, PipeAccesorySimpleDto tobacco) {
    if (tobacco == null || tobacco.id == null) {
      return new Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No tobacco'),
      );
    } else {
      return Row(
        children: <Widget>[
          Text(
            tobacco.name,
            style: Theme.of(context).textTheme.display2,
          ),
          Text(' ' + tobacco.brand)
        ],
      );
    }
  }
}
