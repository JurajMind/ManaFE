import 'package:app/components/StarRating/star_ratting.dart';
import 'package:app/const/theme.dart';
import 'package:app/pages/Mixology/mix_detail_page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class MixCardExpanded extends StatefulWidget {
  final TobaccoMixSimpleDto? tobaccoMix;
  final int? highlightId;
  final Map<int?, Color>? multiHighlight;
  final bool noTitle;
  final ValueChanged<TobaccoMixSimpleDto>? onTap;
  final bool selected;
  MixCardExpanded(
      {this.tobaccoMix,
      this.noTitle = false,
      this.highlightId,
      this.onTap,
      this.selected = false,
      this.multiHighlight});

  @override
  _MixologyExpandedState createState() => new _MixologyExpandedState();
}

class _MixologyExpandedState extends State<MixCardExpanded> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    if (widget.tobaccoMix!.tobaccos!.length == 0) {
      return Container();
    }
    //timeDilation = 6;
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!(widget.tobaccoMix!);
          } else {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => MixDetailPage(mix: widget.tobaccoMix)));
          }
        },
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
                        tag: "mix_hero_${widget.tobaccoMix!.id}",
                        child: widget.tobaccoMix!.name != null
                            ? Text(
                                widget.tobaccoMix!.name!,
                                style: Theme.of(context).textTheme.subtitle2,
                              )
                            : Text(
                                AppTranslations.of(context)!.text('gear.no_name'),
                                style: Theme.of(context).textTheme.subtitle2,
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
                color: widget.selected ? AppColors.colors[1] : Colors.white,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      ..._createTobaccoRow(widget.tobaccoMix!),
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
    return mix.tobaccos!.map((item) {
      return Flexible(
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
                style: TextStyle(color: Colors.black),
              ),
              Text(item.fraction.toString() + 'g', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      );
    }).toList();
  }

  Color getColor(TobaccoInMix item) {
    if (widget.highlightId == item.tobacco!.id) return AppColors.colors[1];

    if (widget.multiHighlight != null) {
      var color = widget.multiHighlight![item.tobacco!.id];
      if (color != null) return color;
    }

    return Colors.black;
  }
}
