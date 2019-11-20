import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Device/add_device_page.dart';
import 'package:app/pages/Device/device_detail_page.dart';
import 'package:app/utils/translations/app_translations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class Devices extends StatelessWidget {
  final ScrollController scrollController;
  final ScrollPhysics scrollPhysics;

  Devices({Key key, this.scrollController, this.scrollPhysics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var personBloc = DataProvider.getData(context).personBloc;

    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useTabletLayout = shortestSide > 600;

    return Container(
      child: StreamBuilder<List<DeviceSimpleDto>>(
        stream: personBloc.devices,
        initialData: null,
        builder: (context, snapshot) {
          if (useTabletLayout) {
            return ListView.builder(
              itemCount: (snapshot.data?.length ?? 0) + 1,
              itemBuilder: (context, index) {
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
                        leading: Icon(Icons.add),
                        title: Text(
                          AppTranslations.of(context).text("device.add_device"),
                          style: Theme.of(context).textTheme.display1,
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
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                );
              },
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: (snapshot.data?.length ?? 0) + 1,
              itemBuilder: (context, index) {
                if (snapshot.data == null) {
                  return Container();
                }
                if (snapshot.data.length == index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        settings: RouteSettings(),
                        builder: (context) => AddDevicePage())),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        color: Colors.black,
                        elevation: 3.0,
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                new Border.all(color: Colors.white, width: 2),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  AppTranslations.of(context)
                                      .text("device.add_device"),
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

                var device = snapshot.data[index];
                return Hero(
                  tag: "${device.code}_hero",
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        settings: RouteSettings(),
                        builder: (context) =>
                            DeviceDetailPage(device: device))),
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
                                    colors: Extensions.deviceAccentColor(
                                        device.type)),
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
                                            Extensions.devicePicture(
                                                device.type)),
                                        colorFilter: ColorFilter.mode(
                                            const Color.fromRGBO(
                                                255, 255, 255, 0.545),
                                            BlendMode.modulate),
                                        fit: BoxFit.cover)),
                              )),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
