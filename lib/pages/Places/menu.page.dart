import 'package:app/models/Places/place.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/menu_bloc.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final Place place;
  MenuPage({this.place});

  @override
  State<StatefulWidget> createState() {
    return new _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  MenuBloc menuBloc;

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
    // TODO: implement build
    return SafeArea(
      child: Theme(
        isMaterialAppTheme: true,
        data: ThemeData.light(),
        child: Container(
          child: Column(
            children: <Widget>[
              new AppBar(
                iconTheme: IconThemeData(
                  color: Colors.black, //change your color here
                ),
                title: new Text(
                  'Menu of ${this.widget.place.name}',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
              ),
              Flexible(
                child: PageView(children: <Widget>[
                  Placeholder(
                    color: Colors.red,
                  ),
                  Placeholder(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
