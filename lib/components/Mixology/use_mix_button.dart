import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/models/SmokeSession/tobacco_edit_model.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class UseMixButton extends StatelessWidget {
  final TobaccoMixSimpleDto mix;

  const UseMixButton({Key key, this.mix}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).smokeSessionBloc;

    return StreamBuilder<SmokeSessionMetaDataDto>(
        stream: bloc.smokeSessionMetaData,
        builder: (context, snapshot) {
          if (snapshot?.data?.tobaccoMix?.id == mix.id) {
            return Container(
              width: 150,
              height: 50,
              child: Center(
                  child: Text("USED MIX",
                      style: Theme.of(context)
                          .textTheme
                          .display2
                          .apply(color: Colors.grey))),
              decoration: BoxDecoration(
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(30.0)),
                  border: new Border.all(color: Colors.grey, width: 2)),
            );
          }

          if (snapshot?.data?.id == null) {
            return Container();
          }

          return Container(
            child: new RoundedButton(
              buttonName: 'Use this mix',
              onTap: () async {
                var edit = new TobaccoEditModel();
                edit.mix = mix;
                bloc.setTobacco(edit);
              },
              buttonColor: Colors.transparent,
              borderWidth: 2.0,
              bottomMargin: 1.0,
              height: 50.0,
              width: 200,
            ),
          );
        });
  }
}
