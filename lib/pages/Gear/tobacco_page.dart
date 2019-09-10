import 'package:app/app/app.dart';
import 'package:app/components/Reviews/tobacco_review_list.dart';
import 'package:app/components/SmokeSession/inMix_list.dart';
import 'package:app/components/SmokeSession/session_list.dart';
import 'package:app/models/extensions.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

import 'Tobacco/in_mixes_lazy_list.dart';

class TobaccoPage extends StatefulWidget {
  final PipeAccesorySimpleDto tobacco;
  final int pipeAccesoryId;

  const TobaccoPage({Key key, this.tobacco, this.pipeAccesoryId})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _TobaccoPageState();
  }
}

class _TobaccoPageState extends State<TobaccoPage> {
  PipeAccesorySimpleDto pipeAccesory;
  BehaviorSubject<TobaccoInformationDto> information =
      new BehaviorSubject<TobaccoInformationDto>();

  BehaviorSubject<List<TobaccoMixSimpleDto>> inMix =
      new BehaviorSubject<List<TobaccoMixSimpleDto>>();
  @override
  void initState() {
    if (widget.tobacco == null) {
      App.http.getGearInfo(widget.pipeAccesoryId).then((g) => setState(() {
            pipeAccesory = g;
          }));
    } else {
      pipeAccesory = widget.tobacco;
    }
    var id = widget.tobacco?.id ?? widget.pipeAccesoryId;
    Future.delayed(Duration.zero, () {
      App.http.getTobaccoInfo(id).then((data) => this.information.add(data));
      App.http.getTobaccoInMix(id).then((data) => this.inMix.add(data));
    });
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
              backgroundColor: Colors.black,
              pinned: true,
              flexibleSpace: Container(),
              actions: <Widget>[],
              title: Hero(
                  tag: '${pipeAccesory.id}_name',
                  child: Row(
                    children: <Widget>[
                      Extensions.accesoryPicture(pipeAccesory),
                      SizedBox(
                        width: 8,
                      ),
                      Text(pipeAccesory.brand),
                      SizedBox(
                        width: 8,
                      ),
                      Text(pipeAccesory.name),
                    ],
                  )),
              centerTitle: true,
            ),
            SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 8,
                ),
                StreamBuilder<TobaccoInformationDto>(
                    stream: this.information,
                    builder: (context, snapshot) {
                      return TobaccoReviewList(
                        info: snapshot.data,
                        label: true,
                      );
                    }),
                SizedBox(
                  height: 8,
                ),
                Divider(),
                SizedBox(
                  height: 8,
                ),
                StreamBuilder<TobaccoInformationDto>(
                    stream: this.information,
                    builder: (context, snapshot) {
                      return SessionList(
                        info: snapshot.data,
                        sessionCount: 5,
                      );
                    }),
                Divider(color: Colors.white),
                SizedBox(
                  height: 8,
                ),
                StreamBuilder<List<TobaccoMixSimpleDto>>(
                    stream: this.inMix,
                    builder: (context, snapshot) {
                      return InMixList(
                          sourceTobacco: pipeAccesory.id,
                          mixes: snapshot.data,
                          mixCount: 5,
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => InMixesLazyList(
                                  initInMixes: snapshot.data,
                                  tobacco: pipeAccesory,
                                ),
                              )));
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
