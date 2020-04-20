import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReleaseNotes extends StatefulWidget {
  static const String _key = "13.1.2020_1";
  @override
  _ReleaseNotesState createState() => _ReleaseNotesState();
}

class _ReleaseNotesState extends State<ReleaseNotes> {
  bool shown = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((v) {
      var value = v.getString("relese_note");
      if (value == ReleaseNotes._key) {
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
                'Release note', //AppTranslations.of(context).text("release_note.title"),
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              description: Text(
                  //  AppTranslations.of(context).text("release_note.text"),
                  'QR READER  \n \n NEW LOGIN FLOW  \n \n FONT REWORK \n \n ',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
              onOkButtonPressed: () {
                Navigator.of(dc).pop();
              },
            )).then((_) async {
      SharedPreferences.getInstance().then((v) {
        v.setString("relese_note", ReleaseNotes._key);
      });
    });
  }
}
