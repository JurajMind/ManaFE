import 'package:app/components/Pickers/smoke_color_wheel.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ColorPickerPage extends StatefulWidget {
  final Color initColor;

  const ColorPickerPage({Key key, this.initColor}) : super(key: key);
  @override
  _ColorPickerPageState createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color color = Colors.white;
  @override
  initState(){
    if(widget.initColor != null)
    color = widget.initColor;

    super.initState();
  }
  Color _tempMainColor;
  @override
  Widget build(BuildContext context) {
    var smokeSessionBloc = DataProvider.getData(context).smokeSessionBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text('Select color',style: Theme.of(context).textTheme.title,),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child:    Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 8),
              child: InkWell(
                onTap: () => _openColorPicker(context),
                
                child: Container(
                 decoration: BoxDecoration(
                   color: color,
                   shape: BoxShape.circle,
                 ),
                 width: 80,
                 height: 80,
                 child: Icon(FontAwesomeIcons.circleNotch,size: 60,),
                )
              ),
            ),
            Center(
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
            ),
          ],
        ))
      );
    
  }

    void _openColorPicker(BuildContext context) async {
    _openDialog(
      context,
      "Color picker",
      MaterialColorPicker(
        selectedColor: Colors.red,
        onColorChange: (pickerColor) => setState(() => _tempMainColor = pickerColor),
      ),
    );
  }

    void _openDialog(BuildContext context,String title, Widget content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              textColor: Colors.red,
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('SUBMIT'),
              textColor: _tempMainColor,
              onPressed: () {
               
              setState(() => color = _tempMainColor);
                var bloc = DataProvider.getData(context).smokeSessionBloc;
                 bloc.setColor(_tempMainColor);
                                        
                 Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
    );
  }
}