import 'package:app/components/Common/big_select.dart';
import 'package:app/components/Dialogs/number_dialog.dart';
import 'package:app/components/PipeAccesory/pipe_accesory_list_item.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/person/person_bloc.dart';
import 'package:app/pages/Gear/pipe_accesory_page.dart';
import 'package:app/pages/Gear/tobacco_page.dart';
import 'package:app/pages/SmokeSession/accesory_search.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

import 'Components/brand_list.dart';

class MyGear extends StatelessWidget {
  final ScrollController scrollController;
  final ScrollPhysics scrollPhysics;
  final String type;
  final int currentView;
  final ValueChanged<int> onViewChanged;

  const MyGear(
      {Key key,
      this.type,
      this.scrollController,
      this.scrollPhysics,
      this.currentView,
      this.onViewChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).personBloc;
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
            itemCount: filtered.length + 2,
            itemBuilder: (context, index) {
              if (filtered.length == 0 && index == 0) {
                return Column(
                  children: <Widget>[
                    SearchRow(
                        currentView: currentView,
                        onViewChanged: onViewChanged,
                        type: type),
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
                              onPressed: () => SearchRow.showAddDialog(
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
                return SearchRow(
                    currentView: currentView,
                    onViewChanged: onViewChanged,
                    type: type);
              }

              if (index > filtered.length) {
                return SizedBox(
                  height: 40,
                );
              }
              var data = filtered[index - 1];
              return new PipeAccesoryListItem(pipeAccesory: data);
            });
      },
    );
  }
}

class SearchRow extends StatelessWidget {
  static const Map<int, String> labels = {
    0: 'gear.my_gear',
    1: 'gear.by_brand',
    2: 'TOP'
  };

  final String type;
  final int currentView;
  final ValueChanged<int> onViewChanged;

  const SearchRow({Key key, this.type, this.currentView, this.onViewChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).personBloc;

    var typedMyGear = DataProvider.getData(context)
        .personBloc
        .myGear
        .value
        .where((s) => s.type == type)
        .toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () => showSearchDialog(
                  bloc: bloc,
                  context: context,
                  child: new PipeAccesorySearch(
                      type: type,
                      searchType: type,
                      ownAccesories: typedMyGear))),
        ),
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
                        type: type, searchType: type, ownAccesories: null))
                /*  onPressed: () => showAddDialog(
                  bloc: bloc,
                  context: context,
                  child: new PipeAccesorySearch(
                    type: type,
                    searchType: type,
                    ownAccesories: new List<PipeAccesorySimpleDto>(),
                  )),*/

                )),
      ],
    );
  }

  static void showAddDialog({BuildContext context, Widget child, bloc}) {
    showDialog<PipeAccesorySimpleDto>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((PipeAccesorySimpleDto value) async {
      if (value != null) {
        await bloc.addMyGear(value, 1000);
      }
    });
  }

  static showSearchDialog({BuildContext context, Widget child, bloc}) {
    showDialog<PipeAccesorySimpleDto>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((PipeAccesorySimpleDto value) {
      if (value == null) return;
      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (BuildContext context) {
        return value.type == "Tobacco"
            ? TobaccoPage(tobacco: value)
            : PipeAccesoryPage(pipeAccesory: value);
      }));
    });
  }

  static showNumberDialog(
      {BuildContext context,
      PipeAccesorySimpleDto accesory,
      PersonBloc bloc,
      String type}) {
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
}

class PipeAccesoryList extends StatelessWidget {
  final ScrollController scrollController;
  final ScrollPhysics scrollPhysics;
  final String type;
  final int currentView;
  final ValueChanged<int> onViewChanged;
  final String brandFilter;

  PipeAccesoryList(
      {Key key,
      this.scrollController,
      this.scrollPhysics,
      this.type,
      this.currentView,
      this.onViewChanged,
      this.brandFilter});

  @override
  Widget build(BuildContext context) {
    switch (currentView) {
      case 0:
        return MyGear(
          currentView: currentView,
          onViewChanged: onViewChanged,
          scrollPhysics: const AlwaysScrollableScrollPhysics(),
          type: type,
        );
        break;
      case 1:
        return new BrandList(
            type: type,
            brandFilter: brandFilter,
            currentView: currentView,
            onViewChanged: onViewChanged);
      default:
        return MyGear(
          currentView: currentView,
          onViewChanged: onViewChanged,
          scrollPhysics: const AlwaysScrollableScrollPhysics(),
          type: type,
        );
    }
  }
}
