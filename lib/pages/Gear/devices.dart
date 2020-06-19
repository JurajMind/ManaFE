import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Device/add_device_page.dart';
import 'package:app/pages/Device/device_detail_page.dart';
import 'package:app/pages/Gear/Components/arrow_indicator.dart';
import 'package:app/pages/Gear/sections.dart';
import 'package:app/theme/theme_widget.dart';
import 'package:app/utils/translations/app_translations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class Devices extends StatelessWidget {
  final Section section;
  final PageController controller;
  Devices(this.section, {Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var personBloc = DataProvider.getData(context).personBloc;

    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useTabletLayout = shortestSide > 600;
    var theme = MTheme.of(context);
    return Container(
      child: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          backgroundColor: theme.appBarColor,
          flexibleSpace: new FlexibleSpaceBar(
              title: ArrowPageIndicator(
                pageController: controller,
                title: section.title,
                itemCount: 6,
                index: 0,
              ),
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(section.backgroundAsset),
                        colorFilter: ColorFilter.mode(
                            const Color.fromRGBO(255, 255, 255, 0.545),
                            BlendMode.modulate),
                        fit: BoxFit.cover)),
              )),
        ),
        StreamBuilder<List<DeviceSimpleDto>>(
          stream: personBloc.devices,
          initialData: null,
          builder: (context, snapshot) {
            if (useTabletLayout) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                if (snapshot.data.length == index) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: ListTile(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                settings: RouteSettings(),
                                builder: (context) => AddDevicePage())),
                        leading: Container(
                            width: 60, child: Center(child: Icon(Icons.add))),
                        title: Text(
                          AppTranslations.of(context).text("device.add_device"),
                          style: Theme.of(context).textTheme.headline6,
                        )),
                  );
                }
                var device = snapshot.data[index];

                return Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: ListTile(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        settings: RouteSettings(),
                        builder: (context) =>
                            DeviceDetailPage(device: device))),
                    leading: Hero(
                      tag: "${device.code}_hero",
                      child: Image.asset(Extensions.devicePicture(device.type)),
                    ),
                    trailing: DeviceOnlineDot(device.isOnline),
                    title: Text(
                      device.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                );
              }, childCount: (snapshot.data?.length ?? 0) + 1));
            }

            return SliverGrid(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (snapshot.data == null) {
                    return Container();
                  }
                  if (snapshot.data.length == index) {
                    return AddDeviceGridItem();
                  }

                  var device = snapshot.data[index];
                  return DeviceGridItem(device: device);
                },
                childCount: (snapshot.data?.length ?? 0) + 1,
              ),
            );
          },
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 55,
          ),
        )
      ]),
    );
  }
}

class DeviceGridItem extends StatelessWidget {
  const DeviceGridItem({
    Key key,
    @required this.device,
  }) : super(key: key);

  final DeviceSimpleDto device;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "${device.code}_hero",
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            settings: RouteSettings(),
            builder: (context) => DeviceDetailPage(device: device))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 3.0,
            child: Container(
              child: new DecoratedBox(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: new LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: Extensions.deviceAccentColor(device.type)),
                  ),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Text(
                            device.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage(
                                Extensions.devicePicture(device.type)),
                            colorFilter: ColorFilter.mode(
                                const Color.fromRGBO(255, 255, 255, 0.545),
                                BlendMode.modulate),
                            fit: BoxFit.cover)),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

class AddDeviceGridItem extends StatelessWidget {
  const AddDeviceGridItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          settings: RouteSettings(), builder: (context) => AddDevicePage())),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.black,
          elevation: 3.0,
          child: Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: new Border.all(color: Colors.white, width: 2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    AppTranslations.of(context).text("device.add_device"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                ),
                Icon(
                  Icons.add,
                  size: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
