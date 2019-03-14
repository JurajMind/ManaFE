import 'package:app/components/Brands/brand_list_item.dart';
import 'package:app/components/Common/big_select.dart';
import 'package:app/components/Dialogs/number_dialog.dart';
import 'package:app/components/PipeAccesory/pipe_accesory_list_item.dart';
import 'package:app/models/App/Gear/gear_model.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/general/gear_bloc.dart';
import 'package:app/module/person/person_bloc.dart';
import 'package:app/pages/SmokeSession/accesory_search.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class PipeAccesoryList extends StatelessWidget {
  static const Map<int, String> labels = {
    0: 'MY GEAR',
    1: 'BY BRAND',
    2: 'TODO'
  };

  final ScrollController scrollController;
  final ScrollPhysics scrollPhysics;
  final String type;
  final int currentView;
  final ValueChanged<int> onViewChanged;

  PipeAccesoryList(
      {Key key,
      this.scrollController,
      this.scrollPhysics,
      this.type,
      this.currentView,
      this.onViewChanged});

  @override
  Widget build(BuildContext context) {
    var data = DataProvider.getData(context).personBloc;
    var gearBloc = DataProvider.getData(context).gearBloc;
    switch (currentView) {
      case 0:
        return buildMyGear(data);
        break;
      case 1:
        return buildByBrands(gearBloc);
      default:
        return buildMyGear(data);
    }
  }

  StreamBuilder<List<PipeAccesorySimpleDto>> buildMyGear(PersonBloc bloc) {
    return StreamBuilder<List<PipeAccesorySimpleDto>>(
      stream: bloc.myGear,
      initialData: null,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return ListView.builder(
              controller: scrollController,
              physics: scrollPhysics,
              itemCount: 10,
              itemBuilder: (context, index) {
                return new PipeAccesoryListItemShimmer();
              });
        }

        var filtered = snapshot.data.where((s) => s.type == type).toList();

        return ListView.builder(
            controller: scrollController,
            physics: scrollPhysics,
            itemCount: filtered.length + 1,
            itemBuilder: (context, index) {
              if (filtered.length == 0) {
                return Column(
                  children: <Widget>[
                    buildSearchRow(bloc, context),
                    Container(
                      height: 200,
                      child: Center(
                        child: Flex(
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Its empty here, add some $type',
                              style: Theme.of(context).textTheme.display2,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                size: 50,
                              ),
                              onPressed: () => showSearchDialog(
                                  bloc: bloc,
                                  context: context,
                                  child: new PipeAccesorySearch(
                                    type: type,
                                    searchType: type,
                                    ownAccesories:
                                        new List<PipeAccesorySimpleDto>(),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }

              if (index == 0) {
                return buildSearchRow(bloc, context);
              }
              var data = filtered[index - 1];
              return new PipeAccesoryListItem(pipeAccesory: data);
            });
      },
    );
  }

  Row buildSearchRow(PersonBloc bloc, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.search),
            )),
        Expanded(
            flex: 2,
            child: Center(
              child: BigSelect(
                labels: labels,
                curentView: currentView,
                onSelected: onViewChanged,
              ),
            )),
        Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () => showSearchDialog(
                  bloc: bloc,
                  context: context,
                  child: new PipeAccesorySearch(
                    type: type,
                    searchType: type,
                    ownAccesories: new List<PipeAccesorySimpleDto>(),
                  )),
            )),
      ],
    );
  }

  void showSearchDialog({BuildContext context, Widget child, bloc}) {
    showDialog<PipeAccesorySimpleDto>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((PipeAccesorySimpleDto value) {
      if (value != null) {
        showNumberDialog(context: context, accesory: value, bloc: bloc);
      }
    });
  }

  void showNumberDialog(
      {BuildContext context, PipeAccesorySimpleDto accesory, PersonBloc bloc}) {
    var isTobacco = type == 'Tobacco';
    showDialog<int>(
      context: context,
      builder: (BuildContext context) => NumberDialog(
            label: "Add ${accesory.brand} ${accesory.name}",
            initCount: isTobacco ? 50 : 1,
            step: isTobacco ? 50 : 1,
            stepLabel: isTobacco ? 'g' : '',
          ),
    ).then<void>((int value) async {
      if (value != null) {
        await bloc.addMyGear(accesory, value);
      }
    });
  }

  StreamBuilder<List<BrandGroup>> buildByBrands(GearBloc data) {
    return StreamBuilder<List<BrandGroup>>(
      stream: data.getBrandsByType(type),
      initialData: null,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return ListView.builder(
              controller: scrollController,
              physics: scrollPhysics,
              itemCount: 10,
              itemBuilder: (context, index) {
                return new PipeAccesoryListItemShimmer();
              });
        }

        if (snapshot.data.length == 0) {
          return Center(
            child: Text('No $type brand'),
          );
        }

        return ListView.builder(
            controller: scrollController,
            physics: scrollPhysics,
            itemCount: snapshot.data.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.search),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: BigSelect(
                          labels: labels,
                          curentView: currentView,
                          onSelected: onViewChanged,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    )
                  ],
                );
              }
              var data = snapshot.data[index - 1];
              return new BrandListItem(
                brand: data,
                brandType: type,
              );
            });
      },
    );
  }
}
