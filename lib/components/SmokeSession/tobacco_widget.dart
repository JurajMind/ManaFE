import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
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
            flex: 5,
            child: this.tobaccoMix?.tobaccos != null &&
                    this.tobaccoMix.tobaccos.length > 0
                ? tobacoMixBody(tobaccoMix)
                : tobacoBody(context, tobacco),
          ),
          onPressed == null
              ? Container()
              : Expanded(
                  child: IconButton(
                      icon: Icon(Icons.add_box), onPressed: () => onPressed(context)),
                  flex: 1,
                )
        ],
      ),
    );
  }

  Widget tobacoMixBody(TobaccoMixSimpleDto tobacoMix) {
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
        child: Text('No tobacco'),
      );
    } else {
      return Row(
        children: <Widget>[
          Text(
            tobacco.name,
            style: Theme.of(context).textTheme.display2,
          ),
          Text(' ' + tobacco.brand)
        ],
      );
    }
  }
  
}
