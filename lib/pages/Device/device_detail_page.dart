import 'package:app/app/app.dart';
import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/components/SmokeSession/session_list.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/api.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:rxdart/rxdart.dart';

import 'components/device_picture_item.dart';
import 'device_change_picture_page.dart';
import 'device_update_page.dart';

class DeviceDetailPage extends StatefulWidget {
  final DeviceSimpleDto device;

  const DeviceDetailPage({Key key, this.device}) : super(key: key);

  @override
  _DeviceDetailPageState createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends State<DeviceDetailPage> {
  DeviceDevicePictureDto picture;
  BehaviorSubject<List<SmokeSessionSimpleDto>> sessions =
      new BehaviorSubject<List<SmokeSessionSimpleDto>>();
  bool editName = false;
  TextEditingController nameController;
  ScrollController controller;
  @override
  void initState() {
    this.nameController =
        new TextEditingController(text: widget.device.name ?? "");
    App.http.getDeviceInfo(widget.device.id).then((data) {
      setState(() {
        if (mounted) picture = data.picture;
      });
    });
    App.http
        .getDeviceSessions(widget.device.id, page: 0, pageSize: 6)
        .then((data) {
      sessions.add(data);
    });
    controller = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await controller.animateTo(0,
            curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 500));
        return true;
      },
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: CustomScrollView(
          controller: controller,
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
                      ),
                      DeviceOnlineDot(widget.device.isOnline)
                    ],
                  ),
                ),
                preferredSize: Size(15.0, 15.0),
              ),
              flexibleSpace: new FlexibleSpaceBar(
                title: editName
                    ? Container(
                        width: 200,
                        child: TextField(
                          autofocus: true,
                          controller: nameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                color: Colors.white,
                                icon: Icon(Icons.save),
                                onPressed: () => setState(() {
                                  editName = false;
                                  changeName();
                                }),
                              ),
                              hintText: 'Enter new device name'),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            SizedBox(
                              width: 200,
                              child: AutoSizeText(
                                widget.device.name.toUpperCase(),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () => setState(() {
                                editName = true;
                              }),
                            )
                          ]),
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
                Container(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                            AppTranslations.of(context)
                                    .text("device.device_picture") +
                                ' : ',
                            style: Theme.of(context).textTheme.display2),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                              child: Container(
                                  height: 64,
                                  width: 64,
                                  child: DevicePictureItem(
                                      picture?.inlinePicture)))),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.cog),
                            onPressed: () => Navigator.of(context)
                                .push<DeviceDevicePictureDto>(
                                    new MaterialPageRoute(
                              builder: (BuildContext context) {
                                return new DeviceChangePicturePage(
                                  slectedPictureId: picture?.id,
                                );
                              },
                            )).then((newPicture) {
                              if (newPicture == null) return;

                              if (mounted) {
                                setState(() {
                                  picture = newPicture;
                                });
                              }
                              App.http.changeDevicePicture(
                                  widget.device.id, newPicture.id);
                            }),
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          AppTranslations.of(context)
                                  .text("device.software_version") +
                              ' : ',
                          style: Theme.of(context).textTheme.display2,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'v ${Extensions.deviceVersion(widget.device.version)}',
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.cog),
                          onPressed: () => Navigator.of(context)
                              .push<DeviceDevicePictureDto>(
                                  new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new DeviceUpdatePage(
                                device: widget.device,
                              );
                            },
                          )).then((newPicture) {
                            if (newPicture == null) return;

                            if (mounted) {
                              setState(() {
                                picture = newPicture;
                              });
                            }
                            App.http.changeDevicePicture(
                                widget.device.id, newPicture.id);
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                Container(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new RoundedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.airline_seat_individual_suite),
                              Text(AppTranslations.of(context)
                                  .text("device.sleep")
                                  .toUpperCase())
                            ],
                          ),
                          onTap: () {
                            App.http.sleepDevice(widget.device.code);
                          },
                          buttonColor: Colors.transparent,
                          borderWidth: 1.0,
                          bottomMargin: 1.0,
                          height: 50.0,
                          width: (MediaQuery.of(context).size.width) / 3 - 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: new RoundedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.refresh),
                              Text(AppTranslations.of(context)
                                  .text("device.restart")
                                  .toUpperCase())
                            ],
                          ),
                          onTap: () {
                            App.http.restartDevice(widget.device.code);
                          },
                          buttonColor: Colors.transparent,
                          borderWidth: 1.0,
                          bottomMargin: 1.0,
                          height: 50.0,
                          width: (MediaQuery.of(context).size.width) / 3 - 16,
                        ),
                      ),
                      new RoundedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.phonelink_ring),
                            Text(AppTranslations.of(context)
                                .text("device.ping")
                                .toUpperCase())
                          ],
                        ),
                        onTap: () {
                          App.http.pingDevice(widget.device.code);
                        },
                        buttonColor: Colors.transparent,
                        borderWidth: 1.0,
                        bottomMargin: 1.0,
                        height: 50.0,
                        width: (MediaQuery.of(context).size.width) / 3 - 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                StreamBuilder<List<SmokeSessionSimpleDto>>(
                    stream: sessions,
                    builder: (context, snapshot) {
                      return SessionList(
                        sessions: snapshot.data,
                        sessionCount: 5,
                      );
                    }),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FractionallySizedBox(
                    widthFactor: 0.7,
                    child: MButton(
                      icon: Icons.delete,
                      iconColor: Colors.red,
                      label: 'device.remove_device',
                      onPressed: () {
                        _removeDialog().then((data) => {
                              if (data)
                                {
                                  DataProvider.getData(context)
                                      .personBloc
                                      .removeDevice(widget.device.code)
                                      .then((onValue) =>
                                          Navigator.of(context).pop())
                                }
                            });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _removeDialog() {
    // flutter defined function
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            AppTranslations.of(context).text("device.remove_device"),
            style: Theme.of(context).textTheme.body2,
          ),
          content: new Text(
            AppTranslations.of(context).text("device.remove_device_dialog"),
            style: Theme.of(context).textTheme.display2,
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new MButton(
              label: AppTranslations.of(context).text("common.yes"),
              icon: Icons.delete,
              iconColor: Colors.red,
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            new MButton(
              label: AppTranslations.of(context).text("common.no"),
              icon: Icons.close,
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }

  changeName() async {
    widget.device.name = nameController.value.text;
    await App.http
        .changeDeviceName(widget.device.code, nameController.value.text);
  }
}

class DeviceOnlineDot extends StatelessWidget {
  const DeviceOnlineDot(
    this.isOnline, {
    Key key,
  }) : super(key: key);

  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: !isOnline ? Colors.redAccent : Colors.lightGreen),
        ),
      ),
    );
  }
}
