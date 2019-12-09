import 'package:app/app/app.dart';
import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mix_card_expanded_shimmer.dart';
import 'package:app/pages/SmokeSession/accesory_search.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class MixSearchPage extends StatefulWidget {
  final List<PipeAccesorySimpleDto> selectedTobacco;

  MixSearchPage({Key key, this.selectedTobacco}) : super(key: key);

  @override
  _MixSearchPageState createState() => _MixSearchPageState();
}

class _MixSearchPageState extends State<MixSearchPage> {
  List<PipeAccesorySimpleDto> selectedTobacco =
      new List<PipeAccesorySimpleDto>();

  Map<PipeAccesorySimpleDto, Color> indexColor =
      new Map<PipeAccesorySimpleDto, Color>();

  BehaviorSubject<List<TobaccoMixSimpleDto>> tobaccoMix =
      new BehaviorSubject<List<TobaccoMixSimpleDto>>();

  var loading = false;
  String searchString;
  var textController = new TextEditingController();
  @override
  void initState() {
    if (widget.selectedTobacco != null && widget.selectedTobacco.length > 0) {
      this.selectedTobacco.addAll(widget.selectedTobacco);

      for (int i = 0; i < widget.selectedTobacco.length; i++) {
        indexColor[widget.selectedTobacco[i]] = AppColors.colors[i];
      }
    }
    searchMixes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var personBloc = DataProvider.getData(context).personBloc;
    var gearBloc = DataProvider.getData(context).gearBloc;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Search mix'.toUpperCase()),
            centerTitle: true,
            leading: BackButton(),
          ),
          body: StreamBuilder<List<TobaccoMixSimpleDto>>(
              stream: tobaccoMix,
              builder: (context, snapshot) {
                return ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.search),
                      title: TextField(
                        autofocus: true,
                        controller: textController,
                        onSubmitted: (text) {
                          searchMixes();
                        },
                        onChanged: (data) {
                          setState(() {
                            this.searchString = data;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: 'Search by mix name',
                            border: InputBorder.none,
                            labelStyle: Theme.of(context).textTheme.body2),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () => setState(() {
                          this.searchString = "";
                          textController.text = "";
                        }),
                      ),
                    ),
                    ...selectedTobacco.map((t) => TobaccoSearchItem(
                          t,
                          color: indexColor[t],
                          onPress: () {
                            removeTobacco(t);
                          },
                        )),
                    selectedTobacco.length < 4
                        ? InkWell(
                            onTap: () => showSearchDialog(
                                context: context,
                                child: new PipeAccesorySearch(
                                  type: 'Tobacco',
                                  searchType: 'Tobacco',
                                  personBloc: personBloc,
                                  gearBloc: gearBloc,
                                  ownAccesories: personBloc.myGear.value
                                      .where((s) => s.type == "Tobacco")
                                      .toList(),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Add item in mix',
                                      style:
                                          Theme.of(context).textTheme.display3),
                                  Icon(Icons.add)
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    Divider(),
                    Center(
                      child: Text(
                        "Mixes",
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                    if (loading) ...{
                      if (selectedTobacco.length > 0)
                        ...List.generate(
                            10,
                            (index) => MixCardExpandedShimmer(
                                  move: false,
                                ))
                    } else ...{
                      if (snapshot.data != null) ...{
                        ...snapshot.data.map((m) => MixCardExpanded(
                              tobaccoMix: m,
                              multiHighlight:
                                  indexColor.map((f, c) => MapEntry(f.id, c)),
                            ))
                      } else ...{
                        Center(
                          child: Text('Enter part tobacco'),
                        )
                      },
                    },
                    SizedBox(
                      height: 55,
                    )
                  ],
                );
              })),
    );
  }

  void showSearchDialog({BuildContext context, Widget child}) {
    showDialog<PipeAccesorySimpleDto>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((PipeAccesorySimpleDto value) {
      if (value != null) {
        setState(() {
          addTobacco(value);
        });
      }
    });
  }

  void addTobacco(PipeAccesorySimpleDto tobacco) {
    if (selectedTobacco.length == 4) return;
    setState(() {
      if (selectedTobacco.where((t) => t.id == tobacco.id).length == 0) {
        selectedTobacco.add(tobacco);
        indexColor[tobacco] = AppColors.colors[selectedTobacco.length - 1];
        searchMixes();
      }
    });
  }

  void removeTobacco(PipeAccesorySimpleDto tobacco) {
    setState(() {
      selectedTobacco.remove(tobacco);
      indexColor.remove(tobacco);
      searchMixes();
    });
  }

  void searchMixes() {
    setState(() {
      loading = true;
    });
    App.http
        .suggestMix(this.selectedTobacco.map((f) => f.id).toList(),
            name: searchString)
        .then((onValue) {
      this.tobaccoMix.add(onValue);
      setState(() {
        loading = false;
      });
    });
  }
}

class TobaccoSearchItem extends StatelessWidget {
  final PipeAccesorySimpleDto t;
  final Function onPress;
  final Color color;
  const TobaccoSearchItem(
    this.t, {
    Key key,
    this.onPress,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
        icon: Icon(Icons.cancel),
        onPressed: onPress,
        color: color,
      ),
      title: Text(
        "${t.brand} ${t.name}",
        style: Theme.of(context).textTheme.display2,
      ),
    );
  }
}
