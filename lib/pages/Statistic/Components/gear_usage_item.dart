import 'package:app/models/extensions.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class GearUsageItem extends StatelessWidget {
  final String label;
  final List<PipeAccessoryUsageDto> gears;

  const GearUsageItem({Key key, this.label, this.gears}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 40,
                      width: 40,
                      child: Extensions.defaultTypePicture(label)),
                  SizedBox(
                    height: 40,
                    width: 10,
                  ),
                  Text(label, style: Theme.of(context).textTheme.display1),
                ],
              )),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: gears?.length ?? 0,
                itemBuilder: (context, index) {
                  var item = gears[index];
                  var style = Theme.of(context).textTheme.display2;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: <Widget>[
                          Expanded(
                              flex: 4,
                              child: Text("${item.brandName} ${item.accName}",
                                  style: style)),
                          Expanded(
                              flex: 1,
                              child: Text("${item.used} x", style: style)),
                        ]),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
