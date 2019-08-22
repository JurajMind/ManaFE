import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'dart:math' as math;

class InMixList extends StatelessWidget {
  final List<TobaccoMixSimpleDto> mixes;
  final int sourceTobacco;
  final VoidCallback onPressed;
  final int mixCount;

  const InMixList(
      {Key key, this.mixes, this.onPressed, this.mixCount = 5, this.sourceTobacco})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mixes == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    var sc = math.min(mixes.length, mixCount);

    return Column(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            'Used in mixes:',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
      if(mixes.length == 0)
        Text('smoke_session.no_smoke_session',style: Theme.of(context).textTheme.display2,),      
      if (mixes.length > 0) ...{
        ...mixes.take(sc).map((s) => MixCardExpanded(tobaccoMix: s,highlightId: sourceTobacco,)),
      },
      if (mixes.length > 0 && mixes.length >= sc)
        MButton(
            iconColor: Colors.red,
            icon: Icons.clear_all,
            label: 'All ussage in mix',
            onPressed: onPressed),
    ]);
  }
}
