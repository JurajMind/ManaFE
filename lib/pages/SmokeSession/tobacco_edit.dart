import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/SmokeSession/tobacco_slider.dart';
import 'package:app/models/SmokeSession/pipe_accesory_from_tobacco.dart';
import 'package:app/models/SmokeSession/tobacco_edit_model.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/SmokeSession/accesory_search.dart';
import 'package:app/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class TobaccoEditWidget extends StatefulWidget {
  final ValueChanged<TobaccoEditModel> onSave;
  final String type;
  final PipeAccesorySimpleDto tobacco;
  final int tobaccoWeight;
  final TobaccoMixSimpleDto mix;
  const TobaccoEditWidget({
    this.tobacco,
    Key key,
    this.type,
    this.mix,
    this.tobaccoWeight,
    this.onSave,
  }) : super(key: key);

  @override
  TobaccoEditWidgetState createState() {
    return new TobaccoEditWidgetState();
  }
}

class TobaccoEditWidgetState extends State<TobaccoEditWidget> {
  bool loading = false;

  List<PipeAccesorySimpleDto> selectedTobacco;
  List<PipeAccesorySimpleDto> ownSimpleAccesories;
  List<PipeAccesorySimpleDto> tobaccoList = new List<PipeAccesorySimpleDto>();
  Map<int, double> tobaccoWeight = new Map<int, double>();
  @override
  void initState() {
    super.initState();

        if (widget?.mix?.tobaccos != null) {
      for (var tobacco in widget.mix.tobaccos) {
        this.addTobacco(
            PipeAccesoryFromTobacco.tobaccoToSimple(tobacco.tobacco),
            tobacco.fraction.toDouble());
      }
      return;
    }

    selectedTobacco = new List<PipeAccesorySimpleDto>();
    if (widget.tobacco?.id != null) {
      this.addTobacco(widget.tobacco, widget.tobaccoWeight.toDouble());
    }


  }

  void showSearchDialog({BuildContext context, Widget child}) {
    showDialog<PipeAccesorySimpleDto>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((PipeAccesorySimpleDto value) {
      if (value != null) {
        setState(() {
          addTobacco(value, 5);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  TobaccoEditModel createSaveModel() {
    var result = new TobaccoEditModel();
    if (tobaccoList.length == 1) {
      result.tobacco = tobaccoList[0];
      result.weight = tobaccoWeight[result.tobacco.id].toInt();
      return result;
    }

    var mix = new TobaccoMixSimpleDto();
    if (widget?.mix?.id != null) {
      mix = widget.mix;
    }

    if (controller.text != null || controller.text != '') {
      mix.name = controller.text;
    }

    mix.tobaccos = tobaccoList.map((mix) {
      var tobaccoInMix = new TobaccoInMix();
      tobaccoInMix.tobacco = PipeAccesoryFromTobacco.simpleToTobacco(mix);
      tobaccoInMix.fraction = tobaccoWeight[mix.id].toInt();
      return tobaccoInMix;
    }).toList();

    result.mix = mix;
    return result;
  }

  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var ownedTobacco = DataProvider.getData(context)
        .personBloc
        .myGear
        .value
        .where((s) => s.type == "Tobacco")
        .toList();

    var tobaccoWidgetList = this.tobaccoList.map((item) {
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () => setState(() {
                        removeTobacco(item);
                      })),
              Text(
                item.name ?? '',
                style: Theme.of(context).textTheme.display2,
              ),
              Text(' ' + item.brand)
            ],
          ),
          FatSlider(
            sliderColor: AppColors.colors[tobaccoList.indexOf(item)],
            value: tobaccoWeight[item.id],
            onChanged: (double newValue) {
              setState(() {
                tobaccoWeight[item.id] = newValue;
              });
            },
            min: 1.0,
            max: 40.0,
          )
        ],
      );
    });

    var listWidgets = new List<Widget>();
    listWidgets.addAll(tobaccoWidgetList);
    listWidgets.add(Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Suggestion',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: new SuggestedTobacco(
                    tobacco: ownedTobacco[0],
                    onPressed: () => setState(() {
                          addTobacco(ownedTobacco[0], 5);
                        }),
                  )),
              Expanded(
                  flex: 2,
                  child: new SuggestedTobacco(
                    tobacco: ownedTobacco[1],
                  )),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => showSearchDialog(
                      context: context,
                      child: new PipeAccesorySearch(
                        type: 'Tobacco',
                        searchType: 'Tobacco',
                        ownAccesories: ownedTobacco,
                      )),
                ),
              )
            ],
          ),
        ),
      ],
    ));
    listWidgets.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: new RoundedButton(
            child: Text('SAVE'),
            onTap: () {
              Navigator.pop(context, createSaveModel());
            },
            buttonColor: Colors.transparent,
            borderWidth: 1.0,
            bottomMargin: 1.0,
            height: 40.0,
            width: (MediaQuery.of(context).size.width) * 0.4,
          ),
        ),
      ),
    );

    return Material(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          tobaccoList.length <= 1
              ? AppBar(
                  elevation: 0,
                  backgroundColor: Colors.black,
                )
              : AppBar(
                  backgroundColor: Colors.black,
                  centerTitle: true,
                  title: TextField(
                    decoration: InputDecoration(labelText: 'Mix name'),
                    controller: controller,
                  ),
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListView(
                  children: listWidgets,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addTobacco(PipeAccesorySimpleDto tobacco, double weight) {
    setState(() {
      if (tobaccoList.where((t) => t.id == tobacco.id).length == 0) {
        tobaccoList.add(tobacco);
        tobaccoWeight[tobacco.id] = weight ?? 5;
      }
    });
  }

  void removeTobacco(PipeAccesorySimpleDto tobacco) {
    setState(() {
      if (tobaccoList.where((t) => t.id == tobacco.id).length != 0) {
        tobaccoList.remove(tobacco);
        tobaccoWeight.remove(tobacco.id);
      }
    });
  }
}

class SuggestedTobacco extends StatelessWidget {
  final PipeAccesorySimpleDto tobacco;
  final VoidCallback onPressed;
  const SuggestedTobacco({
    Key key,
    this.tobacco,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            width: 150.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1, //                   <--- border width here
              ),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(40.0),
                right: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Text(
                    tobacco.name,
                    style: Theme.of(context).textTheme.display4,
                  ),
                  Text(tobacco.brand)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 8,
          child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.grey,
                  width: 1, //                   <--- border width here
                ),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(40.0),
                  right: Radius.circular(40.0),
                ),
              ),
              child: InkWell(
                child: Icon(Icons.add),
                onTap: onPressed,
              )),
        )
      ],
    );
  }
}

Widget _selectedTobacco(PipeAccesorySimpleDto t) {
  return new Text(t.name);
}
