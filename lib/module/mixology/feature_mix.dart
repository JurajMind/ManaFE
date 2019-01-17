import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mixology_page_new.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class FeatureMixCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mixologyBloc = DataProvider.getData(context).mixologyBloc;

    return StreamBuilder<List<MixCreator>>(
      stream: mixologyBloc.mixCreator,
      initialData: null,
      builder: (context, snapshot) {
        return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              var item = snapshot.data[index];
              return ListTile(
                onTap: () {
                  mixologyBloc.loadCreatorMixes(item.name);
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => CreatorMixPage(
                            creator: item,
                          )));
                },
                trailing: Icon(Icons.chevron_right),
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: CachedNetworkImage(
                    imageUrl: item.picture,
                    errorWidget: Icon(Icons.error),
                  ),
                ),
                title: Text(item.name),
                subtitle: Text('${item.mixCount} mixes created'),
              );
            });
      },
    );
  }
}
