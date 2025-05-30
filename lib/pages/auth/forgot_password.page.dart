import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/main.dart';
import 'package:app/support/validators/email.validator.dart';
import 'package:app/support/validators/max.validator.dart';
import 'package:app/support/validators/required.validator.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:app/services/authorization.dart';
import 'package:app/Helpers/helpers.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final AuthorizeRepository _auth = getIt.get<AuthorizeRepository>();
  String? email = '';
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.of(context)!.text("login.forgot_password").toUpperCase()),
      ),
      body: new SingleChildScrollView(
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
                  children: <Widget>[
                    new TextFormField(
                        autofocus: true,
                        style: Theme.of(context).textTheme.headline5,
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                            labelStyle: Theme.of(context).textTheme.headline6,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40.0)),
                              borderSide: BorderSide(color: Colors.white, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.white, width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.red, width: 2),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.red, width: 2),
                            ),
                            hintText: 'your@email.com',
                            labelText: AppTranslations.of(context)!.text("login.email")),
                        validator: (String? value) {
                          return validate(value, 'E-mail Address',
                              [new RequiredValidator(), new EmailValidator(), new MaxValidator(63)]);
                        },
                        onSaved: (String? value) {
                          email = value;
                        }),
                    new Container(
                      child: _loading
                          ? CircularProgressIndicator()
                          : MButton(
                              icon: Icons.refresh,
                              label: AppTranslations.of(context)!.text("login.reset_password"),
                              onPressed: () {
                                submit(context);
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
    );
  }

  void submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _loading = true;
      });
      _auth.forgotPassword(email).then((success) {
        setState(() {
          _loading = false;
        });
        if (success) {
          _showDialog().then((value) {
            if (value!) {
              Navigator.of(context).pop();
            }
          });
        } else {
          final snackBar = SnackBar(content: Text('Error'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
  }

// user defined function
  Future<bool?> _showDialog() {
    // flutter defined function
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            AppTranslations.of(context)!.text("login.forgot_dialog_title"),
            style: Theme.of(context).textTheme.headline4,
          ),
          content: new Text(
            AppTranslations.of(context)!.text("login.forgot_dialog"),
            style: Theme.of(context).textTheme.headline5,
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new MButton(
              label: AppTranslations.of(context)!.text("common.close"),
              icon: Icons.close,
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
