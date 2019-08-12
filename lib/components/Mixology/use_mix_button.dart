import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/const/theme.dart';
import 'package:app/models/SmokeSession/tobacco_edit_model.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/utils/translations/app_translations.dart';
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
            return MButton(
              icon: Icons.check,
              iconColor: Colors.grey,
              label: "mix.used_mix",
            );
          }

          if (snapshot?.data?.id == null) {
            return Container();
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
