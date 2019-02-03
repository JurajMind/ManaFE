import 'package:app/models/PipeAccesory/tobacco.dart';

import 'package:app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:openapi/api.dart';

class MixDetailPage extends StatefulWidget {
  final TobaccoMixSimpleDto mix;

  const MixDetailPage({Key key, this.mix}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new MixDetailPageState();
}

class MixDetailPageState extends State<MixDetailPage> {
  final double _appBarHeight = 256.0;
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];

  List<Color> colors;
  List<charts.Series<TobaccoSimpleDto, int>> _createSampleData() {
    return [
      new charts.Series<TobaccoSimpleDto, int>(
        id: 'Tobacco mix',
        domainFn: (TobaccoSimpleDto sales, _) => sales.id,
        measureFn: (TobaccoSimpleDto sales, _) => sales.id,
        data: widget.mix.tobaccos.map((f) => f.tobacco).toList(),
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (TobaccoSimpleDto row, _) =>
            '${row.name}: ${row.brand}',
      )
    ];
  }

  @override
  initState() {
    colors = ColorHelper.getRandomColors(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          expandedHeight: _appBarHeight,
          actions: <Widget>[Icon(Icons.add)],
          backgroundColor: Colors.transparent,
          flexibleSpace: new FlexibleSpaceBar(
            centerTitle: true,
            title: ShaderMask(
              shaderCallback: (Rect bounds) {
                return new LinearGradient(
                  colors: colors,
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: Hero(
                tag: "mix_hero_${widget.mix.id}",
                child: Container(
                  color: Colors.black,
                  child: Text(
                    widget.mix.name ?? 'No name',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                ),
              ),
            ),
            background: Container(
                child: SizedBox.expand(
                    child: Center(
                        child: new charts.PieChart(
              _createSampleData(),
              animate: true,
              defaultRenderer: new charts.ArcRendererConfig(
                arcWidth: 200,
              ),
            )))),
          ),
        ),
        new SliverList(
          delegate: new SliverChildListDelegate(<Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: Text('Test'),
                )
              ],
            )
          ]),
        )
      ],
    );
  }
}
