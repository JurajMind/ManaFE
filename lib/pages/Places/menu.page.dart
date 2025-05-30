import 'package:app/components/PipeAccesory/pipe_accesory_list_item.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/menu_bloc.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:rxdart/rxdart.dart';

class MenuPage extends StatefulWidget {
  final PlaceSimpleDto? place;
  MenuPage({this.place});

  @override
  State<StatefulWidget> createState() {
    return new _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  MenuBloc? menuBloc;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (menuBloc == null) {
      menuBloc = DataProvider.getData(context)!.menuBloc;
    }
    menuBloc!.loadMenu(widget.place!.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(pageSnapping: true, controller: _pageController, children: <Widget>[
          Column(
            children: <Widget>[
              this.header(context, AppTranslations.of(context)!.text("gear.tobacco").toUpperCase(), 0),
              Expanded(
                child: new StreamAccessoryList(accesorries: menuBloc!.tobacco),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              this.header(context, AppTranslations.of(context)!.text("gear.pipes").toUpperCase(), 1),
              Expanded(
                child: new StreamAccessoryList(accesorries: menuBloc!.hookahs),
              )
            ],
          ),
          Column(
            children: <Widget>[
              this.header(context, AppTranslations.of(context)!.text("gear.bowls").toUpperCase(), 2),
              Expanded(
                child: new StreamAccessoryList(accesorries: menuBloc!.bowls),
              )
            ],
          ),
          Column(
            children: <Widget>[this.header(context, "EXTRA", 3), Expanded(child: extraBuilder(menuBloc!.extra))],
          ),
        ]),
      ),
    );
  }

  Widget header(BuildContext context, String title, int page) {
    Duration duration = new Duration(milliseconds: 300);

    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => page > 0
            ? _pageController!.previousPage(duration: duration, curve: Curves.easeOut)
            : Navigator.pop(context),
        icon: Icon(
          Icons.chevron_left,
          size: 40.0,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      centerTitle: false,
      actions: <Widget>[
        IconButton(
            onPressed: () => _pageController!.nextPage(duration: duration, curve: Curves.easeOut),
            icon: Icon(
              Icons.chevron_right,
              size: 40.0,
            )),
      ],
    );
  }

  Widget extraBuilder(BehaviorSubject<List<SmartHookahModelsOrderExtraDto>?> accesorries) {
    return StreamBuilder<List<SmartHookahModelsOrderExtraDto>?>(
        stream: accesorries.stream,
        initialData: null,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                  child: Center(child: Text(snapshot.data![index].name!)),
                );
              },
              itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
            ),
          );
        });
  }
}

class StreamAccessoryList extends StatelessWidget {
  const StreamAccessoryList({
    Key? key,
    required this.accesorries,
  }) : super(key: key);

  final BehaviorSubject<List<PipeAccesorySimpleDto>?> accesorries;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PipeAccesorySimpleDto>?>(
        stream: accesorries,
        initialData: null,
        builder: (context, snapshot) {
          return snapshot == null
              ? ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return new PipeAccesoryListItemShimmer();
                  },
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    if (index >= snapshot.data!.length) {
                      return SizedBox(height: 100);
                    }
                    return PipeAccesoryListItem(pipeAccesory: snapshot.data![index]);
                  },
                  itemCount: snapshot.data == null ? 0 : snapshot.data!.length + 1,
                );
        });
  }
}
