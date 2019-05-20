import 'package:app/app/app.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:openapi/api.dart';
import 'package:share/share.dart';

class MixDetailPage extends StatefulWidget {
  final TobaccoMixSimpleDto mix;

  const MixDetailPage({Key key, this.mix}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new MixDetailPageState();
}

class MixDetailPageState extends State<MixDetailPage> {
  final double _appBarHeight = 256.0;
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  bool editName;

  TextEditingController nameController;
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
    this.editName = false;
    this.nameController =
        new TextEditingController(text: widget.mix.name ?? "");
    super.initState();
  }

  changeName() async {
    widget.mix.name = nameController.value.text;
    await App.http.changeMixName(widget.mix.id, nameController.value.text);
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
                  icon: Icon(Icons.share),
                  onPressed: () =>
                      Share.share('check out my website https://example.com')),
              widget.mix.myMix ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  var delete = await deleteConfirn();
                  if (delete) {
                    var bloc = DataProvider.getData(context).mixologyBloc;
                    bloc.deleteMix(widget.mix);
                    Navigator.of(context).pop();
                  }
                }, 
              ) : Container()
            ],
            backgroundColor: Colors.transparent,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              title: editName
                  ? Container(
                      width: 200,
                      child: TextField(
                        autofocus: true,
                        controller: nameController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.save),
                              onPressed: () => setState(() {
                                    editName = false;
                                    changeName();
                                  }),
                            ),
                            hintText: 'Please enter a mix name'),
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Hero(
                              tag: "mix_hero_${widget.mix.id}",
                              child: Container(
                                child: AutoSizeText(
                                  widget.mix.name ?? 'No name',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        widget.mix.myMix ? IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => setState(() {
                                editName = true;
                              }),
                        ) : Container()
                      ],
                    ),
              background: Container(
                  child: SizedBox.expand(
                      child: Center(
                          child: new charts.PieChart(
                _createSampleData(),
                animate: false,
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
