import 'package:app/pages/Gear/pipe_accesory_page.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class UsageItemListItem extends StatelessWidget {
  const UsageItemListItem({
    Key key,
    @required this.item,
  }) : super(key: key);

  final PipeAccessoryUsageDto item;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.display2;
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(new MaterialPageRoute(builder: (BuildContext context) {
        return new PipeAccesoryPage(pipeAccesoryId: item.id);
      })),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: <Widget>[
            Expanded(
                flex: 4,
                child: Text("${item.brandName} ${item.accName}", style: style)),
            Expanded(flex: 1, child: Text("${item.used} x", style: style)),
          ]),
        ),
      ),
    );
  }
}
