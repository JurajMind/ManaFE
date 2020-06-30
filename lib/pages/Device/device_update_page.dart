import 'package:app/Helpers/date_utils.dart';
import 'package:app/app/app.dart';
import 'package:app/const/theme.dart';
import 'package:app/models/extensions.dart';
import 'package:app/theme/theme_widget.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/subjects.dart';
import 'package:shimmer/shimmer.dart';

class DeviceUpdatePage extends StatefulWidget {
  final DeviceSimpleDto device;

  DeviceUpdatePage({Key key, this.device}) : super(key: key);

  _DeviceUpdatePageState createState() => _DeviceUpdatePageState();
}

class _DeviceUpdatePageState extends State<DeviceUpdatePage> {
  BehaviorSubject<List<DeviceUpdateDto>> updates =
      new BehaviorSubject<List<DeviceUpdateDto>>();

  @override
  void initState() {
    App.http.getUpdates().then((data) => updates.add(data.reversed.toList()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = MTheme.of(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 55,
      ),
      appBar: AppBar(
        title: Text(AppTranslations.of(context).text("device.update_device"),
            style: theme.appBarStyle),
        centerTitle: true,
        backgroundColor: AppColors.black,
      ),
      body: Container(
        child: StreamBuilder<List<DeviceUpdateDto>>(
            stream: updates,
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot?.data?.length ?? 10,
                itemBuilder: (context, index) {
                  DeviceUpdateDto update;
                  if (snapshot.data != null) {
                    update = snapshot.data[index];
                  }
                  return DeviceUpdateListItem(
                      update: update, device: widget.device);
                },
              );
            }),
      ),
    );
  }
}

class DeviceUpdateListItem extends StatelessWidget {
  final DeviceUpdateDto update;
  final DeviceSimpleDto device;
  const DeviceUpdateListItem({Key key, this.update, this.device})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (update == null) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[400],
        highlightColor: Colors.white,
        child: ListTile(
          trailing: Icon(Icons.file_download),
          leading: SizedBox(
              height: 25.0,
              width: 60.0,
              child: Container(
                height: 25,
                width: 60,
                color: Colors.black,
              )),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 18,
                width: 200,
                color: Colors.black,
              ),
            ],
          ),
          subtitle: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 18,
                width: 89,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
          child: ListTile(
            onTap: () => promptUpdate(context),
            trailing: Icon(Icons.file_download),
            leading: Text(
              'v ${Extensions.deviceVersion(update.version)}',
              style: Theme.of(context).textTheme.headline5.apply(
                  color: device.version >= update.version
                      ? Colors.white
                      : Colors.green),
            ),
            title: Text(update.releseNote),
            subtitle: Text(DateUtils.toStringDate(update.releseDate)),
          ),
        ),
      ),
    );
  }

  promptUpdate(context) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Center(child: new Text("Device update")),
          content: Text(
            "You are adout to update your device. \nl Make sure device is power from wall or have powerbank fully charged. \nl Dont turn device off during update and plug / unplug any cables",
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
          actions: <Widget>[
            OutlineButton.icon(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                borderSide: BorderSide(color: Colors.white, width: 1),
                icon: Icon(Icons.cancel, color: Colors.red),
                label: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                onPressed: () => Navigator.of(context).pop(false)),
            OutlineButton.icon(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              borderSide: BorderSide(color: Colors.white, width: 1),
              icon: Icon(Icons.file_download, color: Colors.green),
              label: Text(
                'Update',
                style: Theme.of(context).textTheme.headline5,
              ),
              onPressed: () => Navigator.of(context).pop(true),
            ),
            // usually buttons at the bottom of the dialog
          ],
        );
      },
    ).then((doUpdate) async {
      if (doUpdate == null) {
        return;
      }

      if (doUpdate) {
        var result = await App.http.pushUpdate(device.id, update.id);
      }
    });
  }
}
