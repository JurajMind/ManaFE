import 'package:app/app/app.widget.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Common/bg_painter.dart';
import 'package:app/components/Common/shadow_text.dart';
import 'package:app/Helpers/helpers.dart';
import 'package:app/main.dart';
import 'package:app/services/authorization.dart';
import 'package:app/support/validators/email.validator.dart';
import 'package:app/support/validators/max.validator.dart';
import 'package:app/support/validators/required.validator.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/openapi.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  PageController? controller;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  HSVColor color = HSVColor.fromColor(Colors.orange);
  Offset animOffset = Offset(0.0, 0.0);
  final FocusNode passwordFocusNode = FocusNode();
  UserModel data = new UserModel(email: '', password: '');
  String termOfUssage = "";
  bool showPassword = false;
  AutovalidateMode _emailAutoValidate = AutovalidateMode.disabled;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  AutovalidateMode _passwordAutoValidate = AutovalidateMode.disabled;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Form(
        child: CustomPaint(
          painter: BgPainter(
              color: color.toColor(),
              logoSize: 1.0,
              hueRotation: -1.2,
              startPoint: Offset(screenSize.width * 0.2 + animOffset.dx, 270 + animOffset.dy)),
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: Form(
                key: _formKey,
                child: PageView(
                  pageSnapping: true,
                  controller: controller,
                  children: <Widget>[
                    namePage(screenSize, context),
                    emailPage(screenSize, context),
                    passwordPage(screenSize, context),
                    lawPage(screenSize, context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget emailPage(Size screenSize, BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          ShadowText(
            AppTranslations.of(context)!.text("login.email").toUpperCase(),
            style: Theme.of(context).textTheme.headline6,
            textScaleFactor: 1.0,
            softWrap: true,
          ),
          SizedBox(height: 48.0),
          new TextFormField(
              style: Theme.of(context).textTheme.headline5,
              autofocus: true,
              autovalidateMode: _emailAutoValidate,
              controller: emailController,
              validator: (String? value) {
                return validate(
                    value, 'E-mail Address', [new RequiredValidator(), new EmailValidator(), new MaxValidator(63)]);
              },
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                  hintText: AppTranslations.of(context)!.text("login.email"),
                  labelText: AppTranslations.of(context)!.text("login.email"),
                  labelStyle: Theme.of(context).textTheme.headline4,
                  enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  icon: Icon(Icons.email, color: Colors.white)),
              onFieldSubmitted: (String textInput) {
                setState(() {
                  _emailAutoValidate = AutovalidateMode.onUserInteraction;
                });
                data.email = textInput;
              },
              onSaved: (String? value) {
                data.email = value!;
              }),
          SizedBox(height: 48.0),
          nextRoundedButton(screenSize),
        ],
      ),
    );
  }

  Widget finalPage(Size screenSize, BuildContext context) {
    return Center();
  }

  @override
  void initState() {
    super.initState();

    controller = new PageController();
    controller!.addListener(() {
      final Size screenSize = MediaQuery.of(context).size;
      setState(() {
        animOffset = Offset(controller!.position.pixels / 3, controller!.position.pixels / 10);
        color = color.withHue((color.hue + (controller!.position.pixels / (screenSize.width * 5))) % 360);
      });
    });
    loadAsset();
  }

  Widget lawPage(Size screenSize, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            primary: false,
            snap: false,
            leading: Container(),
            expandedHeight: 200.0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                width: 200,
                child: ShadowText(
                  AppTranslations.of(context)!.text('login.term_of_usage').toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .copyWith(
                          textTheme: TextTheme(
                              headline5: TextStyle(
                        fontSize: 16.0,
                      )))
                      .textTheme
                      .headline5,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 1.0,
                  softWrap: true,
                ),
              ),
            ),
          ),
          new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
            SizedBox(height: 48.0),
            new Text(termOfUssage),
            Container(
              height: 50,
            ),
            this.loading
                ? RoundedButton(
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    ),
                    buttonColor: Colors.transparent,
                    borderWidth: 2.0,
                    bottomMargin: 1.0,
                    height: 50.0,
                    width: screenSize.width,
                  )
                : RoundedButton(
                    buttonName: AppTranslations.of(context)!.text('login.accept_register'),
                    onTap: () => register(context),
                    buttonColor: Colors.transparent,
                    borderWidth: 2.0,
                    bottomMargin: 1.0,
                    height: 50.0,
                    width: screenSize.width,
                  ),
            Container(
              height: 200,
            )
          ]))
        ],
      ),
    );
  }

  Future loadAsset() async {
    termOfUssage = await rootBundle.loadString('assets/term_of_ussage.txt');
  }

  Widget namePage(Size screenSize, BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          ShadowText(
            AppTranslations.of(context)!.text('login.name'),
            style: Theme.of(context).textTheme.headline5,
            textScaleFactor: 1.0,
            softWrap: true,
          ),
          SizedBox(height: 48.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: new TextFormField(
                autofocus: false,
                style: Theme.of(context).textTheme.headline5,
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                    hintText: AppTranslations.of(context)!.text('login.name_hint'),
                    labelText: AppTranslations.of(context)!.text('login.name'),
                    labelStyle: Theme.of(context).textTheme.headline4,
                    enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                    focusedBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                    icon: Icon(FontAwesomeIcons.userCircle, color: Colors.white)),
                onFieldSubmitted: (String textInput) {
                  data.userName = textInput;
                },
                onSaved: (String? value) {
                  data.userName = value;
                }),
          ),
          SizedBox(height: 48.0),
          nextRoundedButton(screenSize),
        ],
      ),
    );
  }

  nextPage() {
    var currentPage = controller!.page! + 1;
    controller!.animateToPage(currentPage.round(), duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  RoundedButton nextRoundedButton(Size screenSize) {
    return new RoundedButton(
      buttonName: AppTranslations.of(context)!.text("common.next").toUpperCase(),
      onTap: () => nextPage(),
      buttonColor: Colors.transparent,
      borderWidth: 2.0,
      bottomMargin: 1.0,
      height: 50.0,
      width: screenSize.width,
    );
  }

  Widget passwordPage(Size screenSize, BuildContext context) {
    return Center(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          ShadowText(
            AppTranslations.of(context)!.text("login.password").toUpperCase(),
            style: Theme.of(context).textTheme.headline5,
            textScaleFactor: 1.0,
            softWrap: true,
          ),
          SizedBox(height: 48.0),
          new TextFormField(
              style: Theme.of(context).textTheme.headline5,
              autovalidateMode: _passwordAutoValidate,
              autofocus: true,
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
                  hintText: AppTranslations.of(context)!.text("login.password"),
                  labelText: AppTranslations.of(context)!.text("login.password"),
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  icon: Icon(Icons.security, color: Colors.white)),
              onFieldSubmitted: (String textInput) {
                data.password = textInput;
              },
              onEditingComplete: () {},
              onSaved: (String? value) {
                data.password = value!;
              }),
          new TextFormField(
              style: Theme.of(context).textTheme.headline5,
              autovalidateMode: _passwordAutoValidate,
              autofocus: true,
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
                  hintText: AppTranslations.of(context)!.text("login.confirm_password"),
                  labelText: AppTranslations.of(context)!.text("login.confirm_password"),
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  icon: Icon(Icons.security, color: Colors.white)),
              onFieldSubmitted: (String textInput) {
                data.password = textInput;
              },
              onEditingComplete: () {},
              onSaved: (String? value) {
                data.password = value!;
              }),
          SizedBox(height: 48.0),
          nextRoundedButton(screenSize),
        ],
      ),
    );
  }

  register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    setState(() {
      this.loading = true;
    });
    data.userName = nameController.text;
    data.email = emailController.text;
    data.password = passwordController.text;
    data.confirmPassword = password2Controller.text;
    var auth = getIt.get<AuthorizeRepository>();
    var result = await auth.register(data);
    if (result == null) {
      AppWidget.restartApp(context);
    }
  }
}
