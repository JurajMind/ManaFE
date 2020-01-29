import 'package:app/module/data_provider.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class FavoriteMixButton extends StatelessWidget {
  final TobaccoMixSimpleDto mix;

  const FavoriteMixButton({Key key, this.mix}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).mixologyBloc;

    return StreamBuilder<List<TobaccoMixSimpleDto>>(
        stream: bloc.mixCreatorMixes["favorite"],
        builder: (context, snapshot) {
          if ((snapshot?.data?.indexWhere((test) => test?.id == mix?.id) ?? -1) >= 0) {
            return OutlineButton.icon(
              onPressed: () => bloc.removeFromFavorite(mix),
              icon: Icon(Icons.remove, color: Colors.red),
              label: Center(child: Text(AppTranslations.of(context).text("mix.remove_favorite"), style: Theme.of(context).textTheme.headline5)),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              borderSide: BorderSide(color: Colors.white, width: 2),
            );
          }
          if (snapshot.data == null) {
            return Container();
          }

          return OutlineButton.icon(
            icon: Icon(Icons.add, color: Colors.green),
            label: Text(AppTranslations.of(context).text("mix.add_favorite"), style: Theme.of(context).textTheme.bodyText2),
            onPressed: () async {
              bloc.addToFavorite(mix);
            },
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            borderSide: BorderSide(color: Colors.white, width: 2),
          );
        });
  }
}
