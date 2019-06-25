import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/accesory_search.dart';
import 'package:app/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class MetadataItem extends StatelessWidget {
  final String type;
  final String searchType;

  final IconData icon;

  final List<PipeAccesorySimpleDto> pipeAccesories;

  final PipeAccesorySimpleDto selectedAccesories;

  final SmokeSessionBloc bloc;

  const MetadataItem(
      {Key key,
      this.type,
      this.icon,
      this.pipeAccesories,
      this.searchType,
      this.selectedAccesories,
      this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      child: new Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Text(
                      type,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Hero(
                      tag: "${type}_search_icon",
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => showSearchDialog(
                            context: context,
                            child: new PipeAccesorySearch(
                              type: type,
                              searchType: searchType,
                              ownAccesories: pipeAccesories,
                            )),
                      ),
                    ),
                    flex: 1,
                  )
                ],
              )),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: pipeAccesoryChips(pipeAccesories, selectedAccesories),
          )
        ],
      ),
    );
  }

  List<Widget> pipeAccesoryChips(
      List<PipeAccesorySimpleDto> acc, PipeAccesorySimpleDto selected) {
    acc.sort((a, b) {
      if (a.id == selected.id) {
        return -100;
      }
      return a.name.compareTo(b.name);
    });

    return acc.take(5).map<Widget>((a) {
      return filterChip(a, a.id == selected.id);
    }).toList();
  }

  Widget filterChip(PipeAccesorySimpleDto accesory, bool selected) {
    final shape = new RoundedRectangleBorder(
      side: const BorderSide(
          width: 0.66, style: BorderStyle.solid, color: Colors.white),
      borderRadius: BorderRadius.circular(20.0),
    );
    var name = '';
    if (accesory.name != null) {
      name = '${accesory.brand} ${accesory.name}';
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
      child: new FilterChip(
        label: Text(name),
        shape: shape,
        onSelected: (value) {
          this.bloc.setMetadataAccesory(accesory, searchType);
        },
        selectedColor: Colors.white,
        disabledColor: Colors.black,
        labelStyle: TextStyle(color: selected ? Colors.black : Colors.white),
        backgroundColor: selected ? Colors.white : Colors.black,
        selected: selected,
      ),
    );
  }

  void showSearchDialog({BuildContext context, Widget child}) {
    showDialog<PipeAccesorySimpleDto>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((PipeAccesorySimpleDto value) {
      if (value != null) {
        this.bloc.setMetadataAccesory(value, searchType);
      }
    });
  }
}
