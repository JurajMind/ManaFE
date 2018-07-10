import 'package:app/helpers.dart';
import 'package:app/support/validators/email.validator.dart';
import 'package:app/support/validators/max.validator.dart';
import 'package:app/support/validators/min.validator.dart';
import 'package:app/support/validators/required.validator.dart';
import 'package:app/support/validators/string.validator.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/pages/home.page.dart';
import 'package:app/services/authorization.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}

class _LoginData {
  String email = '';
  String password = '';
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Authorize _auth = new Authorize();
  _LoginData data = new _LoginData();

  void submit(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      print('Printing the submitted data.');
      print('Email: ${data.email}');
      print('Password: ${data.password}');

      if (await _auth.authorize(data.email, data.password)) {
        Navigator.popUntil(context, (_) => !Navigator.canPop(context));
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => HomePage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new AppBar(
              title: new Text('Log in'),
            ),
            new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Form(
                key: _formKey,
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                            hintText: 'you@example.com', labelText: 'E-mail'),
                        validator: (String value) {
                          return validate(value, 'E-mail Address', [
                            new RequiredValidator(),
                            new EmailValidator(),
                            new MaxValidator(63)
                          ]);
                        },
                        onSaved: (String value) {
                          data.email = value;
                        }),
                    new TextFormField(
                        obscureText: true,
                        decoration: new InputDecoration(
                            labelText: 'Enter your password'),
                        validator: (String value) {
                          return validate(value, 'Password', [
                            new RequiredValidator(),
                            new StringValidator(),
                            new MinValidator(8)
                          ]);
                        },
                        onSaved: (String value) {
                          data.password = value;
                        }),
                    new Container(
                      width: screenSize.width,
                      child: new RoundedButton(
                        buttonName: 'Login',
                        onTap: () => this.submit(context),
                        buttonColor: Colors.transparent,
                        borderWidth: 1.0,
                        bottomMargin: 1.0,
                        height: 50.0,
                        width: screenSize.width,
                      ),
                      margin: new EdgeInsets.only(top: 20.0),
                    ),
                    new Container(
                      width: screenSize.width,
                      child: new FlatButton(
                        child: new Text(
                          'Create an account',
                        ),
                        onPressed: () {
                          navigate(context, 'auth/register');
                        },
                      ),
                      margin: new EdgeInsets.only(top: 20.0),
                    ),
                    new Container(
                      width: screenSize.width,
                      child: new FlatButton(
                        child: new Text(
                          'Fast',
                        ),
                        onPressed: () {
                          Navigator.popUntil(
                              context, (_) => !Navigator.canPop(context));
                          Navigator.pushReplacement(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomePage()));
                        },
                      ),
                      margin: new EdgeInsets.only(top: 20.0),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
