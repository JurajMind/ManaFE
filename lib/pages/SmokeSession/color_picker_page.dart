import 'package:app/components/Pickers/smoke_color_wheel.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';


class ColorPickerPage extends StatefulWidget {
  @override
  _ColorPickerPageState createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    var smokeSessionBloc = DataProvider.getData(context).smokeSessionBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text('Select color',style: Theme.of(context).textTheme.title.apply(color:color),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child:    Center(
          child: Container(
            height: MediaQuery.of(context).size.width,
            child: StreamBuilder<StandSettings>(
                                stream: smokeSessionBloc.standSettings,
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return Container();
                                  }
                                  return SmokeColorWheel(
                                    onColorChanging: (color) {
                                        setState((){
                                          this.color= color.toColor();
                                        });
                                    },
                                    onColorChanged: (color) {
                                      smokeSessionBloc
                                          .setColor(color.toColor());
                                    },
                                    color: snapshot?.data?.idle?.color,
                                  );
                                }),
          ),
        ))
      );
    
  }
}