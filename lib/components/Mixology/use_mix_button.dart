import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/const/theme.dart';
import 'package:app/main.dart';
import 'package:app/models/SmokeSession/tobacco_edit_model.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class UseMixButton extends StatelessWidget {
  final TobaccoMixSimpleDto? mix;

  const UseMixButton({Key? key, this.mix}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bloc = getIt.get<SmokeSessionBloc>();

    return StreamBuilder<SmokeSessionMetaDataDto?>(
        stream: bloc.smokeSessionMetaData,
        builder: (context, snapshot) {
          if (snapshot.data?.tobaccoMix?.id == mix!.id) {
            return MButton(
              icon: Icons.delete,
              iconColor: Colors.red,
              label: "mix.remove_mix",
              onPressed: () => bloc.setTobacco(null),
            );
          }

          if (snapshot.data?.id == null) {
            Container();
          }

          return MButton(
            icon: Icons.check,
            iconColor: AppColors.colors[2],
            label: "mix.use_this_mix",
            onPressed: () async {
              var edit = new TobaccoEditModel();
              edit.mix = mix;
              bloc.setTobacco(edit);
            },
          );
        });
  }
}
