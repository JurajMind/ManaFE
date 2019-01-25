import 'package:app/app/app.dart';
import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class TobaccoSearch extends StatefulWidget {
  final List<PipeAccesorySimpleDto> ownAccesories;
  final String type;

  const TobaccoSearch({
    Key key,
    this.ownAccesories,
    this.type,
  }) : super(key: key);

  @override
  TobaccoSearchState createState() {
    return new TobaccoSearchState();
  }
}

Future showTobaccoSearchDialog({BuildContext context}) async {
  PipeAccesorySimple save = await Navigator.of(context)
      .push(new MaterialPageRoute<PipeAccesorySimple>(
          builder: (BuildContext context) {
            return new TobaccoSearch();
          },
          fullscreenDialog: true));
}

class TobaccoSearchState extends State<TobaccoSearch> {
  BehaviorSubject<List<PipeAccesorySimpleDto>> searchResult =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>(
          seedValue: new List<PipeAccesorySimpleDto>());

  bool loading = false;
  List<PipeAccesorySimpleDto> selectedTobacco;
  List<PipeAccesorySimpleDto> ownSimpleAccesories;

  @override
  void initState() {
    super.initState();
    selectedTobacco = new List<PipeAccesorySimpleDto>();
    ownSimpleAccesories = widget.ownAccesories;
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
    return Container(
      width: 300.0,
      height: 300.0,
      child: Material(
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.black,
              actions: <Widget>[
                this.loading
                    ? CircularProgressIndicator()
                    : IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => submitSearch(controller.text),
                      )
              ],
              centerTitle: true,
              title:
                  TextField(controller: controller, onSubmitted: submitSearch),
            ),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                controller.text == "" ? buildDefault() : buildResult()
              ],
            ))
          ],
        ),
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

Widget _selectedTobacco(PipeAccesorySimpleDto t) {
  return new Text(t.name);
}
