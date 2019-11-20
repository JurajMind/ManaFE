import 'package:app/module/data_provider.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class SmokeSessionCarousel extends StatefulWidget {
  final GlobalKey<NavigatorState> Function(int) callback;

  const SmokeSessionCarousel({Key key, this.callback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new _SmokeSessionCarouselState();
}

class _SmokeSessionCarouselState extends State<SmokeSessionCarousel> {
  PageController controller;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  @override
  initState() {
    super.initState();
    controller = new PageController(
        initialPage: 0, keepPage: true, viewportFraction: 0.7);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var personBloc = DataProvider.getData(context).personBloc;

    return new Center(
        child: StreamBuilder<List<SmokeSessionSimpleDto>>(
            initialData: null,
            stream: personBloc.smokeSessionsCodes,
            builder: (context, snapshot) {
              return RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () => personBloc.loadSessions(),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      var data =
                          snapshot.data == null ? null : snapshot.data[index];
                      return data != null
                          ? new SmokeSessionCarouselItem(
                              smokeSession: data,
                              callback: widget.callback,
                            )
                          : Placeholder();
                    }),
              );
            }));
  }
}

class SmokeSessionCarouselItem extends StatelessWidget {
  final SmokeSessionSimpleDto smokeSession;
  final GlobalKey<NavigatorState> Function(int) callback;
  SmokeSessionCarouselItem({
    this.smokeSession,
    Key key,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var online = smokeSession.device.isOnline;
    return Hero(
      tag: "${smokeSession.sessionId}_session",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (BuildContext context) {
            return new SmokeSessionPage(
              sessionId: smokeSession.sessionId,
              callback: callback,
            );
          })),
          child: Container(
            width: 250,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.0),
              border: new Border.all(
                  color: const Color.fromRGBO(221, 221, 221, 1.0), width: 2.0),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(smokeSession.device.name,
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .apply(color: online ? Colors.green : Colors.white)),
                Text(smokeSession.sessionId),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
