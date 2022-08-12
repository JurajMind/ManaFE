import 'package:app/app/app.dart';
import 'package:app/const/theme.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import 'components/device_picture_item.dart';

class DeviceChangePicturePage extends StatefulWidget {
  final int? slectedPictureId;

  const DeviceChangePicturePage({Key? key, this.slectedPictureId}) : super(key: key);

  @override
  _DeviceChangePicturePageState createState() => _DeviceChangePicturePageState();
}

class _DeviceChangePicturePageState extends State<DeviceChangePicturePage> {
  List<DeviceDevicePictureDto>? pictures;

  @override
  initState() {
    App.http!.getDevicePicutres().then((data) => setState(() {
          if (mounted) pictures = data;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppTranslations.of(context)!.text("device.change_device_picture")),
          centerTitle: true,
          backgroundColor: AppColors.black,
        ),
        bottomNavigationBar: SizedBox(height: 60),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: pictures?.length ?? 10,
            itemBuilder: (context, index) {
              DeviceDevicePictureDto? picture;
              if (pictures != null) picture = pictures![index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    if (picture == null) return;

                    Navigator.pop(context, picture);
                  },
                  child: DevicePictureItem(picture?.inlinePicture, selected: picture?.id == widget.slectedPictureId),
                ),
              );
            }));
  }
}
