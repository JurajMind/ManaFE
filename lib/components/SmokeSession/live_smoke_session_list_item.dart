import 'package:app/components/Common/labeled_value.dart';
import 'package:app/main.dart';
import 'package:app/module/module.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:app/pages/Statistic/Detail/smoke_session_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class LiveSmokeSessionListItem extends StatelessWidget {
  final SmokeSessionSimpleDto? session;
  final GlobalKey<NavigatorState> Function(int)? callback;

  LiveSmokeSessionListItem({Key? key, this.session, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(16.0)),
        child: InkWell(
          onTap: () async {
            var bloc = getIt.get<PersonBloc>();

            if (session!.live == true) {
              bloc.callback(
                  2,
                  new SmokeSessionPage(
                    sessionId: session!.sessionId,
                  ));
            } else {
              await Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (_) => SmokeSessioDetailPage(session: session)));
            }
          },
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
                        icon: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: LabeledValue(
                        session!.device!.name,
                        icon: Icon(Icons.devices),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LabeledValue(
                        session!.sessionId,
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
