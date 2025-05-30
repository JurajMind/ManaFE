import 'package:app/app/app.widget.dart';
import 'package:app/Helpers/helpers.dart';
import 'package:app/main.dart';
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

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}

class _LoginData {
  String? email = '';
  String? password = '';
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final AuthorizeRepository _auth = getIt.get<AuthorizeRepository>();
  _LoginData data = new _LoginData();
  bool _loading = false;
  final FocusNode passwordFocusNode = FocusNode();
  bool showPassword = false;
  void submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

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
        centerTitle: true,
        title: new Text(AppTranslations.of(context)!.text("login.log_in").toUpperCase()),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          child: new SingleChildScrollView(
              child: new Column(
            children: <Widget>[
              Builder(builder: (BuildContext context) {
                return new Container(
                  padding: new EdgeInsets.fromLTRB(60.0, 60.0, 60.0, 0.0),
                  child: new Form(
                    key: _formKey,
                    child: new Column(
                      children: <Widget>[
                        new TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.emailAddress,
                            style: Theme.of(context).textTheme.headline5,
                            decoration: new InputDecoration(
                                labelStyle: Theme.of(context).textTheme.headline6,
                                enabledBorder:
                                    new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                                focusedBorder:
                                    new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                                icon: Icon(Icons.mail, color: Colors.white),
                                hintText: 'your@email.com',
                                labelText: AppTranslations.of(context)!.text("login.email")),
                            validator: (String? value) {
                              return validate(value, 'E-mail Address',
                                  [new RequiredValidator(), new EmailValidator(), new MaxValidator(63)]);
                            },
                            onFieldSubmitted: (String textInput) {
                              FocusScope.of(context).requestFocus(passwordFocusNode);
                            },
                            onSaved: (String? value) {
                              data.email = value;
                            }),
                        new TextFormField(
                            style: Theme.of(context).textTheme.headline5,
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
                                labelStyle: Theme.of(context).textTheme.headline6,
                                enabledBorder:
                                    new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                                focusedBorder:
                                    new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                                icon: Icon(Icons.security, color: Colors.white),
                                labelText: AppTranslations.of(context)!.text("login.password")),
                            validator: (String? value) {
                              return validate(value, 'Password',
                                  [new RequiredValidator(), new StringValidator(), new MinValidator(6)]);
                            },
                            onFieldSubmitted: (String value) {
                              this.submit(context);
                            },
                            onSaved: (String? value) {
                              data.password = value;
                            }),
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
                              : new RoundedButton(
                                  buttonName: AppTranslations.of(context)!.text("login.log_in").toUpperCase(),
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
                          child: new TextButton(
                            child: new Text(
                              AppTranslations.of(context)!.text("login.forgot_password") + " ?",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            onPressed: () {
                              navigate(context, 'auth/forgotpassword');
                            },
                          ),
                          margin: new EdgeInsets.only(top: 20.0),
                        ),
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
