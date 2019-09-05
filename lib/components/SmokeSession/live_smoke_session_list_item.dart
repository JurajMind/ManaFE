import 'package:app/Helpers/date_utils.dart';
import 'package:app/components/Common/labeled_value.dart';
import 'package:app/pages/Statistic/Detail/smoke_session_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class LiveSmokeSessionListItem extends StatelessWidget {
  final SmokeSessionSimpleDto session;

  LiveSmokeSessionListItem({Key key, this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var start =
        new DateTime.fromMillisecondsSinceEpoch(session.statistic.start);

    var duration =
        new Duration(microseconds: session.statistic.duration * 1000);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16.0)),
        child: InkWell(
          onTap: () => Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (BuildContext context) {
                    if(session.live == true){
                      return Placeholder();
                    }
                return SmokeSessioDetailPage(session);
              })),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: LabeledValue(
                        'Live',
                        icon: Icon(Icons.check_circle,color: Colors.green,),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: LabeledValue(
                      session.device.name,
                        icon: Icon(Icons.devices),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LabeledValue(
                      session.sessionId,
                        icon: Icon(Icons.code),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
