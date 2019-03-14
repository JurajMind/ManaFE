import 'package:app/module/data_provider.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class SmokeSessionCarousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SmokeSessionCarouselState();
}

class _SmokeSessionCarouselState extends State<SmokeSessionCarousel> {
  PageController controller;

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
      builder: (context, snapshot) => PageView.builder(
          controller: controller,
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            var data = snapshot.data == null ? null : snapshot.data[index];
            return AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                double value = 1.0;
                if (controller.position.haveDimensions) {
                  value = controller.page - index;
                  value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                }

                return new Center(
                  child: new SizedBox(
                    height: Curves.easeOut.transform(value) * 200,
                    width: Curves.easeOut.transform(value) * 400,
                    child: child,
                  ),
                );
              },
              child: data != null
                  ? new SmokeSessionCarouselItem(
                      smokeSession: data,
                    )
                  : Placeholder(),
            );
          }),
    ));
  }
}

class SmokeSessionCarouselItem extends StatelessWidget {
  final SmokeSessionSimpleDto smokeSession;

  SmokeSessionCarouselItem({
    this.smokeSession,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "${smokeSession.sessionId}_session",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(builder: (BuildContext context) {
                return new SmokeSessionPage(sessionId: smokeSession.sessionId);
              })),
          child: Container(
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
                    style: Theme.of(context).textTheme.display1),
                Text(smokeSession.sessionId),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
