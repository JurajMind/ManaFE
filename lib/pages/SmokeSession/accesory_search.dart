import 'package:app/app/app.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/general/gear_bloc.dart';
import 'package:app/module/person/person_bloc.dart';
import 'package:app/pages/Gear/add_gear_page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class PipeAccesorySearch extends StatefulWidget {
  final List<PipeAccesorySimpleDto> ownAccesories;
  final String type;
  final String searchType;
  final PersonBloc personBloc;
  final GearBloc gearBloc;

  const PipeAccesorySearch({
    Key key,
    this.ownAccesories,
    this.type,
    this.searchType,
    this.personBloc,
    this.gearBloc,
  }) : super(key: key);

  @override
  PipeAccesorySearchState createState() {
    return new PipeAccesorySearchState();
  }
}

class PipeAccesorySearchState extends State<PipeAccesorySearch> {
  BehaviorSubject<List<PipeAccesorySimpleDto>> searchResult =
      new BehaviorSubject<List<PipeAccesorySimpleDto>>.seeded(
          new List<PipeAccesorySimpleDto>());
  final searchOnChange = new BehaviorSubject<String>();
  bool loading = false;
  String lastSearch = "";

  List<PipeAccesorySimpleDto> ownSimpleAccesories;

  @override
  void initState() {
    super.initState();
    ownSimpleAccesories =
        widget.ownAccesories ?? new List<PipeAccesorySimpleDto>();
    searchOnChange
        .debounceTime(Duration(milliseconds: 500))
        .listen((queryString) {
      if (queryString.length > 3) submitSearch(queryString);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    this.searchResult.close();
    this.searchOnChange.close();
  }

  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,
      child: Material(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.black,
              actions: <Widget>[
                Hero(
                  tag: "${widget.type}_search_icon",
                  child: this.loading
                      ? IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                        )
                      : IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () => submitSearch(controller.text),
                        ),
                )
              ],
              centerTitle: true,
              title: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 800),
                  child: TextField(
                    style: Theme.of(context).textTheme.headline5,
                    decoration: new InputDecoration(
                        hintText:
                            '${AppTranslations.of(context).text("common.search")} ${AppTranslations.of(context).text("gear." + widget.type.toLowerCase())}'),
                    controller: controller,
                    onSubmitted: submitSearch,
                    onChanged: _search,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Center(
                    child: Container(
                        constraints: BoxConstraints(maxWidth: 800),
                        child: controller.text == ""
                            ? buildDefault()
                            : buildResult())))
          ],
        ),
      ),
    );
  }

  void _search(String queryString) {
    searchOnChange.add(queryString);
  }

  void submitSearch(text) {
    if (text == "") return;
    if (text == lastSearch) return;
    setState(() {
      loading = true;
      lastSearch = text;
    });
    this.searchResult.add(new List<PipeAccesorySimpleDto>());
    App.http
        .searchGear(text, widget.searchType.toLowerCase(), 0, 1000)
        .then((value) {
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
        builder: (context, snapshot) {
          if (snapshot.data.length == 0) {
            if (loading) {
              return Center(child: CircularProgressIndicator());
            }

            return Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: AppTranslations.of(context).text("gear.no_result_1"),
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: controller.text,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: AppTranslations.of(context)
                              .text("gear.no_result_2")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push<PipeAccesorySimpleDto>(MaterialPageRoute(
                            builder: (context) => AddGearPage(
                                selectedType: widget.searchType,
                                pretypedName: controller.text,
                                bloc: widget.gearBloc),
                            fullscreenDialog: true))
                        .then((newGear) {
                      Navigator.of(context).pop(newGear);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: AppTranslations.of(context)
                              .text("gear.no_result_3"),
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: controller.text,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: AppTranslations.of(context)
                                        .text("gear.no_result_4") +
                                    ' ${widget.searchType}'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Icon(
                        Icons.add,
                        size: 40,
                      )
                    ],
                  ),
                )
              ],
            ));
          }

          var data = getIt.get<PersonBloc>() ?? widget.personBloc;
          return StreamBuilder<List<PipeAccesorySimpleDto>>(
              stream: data?.myGear,
              builder: (context, ownSs) {
                return new ListView.builder(
                    itemCount: snapshot.data.length + 1,
                    itemBuilder: (context, index) {
                      if (index >= snapshot.data.length) {
                        return new ListTile(
                          leading: Icon(Icons.add),
                          onTap: () => Navigator.of(context)
                              .push<PipeAccesorySimpleDto>(MaterialPageRoute(
                                  builder: (context) => AddGearPage(
                                      selectedType: widget.searchType,
                                      pretypedName: controller.text,
                                      bloc: widget.gearBloc),
                                  fullscreenDialog: true))
                              .then((newGear) {
                            Navigator.of(context).pop(newGear);
                          }),
                          title: Center(
                              child:
                                  Text('Not found what you were looking for?')),
                          subtitle: Center(
                            child: RichText(
                              text: TextSpan(
                                text: AppTranslations.of(context)
                                    .text("gear.no_result_3"),
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: controller.text,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: AppTranslations.of(context)
                                              .text("gear.no_result_4") +
                                          '${widget.searchType}'),
                                ],
                              ),
                            ),
                          ),
                        );
                      }

                      var owned = (ownSs.data?.indexWhere(
                                  (a) => a.id == snapshot.data[index].id) ??
                              -1) !=
                          -1;

                      return _createResult(
                          index, snapshot.data[index], context, owned);
                    });
              });
        });
  }

  Widget buildDefault() {
    return new ListView(
      children: ownSimpleAccesories
          .map((f) => _createResult(0, f, context, true))
          .toList(),
    );
  }

  ListTile _createResult(
      int index, PipeAccesorySimpleDto data, BuildContext context, bool owned) {
    var text = '${data.brand} ${data.name}';

    return new ListTile(
        leading: owned
            ? Icon(Icons.check_circle_outline)
            : Container(
                width: 0.0,
                height: 10.0,
              ),
        onTap: () => Navigator.pop(context, data),
        title: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.headline5,
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
    const nonMatchStyle = const TextStyle(
      fontWeight: FontWeight.normal,
      fontFamily: 'Montserrat',
    );
    const matchStyle = const TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: 'Montserrat',
    );
    var result = new List<TextSpan>();
    if (match == "") {
      return [new TextSpan(text: text, style: nonMatchStyle)];
    }
    var index = getIndexes(text.toLowerCase(), match.toLowerCase());

    if (index.length == 0) {
      return [new TextSpan(text: text, style: nonMatchStyle)];
    }
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
