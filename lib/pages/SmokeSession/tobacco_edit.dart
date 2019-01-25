import 'package:app/app/app.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/SmokeSession/tobacco_slider.dart';
import 'package:app/models/PipeAccesory/tobacco.dart';
import 'package:app/models/PipeAccesory/tobacco_mix.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class TobaccoEditWidget extends StatefulWidget {
  final String type;
  final Tobacco tobacco;
  final TobaccoMix mix;
  const TobaccoEditWidget({
    this.tobacco,
    Key key,
    this.type,
    this.mix,
  }) : super(key: key);

  @override
  TobaccoEditWidgetState createState() {
    return new TobaccoEditWidgetState();
  }
}

class TobaccoEditWidgetState extends State<TobaccoEditWidget> {
  BehaviorSubject<List<PipeAccesorySimpleDto>> searchResult =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>(
          seedValue: new List<PipeAccesorySimpleDto>());

  bool loading = false;
  OverlayEntry _overlayEntry;
  final FocusNode _focusNode = FocusNode();
  List<PipeAccesorySimpleDto> selectedTobacco;
  List<PipeAccesorySimpleDto> ownSimpleAccesories;
  List<PipeAccesorySimpleDto> tobaccoList = new List<PipeAccesorySimpleDto>();
  Map<int, double> tobaccoWeight = new Map<int, double>();
  @override
  void initState() {
    super.initState();
    selectedTobacco = new List<PipeAccesorySimpleDto>();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context).insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(builder: (context) {
      var ownedTobacco = DataProvider.getData(context)
          .personBloc
          .myGear
          .value
          .where((s) => s.type == "Tobacco")
          .toList();
      return Positioned(
        left: 0.0,
        top: 80.0,
        width: size.width,
        child: Material(
          elevation: 4.0,
          child: Container(
            height: 300.0,
            child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: ownedTobacco
                    .map((f) => ListTile(
                        title: Text(f.name),
                        subtitle: Text(f.brand),
                        onTap: () {
                          if (tobaccoList.where((t) => t.id == f.id).length ==
                              0) {
                            tobaccoList.add(f);
                            tobaccoWeight[f.id] = 5;
                          }
                        }))
                    .toList()),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    this.searchResult.close();
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
                        this.tobaccoList.remove(item);
                      })),
              Text(
                item.name,
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
                          tobaccoList.add(ownedTobacco[0]);
                          tobaccoWeight[ownedTobacco[0].id] = 5;
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
                  onPressed: () {},
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
            onTap: () {},
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
          tobaccoList.length <= 2
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
                    onSubmitted: submitSearch,
                    focusNode: this._focusNode,
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

  Widget _selectBox() {
    if (this.selectedTobacco.length == 0) {
      return Container();
    }
    return new Row(
      children: this.selectedTobacco.map((t) => _selectedTobacco(t)),
    );
  }

  void submitSearch(text) {
    if (text == "") return;
    setState(() {
      loading = true;
    });
    this.searchResult.add(new List<PipeAccesorySimpleDto>());
    App.http.searchGear(text, 'tobacco', 0, 1000).then((value) {
      this.searchResult.add(value);
      setState(() {
        loading = false;
      });
    });
  }

  StreamBuilder<List<PipeAccesorySimpleDto>> buildResult() {
    return StreamBuilder<List<PipeAccesorySimpleDto>>(
        stream: searchResult,
        initialData: new List<PipeAccesorySimpleDto>(),
        builder: (context, snapshot) => new ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) =>
                  _createResult(index, snapshot.data[index], context),
            ));
  }

  Widget buildDefault() {
    return new ListView(
      children:
          ownSimpleAccesories.map((f) => _createResult(0, f, context)).toList(),
    );
  }

  Widget _getLeading(PipeAccesorySimpleDto data) {
    if (this.selectedTobacco.where((a) => a.id == data.id).length > 0) {
      return Icon(Icons.check_circle_outline);
    }
    if (false) {
      return Icon(Icons.shopping_basket);
    }
    return Icon(Icons.check_box_outline_blank);
  }

  ListTile _createResult(
      int index, PipeAccesorySimpleDto data, BuildContext context) {
    var text = '${data.brand} ${data.name}';

    return new ListTile(
        leading: _getLeading(data),
        onTap: () {
          setState(() {
            if (selectedTobacco.contains(data)) {
              selectedTobacco.remove(data);
            } else {
              selectedTobacco.add(data);
            }
          });
        },
        title: RichText(
            text: TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
                children: getChunks(text, controller.text))));
  }

  List<int> getIndexes(String text, String match) {
    var result = new List<int>();
    var index = text.indexOf(match);

    while (index != -1) {
      result.add(index);
      index = text.indexOf(match, index + 1);
    }
    return result;
  }

  List<TextSpan> getChunks(String text, String match) {
    const nonMatchStyle = const TextStyle(fontWeight: FontWeight.normal);
    const matchStyle = const TextStyle(
      fontWeight: FontWeight.w700,
    );
    var result = new List<TextSpan>();
    if (match == "") {
      return [new TextSpan(text: text, style: nonMatchStyle)];
    }
    var index = getIndexes(text.toLowerCase(), match.toLowerCase());

    for (var i = 0; i < index.length; i++) {
      if (index[i] != 0) {
        result.add(new TextSpan(
            text: text.substring(0, index[i]), style: nonMatchStyle));
      }
      result.add(new TextSpan(
          text: text.substring(index[i], index[i] + match.length),
          style: matchStyle));
    }

    if (index.last < text.length) {
      result.add(new TextSpan(
          text: text.substring(index.last + match.length),
          style: nonMatchStyle));
    }
    return result;
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
