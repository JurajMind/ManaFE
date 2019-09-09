import 'package:app/Helpers/date_utils.dart';
import 'package:app/components/Common/labeled_value.dart';
import 'package:app/pages/Statistic/Detail/smoke_session_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

import 'live_smoke_session_list_item.dart';

class SmokeSessionListItem extends StatelessWidget {
  final SmokeSessionSimpleDto session;

  SmokeSessionListItem({Key key, this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(session.live == true){
      return LiveSmokeSessionListItem(session: session,);
    }
    var start =
        new DateTime.fromMillisecondsSinceEpoch(session.statistic.start);

    var duration =
        new Duration(microseconds: session.statistic.duration * 1000);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
      
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
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
                      flex: 4,
                      child: LabeledValue(
                        '${DateUtils.toStringDate(start)} ${DateUtils.toStringShortTime(start)}',
                        icon: Icon(Icons.calendar_today),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: LabeledValue(
                        DateUtils.toStringDuration(duration),
                        icon: Icon(Icons.timelapse),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LabeledValue(
                        session.statistic.pufCount.toString(),
                        icon: Icon(Icons.cloud),
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
