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
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final Authorize _auth = new Authorize();
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
        title: new Text(AppTranslations.of(context).text("login.sign_in").toUpperCase()),
      ),
      body: Container(
        constraints: BoxConstraints(maxWidth: 500),
        child: new SingleChildScrollView(
            child: new Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Builder(builder: (BuildContext context) {
              return new Container(
                padding: new EdgeInsets.fromLTRB(60.0, 60.0, 60.0, 0.0),
                child: new Form(
                  key: _formKey,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          style: Theme.of(context).textTheme.display2,
                          decoration: new InputDecoration(
                              labelStyle: Theme.of(context).textTheme.display2,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintText: 'your@email.com',
                              labelText: AppTranslations.of(context).text("login.email")),
                          validator: (String value) {
                            return validate(value, 'E-mail Address', [new RequiredValidator(), new EmailValidator(), new MaxValidator(63)]);
                          },
                          onFieldSubmitted: (String textInput) {
                            FocusScope.of(context).requestFocus(passwordFocusNode);
                          },
                          onSaved: (String value) {
                            data.email = value;
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      new TextFormField(
                          style: Theme.of(context).textTheme.display2,
                          obscureText: !showPassword,
                          focusNode: passwordFocusNode,
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
                              labelStyle: Theme.of(context).textTheme.display1,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.white),
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
                            style: Theme.of(context).textTheme.display2,
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
                                  style: Theme.of(context).textTheme.display2.apply(color: Colors.black),
                                ),
                                onPressed: () => this.submit(context),
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(24.0)),
                              ),
                        margin: new EdgeInsets.only(top: 20.0, bottom: 20),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 2,
                            width: 50,
                            color: Colors.white,
                          ),
                          Text('  Or connect using  '),
                          Container(
                            height: 2,
                            width: 50,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
                        IconButton(
                          onPressed: () => facebookLogin(),
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            size: 40,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.google,
                            size: 40,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.apple,
                            size: 40,
                          ),
                        )
                      ])
                    ],
                  ),
                ),
              );
            })
          ],
        )),
      ),
    );
  }

  Future facebookLogin() async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logIn(['email']);
    try {
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          {
            var auth = new Authorize();
            setState(() {
              facebookLoginLoading = true;
            });
            var tokenResult = await auth.getLocalToken("Facebook", result.accessToken.token);
            if (tokenResult) {
              AppWidget.restartApp(context);
            } else {
              setState(() {
                facebookLoginLoading = false;
              });
            }
            break;
          }

        case FacebookLoginStatus.cancelledByUser:
          break;
        case FacebookLoginStatus.error:
          break;
      }
    } catch (e) {
      AppWidget.restartApp(context);
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Facebook login error :("),
      ));
    }
  }
}
