import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/components/Pickers/bottom_controll_bar.dart';
import 'package:app/components/Pickers/smoke_color_wheel.dart';
import 'package:app/main.dart';
import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ColorPickerPage extends StatefulWidget {
  final StandSettings? initData;
  ColorPickerPage({Key? key, this.initData}) : super(key: key);

  _ColorPickerPageState createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  PageController? mainController;
  PageController? touchController;

  @override
  void initState() {
    mainController = new PageController(
      initialPage: 1,
      keepPage: false,
    );
    touchController = new PageController(
      initialPage: 1,
      keepPage: false,
    )..addListener(_onScroll);

    super.initState();
  }

  void _onScroll() {
    mainController!.jumpTo(touchController!.offset);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTranslations.of(context)!.text('smoke_session.select_color').toUpperCase(),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        height: size.height * 0.75,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: PageView(
                pageSnapping: false,
                controller: mainController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    child: StateColorPicker(initColor: widget.initData?.idle?.color?.toColor(), state: SmokeState.idle),
                  ),
                  StateColorPicker(initColor: widget.initData?.puf?.color?.toColor(), state: SmokeState.puf),
                  StateColorPicker(initColor: widget.initData?.blow?.color?.toColor(), state: SmokeState.blow),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: PageView(
                  controller: touchController,
                  children: <Widget>[
                    BottomControllBar(
                      haveLeftChevron: false,
                      haveRightChevron: true,
                      label: AppTranslations.of(context)!.text("smoke_session.idle"),
                      state: SmokeState.idle,
                    ),
                    BottomControllBar(
                      haveLeftChevron: true,
                      haveRightChevron: true,
                      label: AppTranslations.of(context)!.text("smoke_session.inhale"),
                      state: SmokeState.puf,
                    ),
                    BottomControllBar(
                      haveLeftChevron: true,
                      haveRightChevron: false,
                      label: AppTranslations.of(context)!.text("smoke_session.blow"),
                      state: SmokeState.blow,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StateColorPicker extends StatefulWidget {
  final Color? initColor;
  final SmokeState? state;
  const StateColorPicker({Key? key, this.initColor, this.state}) : super(key: key);
  @override
  _StateColorPickerState createState() => _StateColorPickerState();
}

class _StateColorPickerState extends State<StateColorPicker> {
  Color? color = Colors.white;
  @override
  initState() {
    if (widget.initColor != null) color = widget.initColor;
    super.initState();
  }

  Color? _tempMainColor;
  @override
  Widget build(BuildContext context) {
    var smokeSessionBloc = getIt.get<SmokeSessionBloc>();
    return Container(
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              child: StreamBuilder<StandSettings?>(
                  stream: smokeSessionBloc.standSettings,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container();
                    }
                    return Container(
                      child: SmokeColorWheel(
                        onColorChanging: (color) {
                          setState(() {
                            this.color = color!.toColor();
                          });
                        },
                        onColorChanged: (color) {
                          smokeSessionBloc.setColor(color!.toColor(), widget.state!);
                        },
                        color: snapshot.data!.getStateSetting(widget.state)!.color,
                      ),
                    );
                  }),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: InkWell(
                  onTap: () => _openColorPicker(context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    width: 50,
                    height: 50,
                    child: Icon(
                      FontAwesomeIcons.circleNotch,
                      size: 40,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void _openColorPicker(BuildContext context) async {
    _openDialog(
      context,
      "Color picker",
      MaterialColorPicker(
        selectedColor: this.color,
        allowShades: false,
        onColorChange: (pickerColor) => setState(() => _tempMainColor = pickerColor),
      ),
    );
  }

  void _openDialog(BuildContext context, String title, Widget content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            MButton(
              label: 'CANCEL',
              iconColor: Colors.red,
              onPressed: Navigator.of(context).pop,
            ),
            MButton(
              label: 'SUBMIT',
              iconColor: _tempMainColor!,
              onPressed: () {
                setState(() => color = _tempMainColor);
                var bloc = getIt.get<SmokeSessionBloc>();
                bloc.setColor(_tempMainColor!, SmokeState.idle);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
