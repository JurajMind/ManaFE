import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
import 'package:app/models/extensions.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class TobaccoWidget extends StatelessWidget {
  final PipeAccesorySimpleDto tobacco;
  final TobaccoMixSimpleDto tobaccoMix;
  final ValueSetter<BuildContext> onPressed;

  const TobaccoWidget({Key key, this.tobacco, this.tobaccoMix, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: this.tobaccoMix != null
                ? tobacoMixBody(context, tobaccoMix)
                : tobacoBody(context, tobacco),
          ),
          onPressed == null
              ? Container()
              : Expanded(
                  child: IconButton(
                      icon: Icon(Icons.add_box),
                      onPressed: () => onPressed(context)),
                  flex: 1,
                )
        ],
      ),
    );
  }

  Widget tobacoMixBody(
    BuildContext context,
    TobaccoMixSimpleDto tobacoMix,
  ) {
    if ((tobacoMix?.tobaccos?.length ?? 0) == 0)
      return Center(
          child: Text(
        AppTranslations.of(context).text("smoke_session.no_data"),
        style: Theme.of(context).textTheme.display2,
      ));

    return MixCardExpanded(
      tobaccoMix: tobacoMix,
      noTitle: true,
    );
  }

  Column tobacoMixPart(PipeAccesorySimple tobacco) {
    return Column(
      children: <Widget>[
        Text(
          tobacco.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(tobacco.brand,
            style: TextStyle(color: Colors.black, fontSize: 10.0))
      ],
    );
  }

  Widget tobacoBody(BuildContext context, PipeAccesorySimpleDto tobacco) {
    if (tobacco == null || tobacco.id == null || tobacco.name == null) {
      return new Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          AppTranslations.of(context).text("smoke_session.no_data"),
          style: Theme.of(context).textTheme.display2,
        )),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(right: 4),
                height: 30,
                child: Extensions.defaultTypePicture('Tobacco')),
            Text(
              tobacco.name,
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              ' ' + tobacco.brand,
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .merge(new TextStyle(fontWeight: FontWeight.normal)),
            )
          ],
        ),
      );
    }
  }
}
