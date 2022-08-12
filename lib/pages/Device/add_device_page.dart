import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/module.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

import 'device_detail_page.dart';

class AddDevicePage extends StatefulWidget {
  AddDevicePage({Key? key}) : super(key: key);

  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final codeController = TextEditingController();
  var loading = false;
  PageController? controller;

  @override
  void initState() {
    controller = new PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppTranslations.of(context)!.text("device.welcome"),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppTranslations.of(context)!.text("device.welcome_text"),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                nextButton()
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      AppTranslations.of(context)!.text("device.where_is_code"),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      AppTranslations.of(context)!.text("device.where_is_code_text_1"),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppTranslations.of(context)!.text("device.where_is_code_text_1_t"),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      AppTranslations.of(context)!.text("device.where_is_code_text_2"),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppTranslations.of(context)!.text("device.where_is_code_text_2_t"),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    nextButton()
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      AppTranslations.of(context)!.text("device.enter_device_codes"),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    new TextFormField(
                      maxLines: 1,
                      controller: nameController,
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                      autocorrect: false,
                      decoration: new InputDecoration(
                        labelText: AppTranslations.of(context)!.text("device.device_name"),
                        helperText: AppTranslations.of(context)!.text("device.device_name_helper"),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    new TextFormField(
                      maxLines: 1,
                      controller: idController,
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                      autocorrect: false,
                      decoration: new InputDecoration(
                        labelText: AppTranslations.of(context)!.text("device.device_id"),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    new TextFormField(
                      maxLines: 1,
                      maxLength: 5,
                      controller: codeController,
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                      autocorrect: false,
                      decoration: new InputDecoration(
                        labelText: AppTranslations.of(context)!.text("device.pair_code"),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    loading
                        ? CircularProgressIndicator()
                        : new MButton(
                            icon: Icons.add,
                            label: AppTranslations.of(context)!.text("device.add_device"),
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });

                              var bloc = getIt.get<PersonBloc>();
                              var addedDevice = await bloc.addDevice(
                                  this.idController.text, this.codeController.text, this.nameController.text);
                              if (addedDevice != null) {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    settings: RouteSettings(),
                                    builder: (context) => DeviceDetailPage(device: addedDevice)));
                              }
                            },
                          )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget nextButton() {
    return new RoundedButton(
      buttonName: AppTranslations.of(context)!.text("common.next").toUpperCase(),
      onTap: () => nextPage(),
      buttonColor: Colors.transparent,
      borderWidth: 2.0,
      bottomMargin: 1.0,
      height: 50.0,
      width: 100,
    );
  }

  nextPage() {
    var currentPage = controller!.page! + 1;
    controller!.animateToPage(currentPage.round(), duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
