import 'package:flutter/material.dart';
import 'package:app/pages/auth/facebook.page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Register'),
        backgroundColor: Colors.transparent,
      ),
      body: new SingleChildScrollView(
        child: new Center(
          child: new Placeholder()
        ),
      ),
    );
  }
}