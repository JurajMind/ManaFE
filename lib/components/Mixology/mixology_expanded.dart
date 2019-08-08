import 'package:app/components/StarRating/star_ratting.dart';
import 'package:app/pages/Mixology/mix_detail_page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/api.dart';

class MixCardExpanded extends StatefulWidget {
  final TobaccoMixSimpleDto tobaccoMix;
  final bool noTitle;
  MixCardExpanded({this.tobaccoMix, this.noTitle = false});

  @override
  _MixologyExpandedState createState() => new _MixologyExpandedState();
}

class _MixologyExpandedState extends State<MixCardExpanded> {
  double _bodyHeight = 0.0;
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
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
                  widget.noTitle
                      ? Container()
                      : Icon(
                          Icons.add,
                        ),
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
                                AppTranslations.of(context).text('gear.no_name'),
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
                          if(widget.tobaccoMix.liked > 0)
                          Icon(FontAwesomeIcons.thumbsUp),
                          if(widget.tobaccoMix.liked < 0)
                          Icon(FontAwesomeIcons.thumbsDown),
                          if(widget.tobaccoMix.liked == 0)
                         Container()
                ],
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: widget.tobaccoMix.tobaccos.length > 2
                            ? _longMix(widget.tobaccoMix)
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: _createTobaccoRow(widget.tobaccoMix)),
                      ),
                    ),
                    new AnimatedContainer(
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      height: _bodyHeight,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Divider(
                                height: 2.0,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
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

  SingleChildScrollView _longMix(TobaccoMixSimpleDto mix) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _createTobaccoRow(mix)),
    );
  }

  List<Widget> _createTobaccoRow(TobaccoMixSimpleDto mix) {
    return mix.tobaccos.map((item) {
      return Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
        child: new Column(
          children: <Widget>[
            Text(
              item.tobacco?.name ?? 'd',
              style: new TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              item.tobacco?.brand ?? 'b',
              style: TextStyle(color: Colors.black),
            ),
            Text(item.fraction.toString() + 'g',
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }).toList();
  }
}
