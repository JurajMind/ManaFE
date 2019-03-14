import 'package:app/module/data_provider.dart';
import 'package:app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
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

  Future<bool> deleteConfirn() async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete mix?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure to delete this mix??'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Keep'),
              textColor: Colors.green,
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              textColor: Colors.red,
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  List<charts.Series<TobaccoSimpleDto, int>> _createSampleData() {
    return [
      new charts.Series<TobaccoSimpleDto, int>(
        id: 'Tobacco mix',
        colorFn: (t, i) {
          var color = AppColors.colors[i];
          return charts.Color(
              a: color.alpha, b: color.blue, g: color.green, r: color.red);
        },
        domainFn: (TobaccoSimpleDto sales, _) => sales.id,
        measureFn: (TobaccoSimpleDto sales, _) => widget.mix.tobaccos
            .firstWhere((t) => t.tobacco.id == sales.id)
            .fraction,
        data: widget.mix.tobaccos.map((f) => f.tobacco).toList(),
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (TobaccoSimpleDto row, _) =>
            '${row.name}: ${row.brand}',
      )
    ];
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appBarHeight,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  var delete = await deleteConfirn();
                  if (delete) {
                    var bloc = DataProvider.getData(context).mixologyBloc;
                    bloc.deleteMix(widget.mix);
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
            backgroundColor: Colors.transparent,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              title: Hero(
                tag: "mix_hero_${widget.mix.id}",
                child: Text(
                  widget.mix.name ?? 'No name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
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
                  children: widget.mix.tobaccos.map((f) {
                return ListTile(
                  title: Text(f.tobacco.name,
                      style: Theme.of(context).textTheme.display4),
                  trailing: Text(f.fraction.toString() + ' g'),
                  subtitle: Text(f.tobacco.brand,
                      style: Theme.of(context).textTheme.display3),
                );
              }).toList())
            ]),
          )
        ],
      ),
    );
  }
}
