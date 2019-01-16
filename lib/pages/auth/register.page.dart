import 'package:app/components/Buttons/roundedButton.dart';
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
  final FocusNode passwordFocusNode = FocusNode();
  _RegistrationData data = new _RegistrationData();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      body: Form(
        child: PageView(
          pageSnapping: true,
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            CustomPaint(
              painter: BgPainter(),
              child: Center(
                
                child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left:24.0,right: 24.0),
                  children: <Widget>[
                    Text('YOUR NAME',style: Theme.of(context).textTheme.headline,),
                       SizedBox(height: 48.0),
                    new TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                            hintText: 'your name', labelText: 'Name'),

                        onFieldSubmitted: (String textInput) {
                          FocusScope.of(context)
                              .requestFocus(passwordFocusNode);
                        },
                        onSaved: (String value) {
                          data.email = value;
                        }),
                     SizedBox(height: 48.0),
                new RoundedButton(
                              buttonName: 'Next',
                              onTap: () => controller.jumpToPage(2),
                              buttonColor: Colors.transparent,
                              borderWidth: 1.0,
                              bottomMargin: 1.0,
                              height: 50.0,
                              width: screenSize.width,
                            ),],
                ),
              ),
            ),
            Placeholder()
          ],
        ),
      ),
    );
  }
}
