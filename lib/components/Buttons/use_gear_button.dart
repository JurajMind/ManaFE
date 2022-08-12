import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/const/theme.dart';
import 'package:app/main.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class UseGearButton extends StatelessWidget {
  final PipeAccesorySimpleDto? gear;

  const UseGearButton({Key? key, this.gear}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bloc = getIt.get<SmokeSessionBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: StreamBuilder<SmokeSessionMetaDataDto?>(
          stream: bloc.smokeSessionMetaData,
          builder: (context, snapshot) {
            if (matchAccessory(snapshot)) {
              return MButton(
                icon: Icons.delete,
                iconColor: Colors.red,
                label: "gear.remove_this_accessorry",
                onPressed: () async {
                  bloc.setMetadataAccesory(null, type: gear!.type);
                },
              );
            }

            if (snapshot?.data?.id == null) {
              return Container();
            }

            return MButton(
              icon: Icons.check,
              iconColor: AppColors.colors[1],
              label: "gear.use_this_accessory",
              onPressed: () async {
                bloc.setMetadataAccesory(gear);
              },
            );
          }),
    );
  }

  bool matchAccessory(AsyncSnapshot<SmokeSessionMetaDataDto?> snapshot) {
    return snapshot?.data?.bowlId == gear!.id ||
        snapshot?.data?.pipeId == gear!.id ||
        snapshot?.data?.coalId == gear!.id ||
        snapshot?.data?.heatManagementId == gear!.id;
  }
}
