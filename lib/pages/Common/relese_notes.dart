import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class ReleaseNotes extends StatefulWidget {
  static const String _key = "17.9.2019_4";
  @override
  _ReleaseNotesState createState() => _ReleaseNotesState();
}

class _ReleaseNotesState extends State<ReleaseNotes> {
  FlutterSecureStorage storage;
  bool shown = false;

  @override
  void initState() {
    super.initState();
    storage = new FlutterSecureStorage();
    storage.read(key: "relese_note").then((onValue) {
      if (onValue == ReleaseNotes._key) {
      } else {
        this.showReleseNotes(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  showReleseNotes(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (dc) => FlareGiffyDialog(
              flarePath: 'assets/bulb.flr',
              flareAnimation: 'light_open',
              onlyOkButton: true,
              title: Text(
                AppTranslations.of(context).text("release_note.title"),
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              description: Text(
                  AppTranslations.of(context).text("release_note.text"),
                  style:
                      TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
              onOkButtonPressed: () {
                Navigator.of(dc).pop();
              },
            )).then((_) async {
      await storage.write(key: "relese_note", value: ReleaseNotes._key);
    });
  }
}
