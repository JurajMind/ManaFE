import 'package:app/components/StarRating/star_ratting.dart';
import 'package:app/const/theme.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import '../../Helpers/helpers.dart';
import '../../app/app.dart';
import '../../pages/SmokeSession/Components/freya_container.dart';

class MixCardExpanded extends StatelessWidget {
  final TobaccoMixSimpleDto? tobaccoMix;
  final int? highlightId;
  final Map<int?, Color>? multiHighlight;
  final bool noTitle;
  final ValueChanged<TobaccoMixSimpleDto>? onTap;
  final bool selected;
  final bool isWraped;
  MixCardExpanded(
      {this.tobaccoMix,
      this.noTitle = false,
      this.highlightId,
      this.onTap,
      this.selected = false,
      this.multiHighlight,
      this.isWraped = false});

  @override
  Widget build(BuildContext context) {
    if (tobaccoMix!.tobaccos!.length == 0) {
      return Container();
    }

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!(tobaccoMix!);
          } else {
            navigate(context, 'mix', params: tobaccoMix);
          }
        },
        child: App.appType == AppType.freya
            ? FreyaContainer(
                skip: this.isWraped,
                child: new Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(width: 10),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Hero(
                              tag: "mix_hero_${tobaccoMix!.id}",
                              child: tobaccoMix!.name != null
                                  ? Text(
                                      tobaccoMix!.name!,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    )
                                  : Text(
                                      AppTranslations.of(context)!.text('gear.no_name'),
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                            ),
                          ),
                        ),
                        noTitle
                            ? Container()
                            : Expanded(
                                flex: 1,
                                child: new StarRating(
                                  size: 15.0,
                                  rating: 0.0,
                                  starCount: 5,
                                )),
                      ],
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: selected ? AppColors.colors[1] : AppColors.freyaBlack,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                            ..._createTobaccoRow(tobaccoMix!),
                          ]),
                        ),
                      ),
                      elevation: 8.0,
                      margin: EdgeInsets.zero,
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(width: 10),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Hero(
                              tag: "mix_hero_${tobaccoMix!.id}",
                              child: tobaccoMix!.name != null
                                  ? Text(
                                      tobaccoMix!.name!,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    )
                                  : Text(
                                      AppTranslations.of(context)!.text('gear.no_name'),
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                            ),
                          ),
                        ),
                        noTitle
                            ? Container()
                            : Expanded(
                                flex: 1,
                                child: new StarRating(
                                  size: 15.0,
                                  rating: 0.0,
                                  starCount: 5,
                                  color: Colors.white,
                                  borderColor: Colors.white,
                                )),
                      ],
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: selected ? AppColors.colors[1] : Colors.white,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [..._createTobaccoRow(tobaccoMix!)]),
                        ),
                      ),
                      elevation: 8.0,
                      margin: EdgeInsets.zero,
                    )
                  ],
                ),
              ),
      ),
    );
  }

  List<Widget> _createTobaccoRow(TobaccoMixSimpleDto mix) {
    return mix.tobaccos!.mapIndexed((indes, item) {
      return Flexible(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            child: new Column(
              children: <Widget>[
                AutoSizeText(item.tobacco?.name ?? 'd',
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(fontWeight: FontWeight.bold, color: getColor(item))),
                AutoSizeText(
                  item.tobacco?.brand ?? 'b',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: App.appType == AppType.freya ? Colors.white : Colors.black),
                ),
                Text(item.fraction.toString() + 'g',
                    style: TextStyle(color: App.appType == AppType.freya ? Colors.white : Colors.grey)),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  Color getColor(TobaccoInMix item) {
    if (highlightId == item.tobacco!.id) return AppColors.colors[1];

    if (multiHighlight != null) {
      var color = multiHighlight![item.tobacco!.id];
      if (color != null) return color;
    }

    return App.appType == AppType.freya ? Colors.white : Colors.black;
  }
}
