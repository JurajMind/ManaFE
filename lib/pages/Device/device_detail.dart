import 'package:app/app/app.dart';
import 'package:app/models/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:app/components/Buttons/roundedButton.dart';

class DeviceDetailPage extends StatelessWidget {
  final DeviceSimpleDto device;

  const DeviceDetailPage({Key key, this.device}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 200.0,
            backgroundColor: Colors.black,
            pinned: true,
            bottom: PreferredSize(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'v ${Extensions.deviceVersion(device.version)}',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: !device.isOnline
                                  ? Colors.redAccent
                                  : Colors.lightGreen),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              preferredSize: Size(15.0, 15.0),
            ),
            flexibleSpace: new FlexibleSpaceBar(
              title: Text(device.name.toUpperCase()),
              centerTitle: true,
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Hero(
                    tag: "${device.code}_hero",
                    child: new DecoratedBox(
                        decoration: new BoxDecoration(
                          gradient: new LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors:
                                  Extensions.deviceAccentColor(device.type)),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      Extensions.devicePicture(device.type)),
                                  colorFilter: ColorFilter.mode(
                                      const Color.fromRGBO(
                                          255, 255, 255, 0.545),
                                      BlendMode.modulate),
                                  fit: BoxFit.cover)),
                        )),
                  )
                ],
              ),
            ),
          ),
          new SliverList(
            delegate: new SliverChildListDelegate(<Widget>[
              Container(),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new RoundedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.airline_seat_individual_suite),
                          Text('SLEEP')
                        ],
                      ),
                      onTap: () {
                        App.http.sleepDevice(device.code);
                      },
                      buttonColor: Colors.transparent,
                      borderWidth: 1.0,
                      bottomMargin: 1.0,
                      height: 50.0,
                      width: (MediaQuery.of(context).size.width) / 2 - 16,
                    ),
                  ),
                  new RoundedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[Icon(Icons.refresh), Text('RESTART')],
                    ),
                    onTap: () {
                      App.http.restartDevice(device.code);
                    },
                    buttonColor: Colors.transparent,
                    borderWidth: 1.0,
                    bottomMargin: 1.0,
                    height: 50.0,
                    width: (MediaQuery.of(context).size.width) / 2 - 16,
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
