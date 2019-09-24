import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeaveSessionButton extends StatelessWidget {
  final int sessionId;
  const LeaveSessionButton({Key key, this.sessionId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MButton(
        icon: FontAwesomeIcons.externalLinkAlt,
        iconColor: AppColors.colors[3],
        label: 'Leave session',
        onPressed: () async {
          var bloc = DataProvider.getData(context).statisticBloc;
          await bloc.unAssignSession(sessionId);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
