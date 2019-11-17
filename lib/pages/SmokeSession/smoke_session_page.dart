import 'dart:async';

import 'package:app/Helpers/date_utils.dart';
import 'package:app/app/app.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Common/since_timer.dart';
import 'package:app/components/ProgressDialog/progress_dialog.dart';
import 'package:app/components/SmokeSession/reviews_small.dart';
import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/SmokeSession/Components/pipe_accesory_widget.dart';
import 'package:app/pages/SmokeSession/Components/puff_timer.dart';
import 'package:app/pages/SmokeSession/Experimental/experimental_page.dart';
import 'package:app/pages/SmokeSession/metadata_botom_sheet.dart';
import 'package:app/pages/SmokeSession/session_review.dart';

import 'package:app/pages/SmokeSession/tobacco_widget.dart';
import 'package:app/pages/Statistic/Detail/smoke_session_detail_page.dart';
import 'package:app/pages/home.page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:openapi/api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Components/color_gimick.dart';
import 'Components/session_control_row.dart';
import 'Components/stop_watches.dart';

class SmokeSessionPage extends StatefulWidget {
  final String sessionId;
  final GlobalKey<NavigatorState> Function(int) callback;
  SmokeSessionPage({this.sessionId, this.callback});

  @override
  State<StatefulWidget> createState() {
    return new _SmokeSessionPage();
  }
}

class _SmokeSessionPage extends State<SmokeSessionPage> {
  DataProvider dataProvider;
  StopWatches stopWatches;
  int action = 0;
  ScrollController scrollController;
  ScrollPhysics physics;

  @override
  void initState() {
    stopWatches = new StopWatches(new Stopwatch(), new Stopwatch());

    scrollController = new ScrollController();
    Future.delayed(Duration.zero, () {
      dataProvider.smokeSessionBloc.joinSession(widget.sessionId);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    dataProvider = DataProvider.getData(context);
    super.didChangeDependencies();

    SystemChannels.lifecycle.setMessageHandler((msg) {
      debugPrint('SystemChannels> $msg');
      if (msg == AppLifecycleState.resumed.toString()) {
        dataProvider.smokeSessionBloc.loadSessionData();
      }
    });
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StreamBuilder<SmokeSessionMetaDataDto> tobaccoMetaDataBuilder =
        new StreamBuilder(
      stream: dataProvider.smokeSessionBloc.smokeSessionMetaData,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.data == null) {
          return CircularProgressIndicator();
        }
        return Column(
          children: <Widget>[
            TobaccoSessionWidget(
              tobacco: asyncSnapshot.data.tobacco,
              tobaccoMix: asyncSnapshot.data.tobaccoMix,
              smokeSessionBloc: dataProvider.smokeSessionBloc,
              callback: widget.callback,
            )
          ],
        );
      },
    );

    StreamBuilder<SmokeSessionMetaDataDto> metadataBuilder = new StreamBuilder(
      stream: dataProvider.smokeSessionBloc.smokeSessionMetaData,
      builder: (context, asyncSnapshot) {
        var shortestSide = MediaQuery.of(context).size.shortestSide;
        var useTabletLayout = shortestSide > 600;

        if (asyncSnapshot.data == null) {
          return CircularProgressIndicator();
        }

        if (useTabletLayout) {
          return Container(
            constraints: BoxConstraints(maxHeight: 200),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      PipeAccesoryWidget(
                        accesory: asyncSnapshot.data.pipe,
                        type: 'pipe',
                        dataProvider: dataProvider,
                      ),
                      PipeAccesoryWidget(
                          accesory: asyncSnapshot.data.bowl,
                          type: 'bowl',
                          dataProvider: dataProvider),
                      // emptyPipeAccesoryWidget(asyncSnapshot.data)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      PipeAccesoryWidget(
                          accesory: asyncSnapshot.data.heatManagement,
                          type: 'hmd',
                          dataProvider: dataProvider),
                      PipeAccesoryWidget(
                          accesory: asyncSnapshot.data.coal,
                          type: 'coal',
                          dataProvider: dataProvider),
                      // emptyPipeAccesoryWidget(asyncSnapshot.data)
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: <Widget>[
            PipeAccesoryWidget(
              accesory: asyncSnapshot.data.pipe,
              type: 'pipe',
              dataProvider: dataProvider,
            ),
            PipeAccesoryWidget(
                accesory: asyncSnapshot.data.bowl,
                type: 'bowl',
                dataProvider: dataProvider),
            PipeAccesoryWidget(
                accesory: asyncSnapshot.data.heatManagement,
                type: 'hmd',
                dataProvider: dataProvider),
            PipeAccesoryWidget(
                accesory: asyncSnapshot.data.coal,
                type: 'coal',
                dataProvider: dataProvider),
            // emptyPipeAccesoryWidget(asyncSnapshot.data)
          ],
        );
      },
    );

    StreamBuilder<SmokeStatisticDataModel> statisticBuilder = new StreamBuilder(
      stream: dataProvider.smokeSessionBloc.smokeStatistic,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.data == null) {
          return CircularProgressIndicator();
        }

        if (asyncSnapshot.data.duration == null) {
          return Text('NoData');
        }
        var durationString =
            DateUtils.toStringDuration(asyncSnapshot.data.smokeDuration);

        var longestString =
            DateUtils.toSecondDuration(asyncSnapshot.data.longestPuf);

        var start = asyncSnapshot.data.start;
        return Container(
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(10.0),
            color: Theme.of(context).backgroundColor.withAlpha(160),
          ),
          child: asyncSnapshot.data != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new HeaderItem(
                      label: AppTranslations.of(context)
                          .text('smoke_session.puf_count'),
                      data: asyncSnapshot.data.pufCount.toString(),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                              AppTranslations.of(context)
                                  .text('smoke_session.last_puf'),
                              style: Theme.of(context)
                                  .textTheme
                                  .display2
                                  .apply(color: Colors.grey)),
                          new PuffTimeText(
                              completeTime: asyncSnapshot.data.toString()),
                          Text(longestString)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                              AppTranslations.of(context)
                                  .text('smoke_session.durations'),
                              style: Theme.of(context)
                                  .textTheme
                                  .display2
                                  .apply(color: Colors.grey)),
                          SinceTimer(
                            start: start,
                            pufCount: asyncSnapshot.data.pufCount,
                            style: Theme.of(context).textTheme.body2,
                          ),
                          Text(
                            durationString,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Text('No data'),
        );
      },
    );
    final Size screenSize = MediaQuery.of(context).size;

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1200),
        color: Theme.of(context).backgroundColor,
        child: CustomScrollView(
          controller: scrollController,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverAppBar(
              leading: Container(),
              expandedHeight: 200.0,
              backgroundColor: Colors.black,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: Size(700.0, 40.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Hero(
                          tag: "${widget.sessionId}_session",
                          child: statisticBuilder),
                      Container(
                          height: 18,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment
                                  .bottomCenter, // 10% of the width, so there are ten blinds.
                              colors: [
                                Theme.of(context)
                                    .backgroundColor
                                    .withAlpha(160),
                                Theme.of(context).backgroundColor
                              ], // whitish to gray
                              tileMode: TileMode
                                  .repeated, // repeats the gradient over the canvas
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              flexibleSpace: new FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                    color: Colors.red,
                    constraints: BoxConstraints(maxWidth: 1200),
                    child: Center(
                        child: new ColorSessionGimick(screenSize: screenSize)),
                  )),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      const SessionControllRow(),
                      tobaccoMetaDataBuilder,
                      metadataBuilder,
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: StreamBuilder<
                                List<
                                    SmartHookahModelsDbSessionDtoSessionReviewDto>>(
                            stream:
                                dataProvider.smokeSessionBloc.sessionReviews,
                            builder: (context, snapshot) {
                              if (snapshot.data == null ||
                                  snapshot.data.length == 0)
                                return new RoundedButton(
                                  child: Text(AppTranslations.of(context)
                                      .text('smoke_session.review')
                                      .toUpperCase()),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            fullscreenDialog: true,
                                            builder: (context) =>
                                                SessionReview()));
                                  },
                                  buttonColor: Colors.transparent,
                                  borderWidth: 1.0,
                                  bottomMargin: 1.0,
                                  height: 40.0,
                                  width:
                                      (MediaQuery.of(context).size.width) * 0.8,
                                );

                              return ReviewsSmall(
                                reviews: snapshot.data,
                              );
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: new RoundedButton(
                          child: Text(AppTranslations.of(context)
                              .text('smoke_session.more')
                              .toUpperCase()),
                          onTap: () => showMoreModal(),
                          buttonColor: Colors.transparent,
                          borderWidth: 1.0,
                          bottomMargin: 1.0,
                          height: 40.0,
                          width: (MediaQuery.of(context).size.width) * 0.8,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  emptyPipeAccesoryWidget(SmokeSessionMetaDataDto md) {
    if (md.pipe == null ||
        md.bowl == null ||
        md.coal == null ||
        md.heatManagement == null)
      return RoundedButton(
        child: Text('Fill metadata'),
        width: 200.0,
        borderWidth: 1.0,
        bottomMargin: 1.0,
        height: 50.0,
        onTap: () async {
          showBottomModal();
        },
      );
    return Container();
  }

  void showBottomModal() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new MetadataBottomSheet(
            dataProvider: this.dataProvider,
          );
        }).then((value) {
      this.dataProvider.smokeSessionBloc.saveMetaData();
    });
  }

  void showMoreModal() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          var code = DataProvider.getData(context).smokeSessionBloc.hookahCode;
          return Container(
            height: 1000,
            child: new Column(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(FontAwesomeIcons.vial),
                  title: new Text(
                      AppTranslations.of(context)
                          .text("smoke_session.experiments"),
                      style: Theme.of(context).textTheme.display2),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ExperimentalPage())),
                ),
                new ListTile(
                  leading: new Icon(Icons.refresh),
                  title: new Text(
                      AppTranslations.of(context).text("device.restart"),
                      style: Theme.of(context).textTheme.display2),
                  onTap: () => _restartDialog(code),
                ),
                new ListTile(
                    leading: new Icon(FontAwesomeIcons.powerOff),
                    title: new Text(
                        AppTranslations.of(context)
                            .text("smoke_session.end_session"),
                        style: Theme.of(context).textTheme.display2),
                    onTap: () => _endDialog(context)),
                new ListTile(
                    leading: new Icon(FontAwesomeIcons.reply),
                    title: new Text(
                        AppTranslations.of(context)
                            .text("smoke_session.leave_session"),
                        style: Theme.of(context).textTheme.display2),
                    onTap: () {
                      var bloc = DataProvider.getData(context).smokeSessionBloc;
                      bloc.unAssignSession().then((data) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      });
                    }),
              ],
            ),
          );
        }).then((value) {});
  }

  void _endDialog(BuildContext context) {
    // flutter defined function
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
              AppTranslations.of(context).text("smoke_session.end_session") +
                  " ?"),
          content: new Text(AppTranslations.of(context)
              .text("smoke_session.end_session_confirm")),
          actions: <Widget>[
            new OutlineButton.icon(
              borderSide: BorderSide(color: Colors.white, width: 1),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              textColor: Colors.green,
              label: new Text(
                AppTranslations.of(context).text("common.yes"),
              ),
              icon: Icon(Icons.check, color: Colors.green),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            // usually buttons at the bottom of the dialog
            new OutlineButton.icon(
              icon: Icon(Icons.cancel, color: Colors.red),
              borderSide: BorderSide(color: Colors.white, width: 1),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              textColor: Colors.red,
              label: new Text(
                AppTranslations.of(context).text("common.no"),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            )
          ],
        );
      },
    ).then((value) {
      if (value) {
        ProgressDialog pr = showEndingProgress();

        var sessionBloc = DataProvider.getData(context).smokeSessionBloc;
        sessionBloc.endSession().then((value) {
          pr.hide();
          Navigator.of(context).pop();
          widget.callback(4);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SmokeSessioDetailPage(session: value)));
        });
      }
    });
  }

  ProgressDialog showEndingProgress() {
    var pr = new ProgressDialog(context, ProgressDialogType.Normal);
    pr.setMessage('Ending smoke session...');
    pr.show();
    return pr;
  }

  void _restartDialog(String code) {
    // flutter defined function
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Restart device?"),
          content: new Text("Do you want restart this device ?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                "Restart",
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            )
          ],
        );
      },
    ).then((value) {
      if (value) {
        App.http.restartDevice(code);
      }
    });
  }
}

class HeaderItem extends StatelessWidget {
  final String label;
  final String data;
  const HeaderItem({Key key, this.label, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Column(
        children: <Widget>[
          Text(label,
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .apply(color: Colors.grey)),
          Text(
            data,
            style: Theme.of(context).textTheme.body2,
          ),
        ],
      ),
      flex: 1,
    );
  }
}
