import 'package:app/module/data_provider.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import '../Buttons/m_outlineButton.dart';

class FavoriteMixButton extends StatelessWidget {
  final TobaccoMixSimpleDto? mix;

  const FavoriteMixButton({Key? key, this.mix}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context)!.mixologyBloc;

    return StreamBuilder<List<TobaccoMixSimpleDto?>>(
        stream: bloc.mixCreatorMixes["favorite"],
        builder: (context, snapshot) {
          if ((snapshot?.data?.indexWhere((test) => test?.id == mix?.id) ?? -1) >= 0) {
            return MButton(
                onPressed: () => bloc.removeFromFavorite(mix!),
                icon: Icons.remove,
                label: AppTranslations.of(context)!.text(
                  "mix.remove_favorite",
                ));
          }
          if (snapshot.data == null) {
            return Container();
          }

          return MButton(
            icon: Icons.add,
            iconColor: Colors.green,
            label: AppTranslations.of(context)!.text("mix.add_favorite"),
            onPressed: () async {
              bloc.addToFavorite(mix!);
            },
          );
        });
  }
}
