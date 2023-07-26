import 'package:app/main.dart';
import 'package:app/module/module.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:shimmer/shimmer.dart';

import '../../app/app.dart';
import '../../pages/SmokeSession/freya_smoke_session_page.dart';

class SmokeSessionCarousel extends StatefulWidget {
  final GlobalKey<NavigatorState>? Function(int)? callback;

  const SmokeSessionCarousel({Key? key, this.callback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new _SmokeSessionCarouselState();
}

class _SmokeSessionCarouselState extends State<SmokeSessionCarousel> {
  ScrollController? _controller;
  var personBloc = getIt.get<PersonBloc>();

  @override
  initState() {
    _controller = ScrollController();
    _controller!.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller!.offset >= _controller!.position.maxScrollExtent && !_controller!.position.outOfRange) {
      personBloc.loadSessions();
    }
    if (_controller!.offset <= _controller!.position.minScrollExtent && !_controller!.position.outOfRange) {
      personBloc.loadSessions();
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: StreamBuilder<List<SmokeSessionSimpleDto>>(
        stream: personBloc.smokeSessionsCodes,
        builder: (context, snapshot) {
          if (snapshot.data?.length == 1) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 150,
                    child: Image.asset(
                      'assets/dymka.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: SmokeSessionCarouselItem(
                      smokeSession: snapshot.data!.first,
                      callback: widget.callback,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              var data = snapshot.data == null ? null : snapshot.data![index];
              return data != null
                  ? new SmokeSessionCarouselItem(
                      smokeSession: data,
                      callback: widget.callback,
                    )
                  : Placeholder();
            },
          );
        },
      ),
    );
  }
}

class SmokeSessionCarouselItem extends StatelessWidget {
  final SmokeSessionSimpleDto? smokeSession;
  final GlobalKey<NavigatorState>? Function(int)? callback;
  SmokeSessionCarouselItem({
    this.smokeSession,
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (smokeSession!.id == -1) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
            child: Container(
              width: 250,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: new Border.all(color: const Color.fromRGBO(221, 221, 221, 1.0), width: 2.0),
              ),
              child: Center(child: Text('Loading', style: Theme.of(context).textTheme.titleLarge)),
            ),
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.white),
      );
    }

    var online = smokeSession!.device!.isOnline!;
    return Hero(
      tag: "${smokeSession!.sessionId}_session",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
            if (App.appType == AppType.freya) {
              return new FreyaSmokeSessionPage(
                sessionId: smokeSession!.sessionId,
                callback: callback,
              );
            }
            return new SmokeSessionPage(
              sessionId: smokeSession!.sessionId,
              callback: callback,
            );
          })),
          child: Container(
            width: 250,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.0),
              border: new Border.all(color: const Color.fromRGBO(221, 221, 221, 1.0), width: 2.0),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(smokeSession!.device!.name!,
                    style: Theme.of(context).textTheme.titleLarge!.apply(color: online ? Colors.green : Colors.white)),
                Text(smokeSession!.sessionId!),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
