import 'package:app/Helpers/helpers.dart';
import 'package:app/app/app.widget.dart';
import 'package:app/pages/Start/external_auth_widget.dart';
import 'package:app/services/authorization.dart';
import 'package:app/support/validators/email.validator.dart';
import 'package:app/support/validators/max.validator.dart';
import 'package:app/support/validators/required.validator.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegistryPageState createState() => _RegistryPageState();
}

class _RegistryPageState extends State<RegisterPage> {
  PageController controller;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  HSVColor color = HSVColor.fromColor(Colors.orange);
  Offset animOffset = Offset(0.0, 0.0);
  final FocusNode passwordFocusNode = FocusNode();
  UserModel data = new UserModel();
  String termOfUssage = "";
  bool showPassword = false;
  var _emailAutoValidate = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  var _passwordAutoValidate = false;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Sign up'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
            child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                  autofocus: false,
                  style: Theme.of(context).textTheme.display3,
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    hintText: AppTranslations.of(context).text('login.name_hint'),
                    labelText: AppTranslations.of(context).text('login.name'),
                    labelStyle: Theme.of(context).textTheme.display3,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  onFieldSubmitted: (String textInput) {
                    data.userName = textInput;
                  },
                  onSaved: (String value) {
                    data.userName = value;
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: new TextFormField(
                  style: Theme.of(context).textTheme.display3,
                  autovalidate: _emailAutoValidate,
                  controller: emailController,
                  validator: (String value) {
                    return validate(value, 'E-mail Address', [new RequiredValidator(), new EmailValidator(), new MaxValidator(63)]);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                    hintText: AppTranslations.of(context).text("login.email"),
                    labelText: AppTranslations.of(context).text("login.email"),
                    labelStyle: Theme.of(context).textTheme.display3,
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
                  ),
                  onFieldSubmitted: (String textInput) {
                    setState(() {
                      _emailAutoValidate = true;
                    });
                    data.email = textInput;
                  },
                  onSaved: (String value) {
                    data.email = value;
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: new TextFormField(
                  style: Theme.of(context).textTheme.display3,
                  autovalidate: _passwordAutoValidate,
                  autofocus: false,
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: !showPassword,
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
                    hintText: AppTranslations.of(context).text("login.password"),
                    labelText: AppTranslations.of(context).text("login.password"),
                    labelStyle: Theme.of(context).textTheme.display3,
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
                  ),
                  onFieldSubmitted: (String textInput) {
                    data.password = textInput;
                  },
                  onEditingComplete: () {},
                  onSaved: (String value) {
                    data.password = value;
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: new TextFormField(
                  style: Theme.of(context).textTheme.display3,
                  autovalidate: _passwordAutoValidate,
                  autofocus: false,
                  controller: password2Controller,
                  keyboardType: TextInputType.text,
                  obscureText: !showPassword,
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
                    hintText: AppTranslations.of(context).text("login.confirm_password"),
                    labelText: AppTranslations.of(context).text("login.confirm_password"),
                    labelStyle: Theme.of(context).textTheme.display3,
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
                  ),
                  onFieldSubmitted: (String textInput) {
                    data.password = textInput;
                  },
                  onEditingComplete: () {},
                  onSaved: (String value) {
                    data.password = value;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MaterialButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text(
                    AppTranslations.of(context).text("Create account"),
                    style: Theme.of(context).textTheme.display1.apply(color: Colors.black, fontSizeDelta: -7),
                  ),
                ),
                onPressed: () => register(context),
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(24.0)),
                textColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ExternalAuthWidget(),
          ],
        )),
      ),
    );
  }

  register(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
    setState(() {
      this.loading = true;
    });
    data.userName = nameController.text;
    data.email = emailController.text;
    data.password = passwordController.text;
    data.confirmPassword = password2Controller.text;
    var auth = new Authorize();
    var result = await auth.register(data);
    if (result == null) {
      AppWidget.restartApp(context);
    }
  }
}
