import 'package:app/models/extensions.dart';
import 'package:app/pages/Statistic/Components/gear_usage_item_list.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class AllGearPage extends StatefulWidget {
  final String label;
  final List<PipeAccessoryUsageDto> gears;

  const AllGearPage({Key key, this.label, this.gears}) : super(key: key);

  @override
  _AllGearPageState createState() => new _AllGearPageState();
}

class _AllGearPageState extends State<AllGearPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: 40,
                  width: 40,
                  child: Extensions.defaultTypePicture(widget.label)),
              SizedBox(
                height: 40,
                width: 10,
              ),
              Text(widget.label, style: Theme.of(context).textTheme.display1),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ...widget.gears.map((f) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UsageItemListItem(
                    item: f,
                  ),
                )),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
