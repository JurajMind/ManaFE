import 'package:flutter/material.dart';

class Hero2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:             Hero(
              tag: "DemoTag",
              child: IconButton(
                icon: Icon(Icons.add, size: 70),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Hero2())),
              ),
            ),
      
    );
  }
}