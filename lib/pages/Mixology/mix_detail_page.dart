import 'package:app/app/app.dart';
import 'package:app/components/Mixology/favorite_mix_button.dart';
import 'package:app/components/Mixology/use_mix_button.dart';
import 'package:app/components/Reviews/tobacco_review_list.dart';
import 'package:app/components/SmokeSession/session_list.dart';
import 'package:app/const/theme.dart';
import 'package:app/models/extensions.dart';

import 'package:app/module/data_provider.dart';
import 'package:app/pages/Gear/tobacco_page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share/share.dart';

class MixDetailPage extends StatefulWidget {
  final TobaccoMixSimpleDto mix;

  const MixDetailPage({Key key, this.mix}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new MixDetailPageState();
}

class MixDetailPageState extends State<MixDetailPage> {
  final double _appBarHeight = 256.0;
  bool editName;
  BehaviorSubject<TobaccoInformationDto> information =
      new BehaviorSubject<TobaccoInformationDto>();
  TextEditingController nameController;

  @override
  initState() {
    this.editName = false;
    this.nameController =
        new TextEditingController(text: widget.mix.name ?? "");

    Future.delayed(Duration.zero, () {
      App.http
          .getTobaccoInfo(widget.mix.id)
          .then((data) => this.information.add(data));
    });
    super.initState();
  }

  Future<bool> deleteConfirn() async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppTranslations.of(context).text("mix.delete_mix")),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    AppTranslations.of(context).text("mix.delete_mix_confirm")),
              ],
            ),
          ),
          actions: <Widget>[
            OutlineButton.icon(
              borderSide: BorderSide(color: Colors.white, width: 1),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              label: Text(AppTranslations.of(context).text("common.keep")),
              textColor: Colors.green,
              icon: Icon(Icons.check, color: Colors.green),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            OutlineButton.icon(
              borderSide: BorderSide(color: Colors.white, width: 1),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              textColor: Colors.red,
              label: Text(AppTranslations.of(context).text("common.delete")),
              icon: Icon(Icons.cancel, color: Colors.red),
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
        strokeWidthPxFn: (d, _) => 100,
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
              widget.mix.myMix
                  ? IconButton(
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
                  : Container()
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
                                  widget.mix.name ??
                                      AppTranslations.of(context)
                                          .text('gear.no_name'),
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        widget.mix.myMix
                            ? IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () => setState(() {
                                  editName = true;
                                }),
                              )
                            : Container()
                      ],
                    ),
              background: Container(
                  child: SizedBox.expand(
                      child: Center(
                          child: new charts.PieChart(
                _createSampleData(),
                animate: false,
                defaultRenderer: new charts.ArcRendererConfig(
                  arcWidth: 60,
                  startAngle: 20,
                  strokeWidthPx: 2.0,
                  arcRendererDecorators: [
                    new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.inside,
                        insideLabelStyleSpec: new charts.TextStyleSpec(
                            fontSize: 16,
                            color: charts.Color.fromHex(code: "#FFFFFF")))
                  ],
                ),
              )))),
            ),
          ),
          new SliverList(
            delegate: new SliverChildListDelegate(<Widget>[
              Column(
                children: [
                  ...widget.mix.tobaccos.asMap().map((index, f) {
                    return MapEntry(
                        index,
                        ListTile(
                          leading: Container(
                            height: 40,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.colors[index]),
                          ),
                          onTap: () => Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) {
                            return TobaccoPage(
                                tobacco: Convertor.getPipeAccesory(f.tobacco));
                          })),
                          title: Text(f.tobacco.name,
                              style: Theme.of(context).textTheme.display2),
                          trailing: Text(f.fraction.toString() + ' g',
                              style: Theme.of(context).textTheme.display2),
                          subtitle: Text(f.tobacco.brand,
                              style: Theme.of(context).textTheme.display3),
                        ));
                  }).values,
                  FavoriteMixButton(mix: widget.mix),
                  UseMixButton(
                    mix: widget.mix,
                  ),
                  Divider(),
                  SizedBox(
                    height: 8,
                  ),
                  StreamBuilder<TobaccoInformationDto>(
                      stream: this.information,
                      builder: (context, snapshot) {
                        return TobaccoReviewList(info: snapshot.data);
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
                  SizedBox(
                    height: 100,
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
