import 'dart:async';

import 'package:app/components/snap_scroll.dart';
import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/animation_list.dart';
import 'package:app/pages/SmokeSession/animation_select_page.dart';
import 'package:app/pages/SmokeSession/gradiend_color_wheel.dart';
import 'package:app/pages/SmokeSession/metadata_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TestPageState();
  }
}

class _TestPageState extends State<TestPage> {
  List<double> snapPositions;
  ScrollController controller;
  ScrollController controller2;
  ScrollNotification notification;
  Timer _timer;
  @override
  void initState() {
    controller = new ScrollController(initialScrollOffset: 200.0);
    controller2 = new ScrollController();
    super.initState();
  }

  Color pickerColor = new Color(0xff443a49);
  changeColor(Color color) {
    setState(() {
      pickerColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    final smokeSessionBloc = DataProvider.getSmokeSession(context);
    var size = MediaQuery.of(context).size;
    final items = List<Widget>.generate(10000, (i) => Text(i.toString()));
    return SafeArea(
      child: Scaffold(
          body: new CustomScrollView(
        controller: controller,
        physics: new SnapScrollPhysic(
            snaps: [size.height * 0.75, size.width, size.height * 0.75 - 50]),
        shrinkWrap: true,
        slivers: <Widget>[
          new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                AnimationsPicker(),
                SizedBox(height: size.width, child: GradientColorWheel(
                  defaultColors: [Colors.red,Colors.blue],
                )),
                SizedBox(
                    child: Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new AnimationSelectPage();
                            },
                          )),
                      child: Text('Anim'),
                    ),
                    RaisedButton(
                      onPressed: () {
                      smokeSessionBloc.setColor(Colors.yellow);
                      },
                      child: Text('BottomModal'),
                    )
                  ],
                )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class MetadataBottomSheet extends StatelessWidget {
  const MetadataBottomSheet({
    Key key,
    @required this.smokeSessionBloc,
  }) : super(key: key);

  final SmokeSessionBloc smokeSessionBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new ListView(
          children: <Widget>[
            new MetadataIdem(
              type: "Pipe",
              icon: Icons.refresh,
              pipeAccesories: smokeSessionBloc.myGear.value != null
                  ? smokeSessionBloc.myGear.value
                      .where((a) => a.type == 'Hookah')
                      .take(5)
                      .toList()
                  : new List<PipeAccesory>(),
              selected: smokeSessionBloc.smokeSessionMetaData.value.pipeId,
            ),
            new MetadataIdem(
              type: "Bowl",
              icon: Icons.home,
              pipeAccesories: smokeSessionBloc.myGear.value != null
                  ? smokeSessionBloc.myGear.value
                      .where((a) => a.type == 'Bowl')
                      .take(5)
                      .toList()
                  : new List<PipeAccesory>(),
              selected: smokeSessionBloc.smokeSessionMetaData.value.pipeId,
            ),
            new MetadataIdem(
              type: "Heat managment",
              icon: Icons.account_box,
              pipeAccesories: smokeSessionBloc.myGear.value != null
                  ? smokeSessionBloc.myGear.value
                      .where((a) => a.type == 'HeatManagement')
                      .take(5)
                      .toList()
                  : new List<PipeAccesory>(),
            ),
            new MetadataIdem(
              type: "Coals",
              icon: Icons.account_box,
              pipeAccesories: smokeSessionBloc.myGear.value != null
                  ? smokeSessionBloc.myGear.value
                      .where((a) => a.type == 'Coals')
                      .take(5)
                      .toList()
                  : new List<PipeAccesory>(),
            ),
          ],
        ),
      ),
    );
  }
}
