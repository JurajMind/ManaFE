import 'package:app/components/Common/big_select.dart';
import 'package:app/components/Dialogs/number_dialog.dart';
import 'package:app/components/PipeAccesory/pipe_accesory_list_item.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/person/person_bloc.dart';
import 'package:app/pages/Gear/Components/arrow_indicator.dart';
import 'package:app/pages/Gear/pipe_accesory_page.dart';
import 'package:app/pages/Gear/sections.dart';
import 'package:app/pages/Gear/tobacco_page.dart';
import 'package:app/pages/SmokeSession/accesory_search.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

import 'Components/brand_list.dart';

class RowSearchStickyDelegate extends SliverPersistentHeaderDelegate {
  final String type;
  final int currentView;
  final ValueChanged<int> onViewChanged;

  RowSearchStickyDelegate(this.type, this.currentView, this.onViewChanged);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.scafBg,
      child: SearchRow(currentView: currentView, onViewChanged: onViewChanged, type: type),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 50;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class MyGear extends StatelessWidget {
  final ScrollController scrollController;
  final ScrollPhysics scrollPhysics;
  final String type;
  final int currentView;
  final ValueChanged<int> onViewChanged;
  final Section section;
  final PageController pageController;
  final int position;

  const MyGear(
      {Key key, this.type, this.scrollController, this.scrollPhysics, this.currentView, this.onViewChanged, this.section, this.pageController, this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).personBloc;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          expandedHeight: 200.0,
          flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              title: ArrowPageIndicator(
                title: section.title,
                index: position,
                itemCount: 6,
                pageController: pageController,
              ),
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(section.backgroundAsset),
                        colorFilter: ColorFilter.mode(const Color.fromRGBO(255, 255, 255, 0.545), BlendMode.modulate),
                        fit: BoxFit.cover)),
              )),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: RowSearchStickyDelegate(type, currentView, onViewChanged),
        ),
        StreamBuilder<List<PipeAccesorySimpleDto>>(
          stream: bloc.myGear,
          initialData: null,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return new PipeAccesoryListItemShimmer();
              }, childCount: 10));
            }

            var filtered = snapshot.data.where((s) => s.type == type).toList();

            if (filtered == 0) {}

            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                var data = filtered[index];
                return new PipeAccesoryListItem(pipeAccesory: data);
              }, childCount: filtered.length),
            );
          },
        ),
        SliverToBoxAdapter(
            child: Container(
          height: 55,
        )),
      ],
    );
  }
}

class SearchRow extends StatelessWidget {
  static const Map<int, String> labels = {0: 'gear.my_gear', 1: 'gear.by_brand', 2: 'TOP'};

  final String type;
  final int currentView;
  final ValueChanged<int> onViewChanged;

  const SearchRow({Key key, this.type, this.currentView, this.onViewChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).personBloc;
    var gearBloc = DataProvider.getData(context).gearBloc;
    var typedMyGear = DataProvider.getData(context).personBloc.myGear.value.where((s) => s.type == type).toList();
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
                    ownAccesories: typedMyGear,
                    personBloc: bloc,
                    gearBloc: gearBloc,
                  ))),
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
                      type: type,
                      searchType: type,
                      ownAccesories: null,
                      personBloc: bloc,
                      gearBloc: gearBloc,
                    ))
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
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
        return value.type == "Tobacco" ? TobaccoPage(tobacco: value) : PipeAccesoryPage(pipeAccesory: value);
      }));
    });
  }

  static showNumberDialog({BuildContext context, PipeAccesorySimpleDto accesory, PersonBloc bloc, String type}) {
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
  final int currentView;
  final int position;
  final ValueChanged<int> onViewChanged;
  final String brandFilter;
  final Section section;
  final PageController pageController;
  PipeAccesoryList({Key key, this.currentView, this.onViewChanged, this.brandFilter, this.section, this.pageController, this.position});

  @override
  Widget build(BuildContext context) {
    switch (currentView) {
      case 0:
        return MyGear(
            currentView: currentView, onViewChanged: onViewChanged, type: section.type, section: section, pageController: pageController, position: position);
        break;
      case 1:
        return new BrandList(section: section, type: section.type, brandFilter: brandFilter, currentView: currentView, onViewChanged: onViewChanged);
      default:
        return MyGear(
          currentView: currentView,
          onViewChanged: onViewChanged,
          type: section.type,
          section: section,
          pageController: pageController,
        );
    }
  }
}
