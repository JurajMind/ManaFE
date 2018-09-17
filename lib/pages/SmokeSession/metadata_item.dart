import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/accesory_search.dart';
import 'package:app/pages/home.page.dart';
import 'package:flutter/material.dart';

class MetadataItem extends StatelessWidget {
  final String type;
  final String searchType;

  final IconData icon;

  final List<PipeAccesory> pipeAccesories;

  final PipeAccesorySimple selectedAccesories;

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
                  onPressed: () => showDemoDialog(
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

  List<Widget> pipeAccesoryChips(
      List<PipeAccesory> acc, PipeAccesorySimple selected, firstLine) {
    var simple = acc.map((f) => PipeAccesorySimple.fromAccesory(f)).toList();

    if (selected != null) {
      simple = simple.where((a) => a.id != selected.id).toList();
    }

    if (firstLine) {
      if (selected == null && simple.length < 1) {
        return [new Text('No owned')];
      }
      if (selected != null) {
        if (simple.where((a) => a.id == selected.id).length > 1)
          simple = simple.skip(1).toList();
        return [filterChip(selected, true)];
      } else {
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

  Widget filterChip(PipeAccesorySimple accesory, bool selected) {
    final shape = new RoundedRectangleBorder(
      side: const BorderSide(
          width: 0.66, style: BorderStyle.solid, color: Colors.white),
      borderRadius: BorderRadius.circular(20.0),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
      child: new FilterChip(
        label: Text(accesory.fullName),        
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

  void showDemoDialog({BuildContext context, Widget child}) {
    showDialog<PipeAccesorySimple>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((PipeAccesorySimple value) {
      if (value != null) {
        this.bloc.setMetadataAccesory(value, searchType);
      }
    });
  }
}
