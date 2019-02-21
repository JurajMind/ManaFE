import 'package:app/app/app.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Common/bg_painter.dart';
import 'package:app/components/Common/shadow_text.dart';
import 'package:app/helpers.dart';
import 'package:app/pages/home.page.dart';
import 'package:app/services/authorization.dart';
import 'package:app/support/validators/email.validator.dart';
import 'package:app/support/validators/max.validator.dart';
import 'package:app/support/validators/required.validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openapi/api.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  PageController controller;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  HSVColor color = HSVColor.fromColor(Colors.orange);
  Offset animOffset = Offset(0.0, 0.0);
  final FocusNode passwordFocusNode = FocusNode();
  UserModel data = new UserModel();
  String termOfUssage = "";

  var _emailAutoValidate = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  var _passwordAutoValidate = false;

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
              startPoint: Offset(
                  screenSize.width * 0.2 + animOffset.dx, 270 + animOffset.dy)),
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
    );
  }

  Widget emailPage(Size screenSize, BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          ShadowText(
            'E-MAIL',
            style: Theme.of(context).textTheme.headline,
            textScaleFactor: 1.0,
            softWrap: true,
          ),
          SizedBox(height: 48.0),
          new TextFormField(
              autofocus: true,
              autovalidate: _emailAutoValidate,
              controller: emailController,
              validator: (String value) {
                return validate(value, 'E-mail Address', [
                  new RequiredValidator(),
                  new EmailValidator(),
                  new MaxValidator(63)
                ]);
              },
              keyboardType: TextInputType.emailAddress,
              decoration:
                  new InputDecoration(hintText: 'E-mail', labelText: 'E-mail'),
              onFieldSubmitted: (String textInput) {
                setState(() {
                  _emailAutoValidate = true;
                });
                data.email = textInput;
              },
              onSaved: (String value) {
                data.email = value;
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
    // TODO: implement initState
    super.initState();

    controller = new PageController();
    controller.addListener(() {
      final Size screenSize = MediaQuery.of(context).size;
      setState(() {
        animOffset = Offset(
            controller.position.pixels / 3, controller.position.pixels / 10);
        color = color.withHue((color.hue +
                (controller.position.pixels / (screenSize.width * 5))) %
            360);
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
              title: ShadowText(
                'TERM OF USSAGE',
                style: Theme.of(context)
                    .copyWith(
                        textTheme: TextTheme(
                            headline: TextStyle(
                      fontSize: 23.0,
                    )))
                    .textTheme
                    .headline,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.0,
                softWrap: true,
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
            new RoundedButton(
              buttonName: 'ACCEPT & REGISTER',
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
            'NAME',
            style: Theme.of(context).textTheme.headline,
            textScaleFactor: 1.0,
            softWrap: true,
          ),
          SizedBox(height: 48.0),
          new TextFormField(
              autofocus: false,
              controller: nameController,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  new InputDecoration(hintText: 'your name', labelText: 'Name'),
              onFieldSubmitted: (String textInput) {
                data.userName = textInput;
              },
              onSaved: (String value) {
                data.userName = value;
              }),
          SizedBox(height: 48.0),
          nextRoundedButton(screenSize),
        ],
      ),
    );
  }

  nextPage() {
    var currentPage = controller.page + 1;
    controller.animateToPage(currentPage.round(),
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  RoundedButton nextRoundedButton(Size screenSize) {
    return new RoundedButton(
      buttonName: 'Next',
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
            'PASSWORD',
            style: Theme.of(context).textTheme.headline,
            textScaleFactor: 1.0,
            softWrap: true,
          ),
          SizedBox(height: 48.0),
          new TextFormField(
              autovalidate: _passwordAutoValidate,
              autofocus: true,
              controller: passwordController,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                  hintText: 'Password', labelText: 'Password'),
              onFieldSubmitted: (String textInput) {
                data.password = textInput;
              },
              onEditingComplete: () {},
              onSaved: (String value) {
                data.password = value;
              }),
          new TextFormField(
              autovalidate: _passwordAutoValidate,
              controller: password2Controller,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                  hintText: 'Confirm password', labelText: 'Confirm password'),
              onFieldSubmitted: (String textInput) {
                data.confirmPassword = textInput;
              },
              onSaved: (String value) {
                data.confirmPassword = value;
              }),
          SizedBox(height: 48.0),
          nextRoundedButton(screenSize),
        ],
      ),
    );
  }

  register(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }

    data.userName = nameController.text;
    data.email = emailController.text;
    data.password = passwordController.text;
    data.confirmPassword = password2Controller.text;
    var auth = new Authorize();
    var result = await auth.register(data);
    if (result == null) {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    }
  }
}
