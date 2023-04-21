import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/models/extensions.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'dart:math' as math;

import '../all_gear_page.dart';
import 'gear_usage_item_list.dart';

class GearUsageItem extends StatelessWidget {
  final String? label;
  final List<PipeAccessoryUsageDto>? gears;

  const GearUsageItem({Key? key, this.label, this.gears}) : super(key: key);

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
                  SizedBox(height: 40, width: 40, child: Extensions.defaultTypePicture(label!)),
                  SizedBox(
                    height: 40,
                    width: 10,
                  ),
                  Text(label!, style: Theme.of(context).textTheme.titleLarge),
                ],
              )),
            ),
            if ((gears?.length ?? 0) > 0)
              Expanded(
                child: ListView.builder(
                  itemCount: math.min(gears?.length ?? 0, 5),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var item = gears![index];

                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: new UsageItemListItem(item: item),
                    );
                  },
                ),
              ),
            if ((gears?.length ?? 0) > 0)
              Center(
                  child: MButton(
                      label: 'All ${label!.toLowerCase()}',
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
                            return AllGearPage(label: label, gears: gears);
                          }))))
          ],
        ));
  }
}
