import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SmokeTimerPage extends StatefulWidget {
  @override
  _SmokeTimerPageState createState() => new _SmokeTimerPageState();
}

class _SmokeTimerPageState extends State<SmokeTimerPage> {

  double height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smoke timer'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Align(
           alignment: Alignment.bottomCenter,
                child:  AnimatedContainer(
                duration: Duration(seconds: 1),
                  width: 200,
                  height: height,               
                  child: WaveWidget(
        config: CustomConfig(
            gradients: [
                  [Colors.red, Color(0xEEF44336)],
                  [Colors.red[800], Color(0x77E57373)],
                  [Colors.orange, Color(0x66FF9800)],
                  [Colors.yellow, Color(0x55FFEB3B)]
            ],
            durations: [35000, 19440, 10800, 6000],
            heightPercentages: [0.20, 0.23, 0.25, 0.30],
            blur: MaskFilter.blur(BlurStyle.solid, 10),
            gradientBegin: Alignment.bottomLeft,
            gradientEnd: Alignment.topRight,
        ),
       
        waveAmplitude: 0,
       
        backgroundColor: Colors.transparent,
        size: Size(double.infinity, double.infinity),
    ),
                )
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Text(
                    'TOP',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  FlatButton(child: Text('Test'),
                  onPressed: () => setState((){
                  this.height != 300 ?  this.height = 300 : this.height = 10;
                  }),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
