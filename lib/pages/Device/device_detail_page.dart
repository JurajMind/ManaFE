
import 'package:app/app/app.dart';
import 'package:app/models/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/api.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:rxdart/subjects.dart';

import 'components/device_picture_item.dart';
import 'device_change_picture_page.dart';

class DeviceDetailPage extends StatefulWidget {
  final DeviceSimpleDto device;

  const DeviceDetailPage({Key key, this.device}) : super(key: key);

  @override
  _DeviceDetailPageState createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends State<DeviceDetailPage> {

  DeviceDevicePictureDto picture;

  @override
  void initState() {
    App.http.getDeviceInfo(5).then((data) {   
      setState(() {
       if(mounted)
       picture = data.picture; 
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        'v ${Extensions.deviceVersion(widget.device.version)}',
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
                              color: !widget.device.isOnline
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
              title: Text(widget.device.name.toUpperCase()),
              centerTitle: true,
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Hero(
                    tag: "${widget.device.code}_hero",
                    child: new DecoratedBox(
                        decoration: new BoxDecoration(
                          gradient: new LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: Extensions.deviceAccentColor(
                                  widget.device.type)),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Extensions.devicePicture(
                                      widget.device.type)),
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
              Row(
                children: <Widget>[
                 buildPicture()
                ],
              ),
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
                        App.http.sleepDevice(widget.device.code);
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
                      App.http.restartDevice(widget.device.code);
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

  Widget buildPicture() {
   
    
    return Row(
      children: <Widget>[
        Container(
            child: DevicePictureItem(
                picture?.inlinePicture)),
                                  IconButton(
                    icon: Icon(FontAwesomeIcons.cog),
                    onPressed: () =>
                        Navigator.of(context).push<DeviceDevicePictureDto>(new MaterialPageRoute(
                          builder: (BuildContext context) {
                            return new DeviceChangePicturePage(slectedPictureId: picture?.id,);
                          },
                        )).then(
                          (newPicture){
                            if(newPicture == null)
                            return;
                            
                            if(mounted){
                              picture = newPicture;
                            }
                          }
                        ),
                  )
      ],
    );
  }
}
