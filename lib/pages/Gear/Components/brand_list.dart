import 'package:app/components/Brands/brand_list_item.dart';
import 'package:app/components/Common/big_select.dart';
import 'package:app/components/PipeAccesory/pipe_accesory_list_item.dart';
import 'package:app/models/App/Gear/gear_model.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';

import '../pipe_accesory.dart';
import '../sections.dart';

class BrandList extends StatefulWidget {
  const BrandList({
    Key? key,
    required this.type,
    required this.brandFilter,
    required this.currentView,
    required this.onViewChanged,
    this.section,
  }) : super(key: key);

  final String? type;
  final String? brandFilter;
  final int? currentView;
  final ValueChanged<int>? onViewChanged;
  final Section? section;

  @override
  _BrandListState createState() => _BrandListState();
}

class _BrandListState extends State<BrandList> {
  var textController = new TextEditingController();
  bool searchMode = false;
  String? searchString;

  @override
  Widget build(BuildContext context) {
    var data = DataProvider.getData(context)!.gearBloc;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Text(
          widget.section!.title!,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        !searchMode
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () => setState(() {
                                this.searchMode = true;
                              }))),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: BigSelect(
                        labels: SearchRow.labels,
                        curentView: widget.currentView,
                        onSelected: widget.onViewChanged,
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Container())
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.search),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      autofocus: true,
                      controller: textController,
                      onChanged: (data) {
                        setState(() {
                          this.searchString = data;
                        });
                      },
                      decoration: InputDecoration(hintText: 'Search', border: InputBorder.none, labelStyle: Theme.of(context).textTheme.headlineMedium),
                    ),
                  )),
                  Flexible(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () => setState(() {
                              this.searchString = "";
                              textController.text = "";
                              searchMode = false;
                            }),
                          ))),
                ],
              ),
        Expanded(
          child: StreamBuilder<List<BrandGroup>?>(
            stream: data.getBrandsByType(widget.type),
            initialData: null,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return new PipeAccesoryListItemShimmer();
                    });
              }

              if (snapshot.data!.length == 0) {
                return Center(
                  child: Text('No ${widget.type} brand'),
                );
              }

              var data = snapshot.data;

              if (this.searchString != null) {
                data = data!.where((test) => test.name!.toLowerCase().contains(this.searchString!.toLowerCase())).toList();
              }

              return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: data!.length + 1,
                  itemBuilder: (context, index) {
                    if (index == data!.length) {
                      return SizedBox(
                        height: 55,
                      );
                    }

                    var dataEntry = data[index];
                    return new BrandListItem(
                      brand: dataEntry,
                      brandType: widget.type,
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
