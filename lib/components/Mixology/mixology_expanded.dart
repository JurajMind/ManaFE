import 'package:app/components/StarRating/star_ratting.dart';
import 'package:app/const/theme.dart';
import 'package:app/pages/Mixology/mix_detail_page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class MixCardExpanded extends StatefulWidget {
  final TobaccoMixSimpleDto tobaccoMix;
  final int highlightId;
  final bool noTitle;
  MixCardExpanded({this.tobaccoMix, this.noTitle = false, this.highlightId});

  @override
  _MixologyExpandedState createState() => new _MixologyExpandedState();
}

class _MixologyExpandedState extends State<MixCardExpanded> {
  double _bodyHeight = 0.0;
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    if (widget.tobaccoMix.tobaccos.length == 0) {
      return Container();
    }
    //timeDilation = 6;
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MixDetailPage(mix: widget.tobaccoMix))),
        child: Padding(
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
                        tag: "mix_hero_${widget.tobaccoMix.id}",
                        child: widget.tobaccoMix.name != null
                            ? Text(
                                widget.tobaccoMix.name,
                                style: Theme.of(context).textTheme.subtitle,
                              )
                            : Text(
                                AppTranslations.of(context)
                                    .text('gear.no_name'),
                                style: Theme.of(context).textTheme.subtitle,
                              ),
                      ),
                    ),
                  ),
                  widget.noTitle
                      ? Container()
                      : Expanded(
                          flex: 1,
                          child: new StarRating(
                            size: 15.0,
                            rating: 2.0,
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
                color: Colors.white,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ..._createTobaccoRow(widget.tobaccoMix),
                        ]),
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
    return mix.tobaccos.map((item) {
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: new Column(
            children: <Widget>[
              AutoSizeText(
                item.tobacco?.name ?? 'd',
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    color: widget.highlightId == item.tobacco.id
                        ? AppColors.colors[1]
                        : Colors.black),
              ),
              AutoSizeText(
                item.tobacco?.brand ?? 'b',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black),
              ),
              Text(item.fraction.toString() + 'g',
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      );
    }).toList();
  }
}
