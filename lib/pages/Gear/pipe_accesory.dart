import 'package:app/module/data_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          return CircularProgressIndicator();
        }
        ;
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
              return ListTile(
                leading: SizedBox(
                  height: 60,
                  width: 60,
                  child: new CachedNetworkImage(
                    imageUrl: "http://via.placeholder.com/350x150",
                    placeholder: new CircularProgressIndicator(),
                    errorWidget: new Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
                ),
                subtitle: Text(data.brand),
                title: Text(data.name),
              );
            });
      },
    );
  }
}
