import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
import 'package:app/models/PipeAccesory/tobacco.dart';
import 'package:app/models/PipeAccesory/tobacco_mix.dart';
import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/tobacco_search.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TobaccoWidget extends StatelessWidget {
  final Tobacco tobacco;
  final TobaccoMix tobacoMix;
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
              double percentage = (snapShot.data.pufCount / 300) * 100;

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
                  child: this.tobacoMix != null
                      ? tobacoMixBody(tobacoMix)
                      : tobacoBody(tobacco),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.add_box),
                    onPressed: () => showDemoDialog(
                        context: context,
                        child: new TobaccoSearch(
                          ownAccesories: new List<PipeAccesory>(),
                        )),
                  ),
                  flex: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showDemoDialog({BuildContext context, Widget child}) {
    showDialog<PipeAccesorySimple>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((PipeAccesorySimple value) {
      if (value != null) {}
    });
  }

  Widget tobacoMixBody(TobaccoMix tobacoMix) {
    return Column(
      children: <Widget>[
        tobacoMix.name != null ? Text(tobacoMix.name) : Container(),
        new Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(30.0)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: tobacoMix.tobaccos.map((f) {
                return tobacoMixPart(f.item1);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Column tobacoMixPart(Tobacco tobacco) {
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

  Widget tobacoBody(Tobacco tobacco) {
    if (tobacco == null) {
      return new Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No tobacco'),
      );
    } else {
      return new Placeholder();
    }
  }
}
