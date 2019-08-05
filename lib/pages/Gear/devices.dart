import 'dart:ui' as prefix0;

import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Device/add_device_page.dart';
import 'package:app/pages/Device/device_detail_page.dart';

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
    return Container(
      child: StreamBuilder<List<DeviceSimpleDto>>(
        stream: personBloc.devices,
        initialData: null,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              controller: scrollController,
              physics: scrollPhysics,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: (snapshot.data?.length ?? 0) + 1,
              itemBuilder: (context, index) {
                if(snapshot.data == null ){
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
                                  'Add new device',
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
                                    Center(
                                      child: Text(
                                        device.name,
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
