import 'package:app/app/app.widget.dart';
import 'package:app/Helpers/helpers.dart';
import 'package:app/support/validators/email.validator.dart';
import 'package:app/support/validators/max.validator.dart';
import 'package:app/support/validators/min.validator.dart';
import 'package:app/support/validators/required.validator.dart';
import 'package:app/support/validators/string.validator.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/services/authorization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'external_auth_widget.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SignInPageState();
  }
}

class _LoginData {
  String email = '';
  String password = '';
}

class _SignInPageState extends State<SignInPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final AuthorizeManager _auth = new AuthorizeManager();
  _LoginData data = new _LoginData();
  bool _loading = false;
  final FocusNode passwordFocusNode = FocusNode();
  bool showPassword = false;

  bool facebookLoginLoading = false;
  void submit(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      print('Printing the submitted data.');
      print('Email: ${data.email}');
      print('Password: ${data.password}');
      setState(() {
        this._loading = true;
      });
      if (await _auth.authorize(data.email, data.password) != null) {
        AppWidget.restartApp(context);
      } else {
        final snackBar = SnackBar(content: Text('Wrong email or password'));

        setState(() {
          this._loading = false;
        });

// Find the Scaffold in the Widget tree and use it to show a SnackBar
        Scaffold.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          AppTranslations.of(context).text("login.sign_in").toUpperCase(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          child: new SingleChildScrollView(
              child: new Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Builder(builder: (BuildContext context) {
                return new Container(
                  padding: new EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: new Form(
                    key: _formKey,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                            style: Theme.of(context).textTheme.bodyText2,
                            decoration: new InputDecoration(
                                labelStyle: Theme.of(context).textTheme.bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                hintText: 'your@email.com',
                                labelText: AppTranslations.of(context).text("login.email")),
                            validator: (String value) {
                              return validate(value, 'E-mail Address', [new RequiredValidator(), new EmailValidator(), new MaxValidator(63)]);
                            },
                            onFieldSubmitted: (String textInput) {
                              // FocusScope.of(context).requestFocus(passwordFocusNode);
                            },
                            onSaved: (String value) {
                              data.email = value;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        new TextFormField(
                            autocorrect: false,
                            style: Theme.of(context).textTheme.bodyText2,
                            obscureText: !showPassword,
                            //focusNode: passwordFocusNode,
                            decoration: new InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    showPassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                ),
                                labelStyle: Theme.of(context).textTheme.bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                labelText: AppTranslations.of(context).text("login.password")),
                            validator: (String value) {
                              return validate(value, 'Password', [new RequiredValidator(), new StringValidator(), new MinValidator(6)]);
                            },
                            onFieldSubmitted: (String value) {
                              this.submit(context);
                            },
                            onSaved: (String value) {
                              data.password = value;
                            }),
                        new Container(
                          width: screenSize.width,
                          child: new FlatButton(
                            child: new Text(
                              AppTranslations.of(context).text("login.forgot_password") + " ?",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            onPressed: () {
                              navigate(context, 'auth/forgotpassword');
                            },
                          ),
                        ),
                        new Container(
                          width: screenSize.width,
                          child: _loading
                              ? new RoundedButton(
                                  borderWidth: 1.0,
                                  bottomMargin: 1.0,
                                  height: 50.0,
                                  width: screenSize.width,
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircularProgressIndicator(),
                                    ],
                                  ),
                                )
                              : new MaterialButton(
                                  child: Text(
                                    AppTranslations.of(context).text("login.log_in").toUpperCase(),
                                    style: Theme.of(context).textTheme.bodyText2.apply(color: Colors.black),
                                  ),
                                  onPressed: () => this.submit(context),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(24.0)),
                                ),
                          margin: new EdgeInsets.only(top: 20.0, bottom: 20),
                        ),
                        ExternalAuthWidget()
                      ],
                    ),
                  ),
                );
              })
            ],
          )),
        ),
      ),
    );
  }
}
