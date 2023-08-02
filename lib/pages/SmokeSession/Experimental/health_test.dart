import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HealthTest extends StatefulWidget {
  const HealthTest({Key? key}) : super(key: key);

  @override
  _HealthTestState createState() => _HealthTestState();
}

class _HealthTestState extends State<HealthTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Health check test')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'HR:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Icon(
              FontAwesomeIcons.heart,
              size: 50,
              color: Colors.red,
            ),
            const SizedBox(
              height: 16,
            ),
            HRWidget(),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Blood Oxygen:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Icon(
              FontAwesomeIcons.wind,
              size: 50,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "N/A",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class HRWidget extends StatefulWidget {
  @override
  _HRWidgetState createState() => _HRWidgetState();
}

class _HRWidgetState extends State<HRWidget> {
  int _textValue = 89;

  @override
  void initState() {
    super.initState();
    _updateTextValue();
  }

  void _updateTextValue() {
    Timer.periodic(Duration(seconds: _generateRandomInterval()), (timer) {
      setState(() {
        _textValue = _generateRandomValue();
      });
    });
  }

  int _generateRandomValue() {
    return Random().nextInt(31) + 80;
  }

  int _generateRandomInterval() {
    return Random().nextInt(15) + 15;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '${_textValue.toString()} BPM',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
