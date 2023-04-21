import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:darq/darq.dart';

import 'gear_usage_item.dart';

class GearUsageStat extends StatelessWidget {
  const GearUsageStat({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context)!.statisticBloc;
    return Container(
      child: StreamBuilder<List<PipeAccessoryUsageDto>?>(
          stream: bloc.gearUsage,
          initialData: null,
          builder: (context, snapshot) {
            if (snapshot.data == null) return Container();

            return Container(
              height: 400,
              width: 200,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: PageView(
                  children: <Widget>[
                    GearUsageItem(
                      label: "Tobacco",
                      gears: getUsageByType(snapshot.data, "Tobacco"),
                    ),
                    GearUsageItem(label: "Hookah", gears: getUsageByType(snapshot.data, "Hookah")),
                    GearUsageItem(label: "Bowl", gears: getUsageByType(snapshot.data, "Bowl")),
                  ],
                ),
              ),
            );
          }),
    );
  }

  List<PipeAccessoryUsageDto>? getUsageByType(List<PipeAccessoryUsageDto>? usage, String type) {
    if (usage == null) {
      return null;
    }

    return List<PipeAccessoryUsageDto>.from(usage)
        .where((f) => f.type == type)
        .orderByDescending((o) => o.used)
        .toList();
  }
}
