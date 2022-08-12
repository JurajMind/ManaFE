import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeaveSessionButton extends StatelessWidget {
  final int? sessionId;
  final bool? assigned;
  final Function(bool isLike)? callback;
  const LeaveSessionButton(
      {Key? key, this.sessionId, this.assigned, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: assigned!
            ? MButton(
                icon: FontAwesomeIcons.externalLinkAlt,
                iconColor: AppColors.colors[3],
                label: 'Leave session',
                onPressed: () async {
                  var bloc = DataProvider.getData(context)!.statisticBloc;
                  await bloc.unAssignSession(sessionId);
                  if (callback != null) callback!(false);
                },
              )
            : MButton(
                icon: FontAwesomeIcons.check,
                iconColor: AppColors.colors[1],
                label: 'Assign session',
                onPressed: () async {
                  var bloc = DataProvider.getData(context)!.statisticBloc;
                  await bloc.assignSession(sessionId);
                  if (callback != null) callback!(true);
                },
              ));
  }
}
