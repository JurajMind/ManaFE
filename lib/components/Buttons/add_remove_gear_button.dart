import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/const/theme.dart';
import 'package:app/main.dart';

import 'package:app/module/module.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class AddRemoveGearButton extends StatelessWidget {
  final PipeAccesorySimpleDto? gear;

  const AddRemoveGearButton({Key? key, this.gear}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bloc = getIt.get<PersonBloc>();

    return StreamBuilder<List<PipeAccesorySimpleDto>>(
        stream: bloc.myGear,
        builder: (context, snapshot) {
          if (matchAccessory(snapshot)) {
            return MButton(
              maxWidth: 500,
              icon: Icons.delete,
              iconColor: Colors.red,
              label: "gear.remove_from_my_gear",
              onPressed: () async {
                bloc.removeMyGear(gear!, 1000);
              },
            );
          }

          if (snapshot.data == null) {
            return Container();
          }

          return MButton(
            icon: Icons.add,
            iconColor: AppColors.colors[1],
            label: "gear.add_to_my_gear",
            onPressed: () async {
              bloc.addMyGear(gear!, 1000);
            },
          );
        });
  }

  bool matchAccessory(AsyncSnapshot<List<PipeAccesorySimpleDto>> snapshot) {
    return (snapshot.data?.indexWhere((a) => a.id == gear!.id) ?? 0) != -1;
  }
}
