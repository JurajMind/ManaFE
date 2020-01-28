import 'package:app/components/SmokeSession/tobacco_widget.dart';
import 'package:app/pages/SmokeSession/Components/pipe_accesory_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/api.dart';

class SessionMetadataDetail extends StatelessWidget {
  final SmokeSessionMetaDataDto metaData;

  const SessionMetadataDetail(
    this.metaData, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Metadata', style: Theme.of(context).textTheme.headline6),
              SizedBox(width: 8),
              Icon(FontAwesomeIcons.table),
            ],
          ),
        ),
        TobaccoWidget(
          tobacco: metaData?.tobacco,
          tobaccoMix: metaData?.tobaccoMix,
        ),
        PipeAccesoryWidget(
          accesory: metaData?.pipe,
          type: 'Pipe',
        ),
        PipeAccesoryWidget(
          accesory: metaData?.bowl,
          type: 'Bowl',
        ),
        PipeAccesoryWidget(
          accesory: metaData?.heatManagement,
          type: 'H.M.S',
        ),
        PipeAccesoryWidget(
          accesory: metaData?.coal,
          type: 'Coals',
        ),
      ],
    );
  }
}
