import 'package:app/helpers.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Buttons/roundedButton.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            
            new Container(
              padding: new EdgeInsets.all(40.0),
              child: new Column(
                children: <Widget>[
                  new Container(
                    width: screenSize.width,
                    child: new RoundedButton(
                      buttonName: 'Sign up',
                      onTap:() { 
                         navigate(context, 'auth/register');
                      },    
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
                    child: new RoundedButton(
                      buttonName: 'Facebook login',
                      onTap:() { 
                         navigate(context, 'auth/login');
                      },    
                      buttonColor: Colors.white,
                      borderWidth: 1.0,
                      bottomMargin: 1.0,
                      height: 50.0,
                      width: screenSize.width,
                      textColor: Colors.black,
                    ),
                    margin: new EdgeInsets.only(top: 20.0),
                  ),
                  new Container(
                    width: screenSize.width,
                    child: new FlatButton(
                      child: new Text(
                        'I alredy have an account',
                      ),
                      onPressed: () {
                        navigate(context, 'auth/login');
                      },
                    ),
                    margin: new EdgeInsets.only(top: 20.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
