import 'package:app/const/theme.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/accesory_search.dart';
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
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(right: 4),
                            height: 30,
                            child: Extensions.defaultTypePicture(this.type)),
                        Text(
                          type,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
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
            runAlignment: WrapAlignment.start,
            children: pipeAccesoryChips(pipeAccesories, selectedAccesories),
          )
        ],
      ),
    );
  }

  List<Widget> pipeAccesoryChips(
      List<PipeAccesorySimpleDto> acc, PipeAccesorySimpleDto selected) {
    var sorted = new List<PipeAccesorySimpleDto>.from(acc);
    sorted.sort((a, b) {
      return a.name.compareTo(b.name);
    });

    sorted = sorted.take(5).toList();
    if (sorted.indexOf(selected) == -1) {
      if (selected?.id != null) sorted.insert(0, selected);
    }

    return sorted.take(5).map<Widget>((a) {
      return FilterChip(
        selected: a?.id == selected?.id,
        accesory: a,
        bloc: bloc,
        searchType: searchType,
      );
    }).toList();
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

class FilterChip extends StatelessWidget {
  final PipeAccesorySimpleDto accesory;
  final bool selected;
  final SmokeSessionBloc bloc;
  const FilterChip(
      {Key key, this.accesory, this.selected, this.bloc, this.searchType})
      : super(key: key);
  final String searchType;

  @override
  Widget build(BuildContext context) {
    var name = '';
    if (accesory?.name != null) {
      name = '${accesory.brand} ${accesory.name}';
    }
    return Padding(
        padding: const EdgeInsets.all(4),
        child: InkWell(
          onTap: () {
            if (selected) {
              this.bloc.setMetadataAccesory(null, searchType);
            } else {
              this.bloc.setMetadataAccesory(accesory, searchType);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: selected ? AppColors.colors[0] : AppColors.black,
                borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                border: new Border.all(
                    color: const Color.fromRGBO(221, 221, 221, 1.0), width: 1)),
            padding: EdgeInsets.all(5),
            child: Text(
              name,
              style: Theme.of(context).textTheme.display4,
            ),
          ),
        ));
  }
}
