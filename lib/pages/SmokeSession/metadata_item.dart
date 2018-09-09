import 'package:app/app/app.dart';
import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
import 'package:app/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:loader_search_bar/loader_search_bar.dart';
import 'package:rxdart/rxdart.dart';

class MetadataItem extends StatelessWidget {
  final String type;
  final String searchType;

  final IconData icon;

  final List<PipeAccesory> pipeAccesories;

  final int selected;

  const MetadataItem(
      {Key key,
      this.type,
      this.icon,
      this.pipeAccesories,
      this.selected,
      this.searchType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = new RoundedRectangleBorder(
      side: const BorderSide(
          width: 0.66, style: BorderStyle.solid, color: Colors.white),
      borderRadius: BorderRadius.circular(20.0),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      child: new Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                type,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )),
          Row(
            children: <Widget>[
              Expanded(
                child: Icon(
                  icon,
                  color: Colors.grey,
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:
                      pipeAccesoryChips(pipeAccesories.take(1).toList(), shape),
                ),
                flex: 4,
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => showDemoDialog<void>(
                      context: context,
                      child: new PipeAccesorySearch(
                        type: type,
                        searchType: searchType,
                        ownAccesories: pipeAccesories,
                      )),
                ),
                flex: 1,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: pipeAccesoryChips(
                pipeAccesories.skip(1).take(2).toList(), shape),
          )
        ],
      ),
    );
  }

  List<Widget> pipeAccesoryChips(
      List<PipeAccesory> acc, RoundedRectangleBorder shape) {
    return acc.map<Widget>((PipeAccesory acc) {
      return new FilterChip(
        label: Text(acc.fullName),
        shape: shape,
        onSelected: (value) => print(value),
        selectedColor: Colors.white,
        labelStyle:
            TextStyle(color: acc.id == selected ? Colors.black : Colors.white),
        backgroundColor: Colors.black,
        selected: acc.id == selected,
      );
    }).toList();
  }

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        scaffoldKey.currentState.showSnackBar(
            new SnackBar(content: new Text('You selected: $value')));
      }
    });
  }
}

class PipeAccesorySearch extends StatefulWidget {
  final List<PipeAccesory> ownAccesories;
  final String type;
  final String searchType;

  const PipeAccesorySearch({
    Key key,
    this.ownAccesories,
    this.type,
    this.searchType,
  }) : super(key: key);

  @override
  PipeAccesorySearchState createState() {
    return new PipeAccesorySearchState();
  }
}

class PipeAccesorySearchState extends State<PipeAccesorySearch> {
  BehaviorSubject<List<PipeAccesorySimple>> searchResult =
      new BehaviorSubject<List<PipeAccesorySimple>>(
          seedValue: new List<PipeAccesorySimple>());

  bool loading = false;

  List<PipeAccesorySimple> ownSimpleAccesories;

  @override
  void initStete() {
    super.initState();
    ownSimpleAccesories = widget.ownAccesories
        .map((f) => PipeAccesorySimple.fromAccesory(f))
        .toList();
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
              centerTitle: true,
              title: Text('Search ${widget.type}'),
            ),
            Container(
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: !this.loading
                        ? Icon(Icons.search)
                        : SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator()),
                  ),
                  Flexible(
                    child: TextField(
                        controller: controller,
                        onSubmitted: (text) {
                          setState(() {
                            loading = true;
                          });
                          App.http
                              .searchGear(
                                  text, widget.searchType.toLowerCase(), 0, 10)
                              .then((value) {
                            this.searchResult.add(value);
                            setState(() {
                              loading = false;
                            });
                          });
                        }),
                    flex: 4,
                  ),
                ],
              ),
            ),
            Expanded(
                child: controller.text == "" ? buildDefault() : buildResult())
          ],
        ),
      ),
    );
  }

  StreamBuilder<List<PipeAccesorySimple>> buildResult() {
    return StreamBuilder<List<PipeAccesorySimple>>(
        stream: searchResult,
        initialData: ownSimpleAccesories,
        builder: (context, snapshot) => ListView.builder(
              shrinkWrap: false,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) =>
                  _createResult(index, snapshot.data[index], context),
            ));
  }

  Widget buildDefault() {
    return ListView(
      children: ownSimpleAccesories.map((f) => _createResult(0, f, context)),
    );
  }

  _createResult(int index, PipeAccesorySimple data, BuildContext context) {
    return ListTile(
      title: Text("${data.brand} ${data.name}"),
    );
  }
}
