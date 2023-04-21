import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Mixology/feature_mix_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:shimmer/shimmer.dart';

class FeatureMixCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mixologyBloc = DataProvider.getData(context)!.mixologyBloc;

    return StreamBuilder<List<FeatureMixCreatorSimpleDto>>(
      stream: mixologyBloc.mixCreator,
      initialData: null,
      builder: (context, snapshot) {
        if (snapshot.data == null || snapshot.data!.length == 0) {
          return ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.white,
                  child: ListTile(
                    title: SizedBox(
                        width: 60,
                        height: 20,
                        child: Container(
                          color: Colors.white,
                        )),
                    leading: SizedBox(
                        width: 60,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                );
              });
        }
        return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              var item = snapshot.data![index];
              return ListTile(
                onTap: () {
                  mixologyBloc.loadCreatorMixes(item.name, 0);
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
                    return FeatureMixListView(mixCreator: item);
                  }));
                },
                trailing: Icon(Icons.chevron_right),
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: CachedNetworkImage(
                    imageUrl: Extensions.getAbsoluteurl(item.logoPicture),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                title: Hero(
                  tag: "mix_brnad_${item.name}",
                  child: Text(item.name!, style: Theme.of(context).textTheme.headlineSmall),
                ),
              );
            });
      },
    );
  }
}
