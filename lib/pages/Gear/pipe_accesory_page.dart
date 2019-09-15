import 'package:app/app/app.dart';
import 'package:app/components/Buttons/add_remove_gear_button.dart';
import 'package:app/components/Buttons/use_gear_button.dart';
import 'package:app/components/SmokeSession/session_list.dart';
import 'package:app/models/extensions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class PipeAccesoryPage extends StatefulWidget {
  final PipeAccesorySimpleDto pipeAccesory;
  final int pipeAccesoryId;

  const PipeAccesoryPage({Key key, this.pipeAccesory, this.pipeAccesoryId})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _PipeAccesoryPageState();
  }
}

class _PipeAccesoryPageState extends State<PipeAccesoryPage> {
  PipeAccesorySimpleDto pipeAccesory;
  BehaviorSubject<List<SmokeSessionSimpleDto>> smokeSessions =
      new BehaviorSubject<List<SmokeSessionSimpleDto>>();

  @override
  void initState() {
    if (widget.pipeAccesory == null) {
      App.http.getGearInfo(widget.pipeAccesoryId).then((g) => setState(() {
            pipeAccesory = g;
          }));
    } else {
      pipeAccesory = widget.pipeAccesory;
    }
    App.http
        .getGearSession(widget?.pipeAccesoryId ?? widget.pipeAccesory.id,
            pageSize: 6)
        .then((sessions) => this.smokeSessions.add(sessions));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (pipeAccesory == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return new Container(
        color: Theme.of(context).backgroundColor,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              flexibleSpace: Container(),
              actions: <Widget>[],
              title: Row(
                children: <Widget>[
                  Hero(
                      tag: '${pipeAccesory.id}_name',
                      child: Extensions.accesoryPicture(pipeAccesory)),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 160,
                      child: AutoSizeText(
                        "${pipeAccesory.brand} ${pipeAccesory.name}",
                        maxLines: 1,
                        minFontSize: 8,
                      ))
                ],
              ),
              centerTitle: true,
            ),
            SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: AddRemoveGearButton(
                    gear: pipeAccesory,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                UseGearButton(
                  gear: pipeAccesory,
                ),
                SizedBox(
                  height: 8,
                ),
                StreamBuilder<List<SmokeSessionSimpleDto>>(
                    stream: this.smokeSessions,
                    builder: (context, snapshot) {
                      return SessionList(
                        sessions: snapshot.data,
                        sessionCount: 5,
                      );
                    }),
                SizedBox(
                  height: 100,
                ),
              ]),
            )
          ],
        ));
  }
}
