import 'package:app/module/data_provider.dart';
import 'package:app/module/places/menu_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class MenuPage extends StatefulWidget {
  final PlaceSimpleDto place;
  MenuPage({this.place});

  @override
  State<StatefulWidget> createState() {
    return new _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  MenuBloc menuBloc;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (menuBloc == null) {
      menuBloc = DataProvider.getData(context).menuBloc;
    }
    menuBloc.loadMenu(widget.place.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: PageView(
            pageSnapping: true,
            controller: _pageController,
            children: <Widget>[
              Column(
                children: <Widget>[
                  this.header(context, "TOBACCO", 0),
                  Expanded(
                    child: pipeAccesoryBuilder(menuBloc.tobacco),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  this.header(context, "HOOKAHS", 1),
                  Expanded(
                    child: pipeAccesoryBuilder(menuBloc.hookahs),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  this.header(context, "BOWLS", 2),
                  Expanded(
                    child: pipeAccesoryBuilder(menuBloc.bowls),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  this.header(context, "EXTRA", 3),
                  Expanded(child: extraBuilder(menuBloc.extra))
                ],
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
            ? _pageController.previousPage(
                duration: duration, curve: Curves.easeOut)
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
            onPressed: () => _pageController.nextPage(
                duration: duration, curve: Curves.easeOut),
            icon: Icon(
              Icons.chevron_right,
              size: 40.0,
            )),
      ],
    );
  }

  StreamBuilder<List<PipeAccesorySimpleDto>> pipeAccesoryBuilder(
      BehaviorSubject<List<PipeAccesorySimpleDto>> accesorries) {
    return StreamBuilder(
        stream: accesorries,
        initialData: null,
        builder: (context, snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) =>
                _createPlaceItem(index, snapshot.data[index]),
            itemCount: snapshot.data == null ? 0 : snapshot.data.length,
          );
        });
  }

  StreamBuilder<List<SmartHookahModelsOrderExtraDto>> extraBuilder(
      BehaviorSubject<List<SmartHookahModelsOrderExtraDto>> accesorries) {
    return StreamBuilder(
        stream: accesorries,
        initialData: null,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                  child: Center(child: Text(snapshot.data[index].name)),
                );
              },
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
            ),
          );
        });
  }

  Widget _createPlaceItem(int index, PipeAccesorySimpleDto data) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
      child: ListTile(
        trailing: Icon(Icons.chevron_right),
        leading: SizedBox(
            height: 60.0,
            width: 60.0,
            child: Hero(
              tag: '_picture',
              child: new CachedNetworkImage(
                imageUrl: "http://via.placeholder.com/350x150",
                placeholder: new CircularProgressIndicator(),
                errorWidget: new Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            )),
        title: Text(data.name),
        subtitle: Text(data.brand),
      ),
    );
  }
}
