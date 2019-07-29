import 'package:flutter/material.dart';

class AddDevicePage extends StatefulWidget {
  AddDevicePage({Key key}) : super(key: key);

  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Thank you!',
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean id metus id velit ullamcorper pulvinar. Maecenas aliquet accumsan leo. Integer pellentesque quam vel velit. Nunc dapibus tortor vel mi dapibus sollicitudin.',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Where to find codes',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Enter device codes',
                  style: Theme.of(context).textTheme.body1,
                ),
                new TextFormField(
                  maxLines: 1,
                  maxLength: 5,
                  controller: myController,
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                  autocorrect: false,
                  decoration: new InputDecoration(
                    labelText: "Device name",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                          const BorderSide(color: Colors.white, width: 3.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                          const BorderSide(color: Colors.white, width: 3.0),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                new TextFormField(
                  maxLines: 1,
                  maxLength: 5,
                  controller: myController,
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                  autocorrect: false,
                  decoration: new InputDecoration(
                    labelText: "Pair code",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                          const BorderSide(color: Colors.white, width: 3.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                          const BorderSide(color: Colors.white, width: 3.0),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
