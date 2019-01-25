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
              child: Text(
                type,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )),
          Row(
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () =>
                      this.bloc.setMetadataAccesory(null, searchType),
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: pipeAccesoryChips(
                      pipeAccesories, selectedAccesories, true),
                ),
                flex: 4,
              ),
              Expanded(
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
                flex: 1,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
                pipeAccesoryChips(pipeAccesories, selectedAccesories, false),
          )
        ],
      ),
    );
  }

  List<Widget> pipeAccesoryChips(List<PipeAccesorySimpleDto> acc,
      PipeAccesorySimpleDto selected, firstLine) {
    var simple = new List<PipeAccesorySimpleDto>.from(acc);

    if (acc.length == 0) {}
    if (selected != null) {
      simple = acc.where((a) => a.id != selected.id).toList();
    }

    if (firstLine) {
      if (selected == null && simple.length < 1) {
        return [new Text('No owned')];
      }
      if (selected.id != null) {
        if (simple.where((a) => a.id == selected.id).length > 1)
          simple = simple.skip(1).toList();
        return [filterChip(selected, true)];
      } else {
        if (simple.length == 0) {
          return [Container()];
        }
        return [filterChip(simple.first, false)];
      }
    } else {
      if (selected != null && simple.length > 1)
        simple = simple.skip(1).toList();
      if (simple.length > 2) simple = simple.take(2).toList();
      return simple.map<Widget>((a) {
        return filterChip(a, false);
      }).toList();
    }
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
