import 'package:app/app/app.dart';
import 'package:app/components/Buttons/add_remove_gear_button.dart';
import 'package:app/components/Reviews/tobacco_review_list.dart';
import 'package:app/components/SmokeSession/inMix_list.dart';
import 'package:app/components/SmokeSession/session_list.dart';
import 'package:app/models/extensions.dart';
import 'package:app/services/share.dart';
import 'package:app/theme/theme_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share/share.dart';

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
    var theme = MTheme.of(context);
    return new Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
                pinned: true,
                flexibleSpace: Container(),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () async {
                        var url = await ShareService.tobaccoShareLink(
                            this.pipeAccesory);
                        Share.share(url.toString());
                      }),
                ],
                title: Row(
                  children: <Widget>[
                    Hero(
                        tag: '${pipeAccesory.id}_name',
                        child: Container(
                            width: 50,
                            height: 50,
                            child: Extensions.accesoryPicture(pipeAccesory))),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width - 220,
                        child: AutoSizeText(
                          "${pipeAccesory.brand} ${pipeAccesory.name}",
                          maxLines: 1,
                          style: theme.appBarStyle,
                          minFontSize: 8,
                        ))
                  ],
                ),
                centerTitle: true,
              ),
              SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: theme.maxPageWidth),
                        child: AddRemoveGearButton(
                          gear: pipeAccesory,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
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
          ),
        ));
  }
}
