import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Common/shadow_text.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Common/bg_painter.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RegisterPageState();
  }
}

class _RegistrationData {
  String email = '';
  String password = '';
  String confirmPassword = '';
}

class _RegisterPageState extends State<RegisterPage> {
  PageController controller;
  HSVColor color = HSVColor.fromColor(Colors.orange);
  Offset animOffset = Offset(0.0, 0.0);
  final FocusNode passwordFocusNode = FocusNode();
  _RegistrationData data = new _RegistrationData();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new PageController();
    controller.addListener(() {
      setState(() {
        animOffset = Offset(
            controller.position.pixels / 3, controller.position.pixels / 10);
        color =
            color.withHue((color.hue + controller.position.pixels / 300) % 360);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      body: Form(
        child: CustomPaint(
          painter: BgPainter(
              color: color.toColor(),
              logoSize: 1.0,
              hueRotation: -1.2,
              startPoint: Offset(
                  screenSize.width * 0.2 + animOffset.dx, 270 + animOffset.dy)),
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
    );
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
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  new InputDecoration(hintText: 'your name', labelText: 'Name'),
              onFieldSubmitted: (String textInput) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
              onSaved: (String value) {
                data.email = value;
              }),
          SizedBox(height: 48.0),
          new RoundedButton(
            buttonName: 'Next',
            onTap: () => controller.jumpToPage(2),
            buttonColor: Colors.transparent,
            borderWidth: 2.0,
            bottomMargin: 1.0,
            height: 50.0,
            width: screenSize.width,
          ),
        ],
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
            'EMAIL',
            style: Theme.of(context).textTheme.headline,
            textScaleFactor: 1.0,
            softWrap: true,
          ),
          SizedBox(height: 48.0),
          new TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  new InputDecoration(hintText: 'your name', labelText: 'Name'),
              onFieldSubmitted: (String textInput) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
              onSaved: (String value) {
                data.email = value;
              }),
          SizedBox(height: 48.0),
          new RoundedButton(
            buttonName: 'Next',
            onTap: () => controller.jumpToPage(2),
            buttonColor: Colors.transparent,
            borderWidth: 2.0,
            bottomMargin: 1.0,
            height: 50.0,
            width: screenSize.width,
          ),
        ],
      ),
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
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                  hintText: 'your name', labelText: 'Password'),
              onFieldSubmitted: (String textInput) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
              onSaved: (String value) {
                data.email = value;
              }),
          new TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                  hintText: 'your name', labelText: 'Confirm password'),
              onFieldSubmitted: (String textInput) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
              onSaved: (String value) {
                data.email = value;
              }),
          SizedBox(height: 48.0),
          new RoundedButton(
            buttonName: 'Next',
            onTap: () => controller.jumpToPage(2),
            buttonColor: Colors.transparent,
            borderWidth: 2.0,
            bottomMargin: 1.0,
            height: 50.0,
            width: screenSize.width,
          ),
        ],
      ),
    );
  }

  Widget lawPage(Size screenSize, BuildContext context) {
    return Container(
      child: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
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
                      fontSize: 25.0,
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
            new Text(''),
            new RoundedButton(
              buttonName: 'ACCEPT & REGISTER',
              onTap: () => controller.jumpToPage(2),
              buttonColor: Colors.transparent,
              borderWidth: 2.0,
              bottomMargin: 1.0,
              height: 50.0,
              width: screenSize.width,
            ),
          ]))
        ],
      ),
    );
  }
}
