import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class AddRemoveGearButton extends StatelessWidget {
  final PipeAccesorySimpleDto gear;

  const AddRemoveGearButton({Key key, this.gear}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).personBloc;

    return StreamBuilder<List<PipeAccesorySimpleDto>>(
        stream: bloc.myGear,
        builder: (context, snapshot) {
          if (matchAccessory(snapshot)) {
            return MButton(
              icon: Icons.delete,
              iconColor: Colors.red,
              label: "gear.remove_from_my_gear",
              onPressed: () async {
                bloc.removeMyGear(gear, 1);
              },
            );
          }

          if (snapshot?.data == null) {
            return Container();
          }

          return MButton(
            icon: Icons.add,
            iconColor: AppColors.colors[1],
            label: "gear.add_to_my_gear",
            onPressed: () async {
              bloc.addMyGear(gear, 1);
            },
          );
        });
  }

  bool matchAccessory(AsyncSnapshot<List<PipeAccesorySimpleDto>> snapshot) {
    return snapshot.data.indexWhere((a) => a.id == gear.id) != -1;
  }
}
