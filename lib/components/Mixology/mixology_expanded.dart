import 'package:app/models/PipeAccesory/tobacco_mix.dart';
import 'package:app/pages/Mixology/mix_detail_page.dart';
import 'package:app/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MixCardExpanded extends StatefulWidget {
  final TobaccoMix tobaccoMix;
  MixCardExpanded({this.tobaccoMix});

  @override
  _MixologyExpandedState createState() => new _MixologyExpandedState();
}

class _MixologyExpandedState extends State<MixCardExpanded> {
  double _bodyHeight = 0.0;
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.add),
                Hero(
                  tag: "mix_hero_${widget.tobaccoMix.id}",
                  child: widget.tobaccoMix.name != null
                      ? Text(
                          widget.tobaccoMix.name,
                          style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        )
                      : Text(
                          'No name',
                          style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                )
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MixDetailPage(mix: widget.tobaccoMix))),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: widget.tobaccoMix.tobaccos.length > 3
                            ? _longMix(widget.tobaccoMix)
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: _createTobaccoRow(widget.tobaccoMix)),
                      ),
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
    );
  }

  SingleChildScrollView _longMix(TobaccoMix mix) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _createTobaccoRow(mix)),
    );
  }

  List<Widget> _createTobaccoRow(TobaccoMix mix) {
    return mix.tobaccos.map((item) {
      return new Column(
        children: <Widget>[
          Text(
            item.item1.name,
            style:
                new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            item.item1.brand,
            style: TextStyle(color: Colors.black),
          ),
          Text(item.item2.toString() + 'g',
              style: TextStyle(color: Colors.grey)),
        ],
      );
    }).toList();
  }
}
