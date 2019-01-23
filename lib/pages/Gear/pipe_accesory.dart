import 'package:app/components/PipeAccesory/pipe_accesory_list_item.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class PipeAccesoryList extends StatelessWidget {
  final ScrollController scrollController;
  final ScrollPhysics scrollPhysics;
  final String type;

  PipeAccesoryList(
      {Key key, this.scrollController, this.scrollPhysics, this.type});

  @override
  Widget build(BuildContext context) {
    var data = DataProvider.getData(context).personBloc;
    return StreamBuilder<List<PipeAccesorySimpleDto>>(
      stream: data.myGear,
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
        if (filtered.length == 0) {
          return Center(
            child: Text('No $type'),
          );
        }

        return ListView.builder(
            controller: scrollController,
            physics: scrollPhysics,
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              var data = filtered[index];
              return new PipeAccesoryListItem(pipeAccesory: data);
            });
      },
    );
  }
}

