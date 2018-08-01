import 'package:flutter/material.dart';

class Carroussel extends StatefulWidget {
  @override
  _CarrousselState createState() => new _CarrousselState();
}

class _CarrousselState extends State<Carroussel> {
  PageController controller;
  int currentpage = 0;

  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        child: new PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentpage = value;
              });
            },
            controller: controller,
            itemBuilder: (context, index) => builder(index)),
      ),
    );
  }

  builder(int index) {
    return new AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double value = 1.0;
          if (controller.position.haveDimensions) {
            value = controller.page - index;
            value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
          }

          return new Center(
            child: new SizedBox(
              height: Curves.easeOut.transform(value) * 200,
              width: Curves.easeOut.transform(value) * 400,
              child: child,
            ),
          );
        },
        child: new InkWell(
          child: new Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: index % 2 == 0 ? Colors.blue : Colors.red,
              ),
              margin: const EdgeInsets.all(8.0),
              child: OverflowBox(
                child: new Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        'Tearoom',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      new Text(
                        'Dlouhá 9',
                        style: new TextStyle(color: Colors.grey),
                      ),
                      new Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          new Icon(Icons.ac_unit),
                          new Text('18')
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}
