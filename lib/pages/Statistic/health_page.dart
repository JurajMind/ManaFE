import 'package:app/const/theme.dart';
import 'package:flutter/material.dart';

class HealthPage extends StatefulWidget {
  HealthPage({Key key}) : super(key: key);

  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text('Health page'),
      ),
    );
  }
}
