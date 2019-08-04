import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

import 'device_detail_page.dart';

class AddDevicePage extends StatefulWidget {
  AddDevicePage({Key key}) : super(key: key);

  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  var loading = false;
  PageController controller;

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
                  'Welcome!',
                  style: Theme.of(context).textTheme.title,
                ),
                 SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Thank you for purchasing Manapipes Tear smart hookah stand.\n \n Get ready for a new generation of hookah experience – your adventure starts now! Add your stand to your inventory to begin.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display1,
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Where is my code?',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Text(
                    'Follow the instructions in the brochure to turn your stand on. Then, open the WiFi connection menu and press Info. Your stand’s code can be found here.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display1,
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Enter device codes',
                    style: Theme.of(context).textTheme.title,
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
                  loading
                      ? CircularProgressIndicator()
                      : new RoundedButton(
                          buttonName: 'Add device',
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            Future.delayed(Duration(seconds: 5))
                                .then((_) => Navigator.of(context).pop());
                            return;
                            var bloc = DataProvider.getData(context).personBloc;
                            var addedDevice =
                                await bloc.addDevice(this.nameController.text);
                            if (addedDevice != null) {
                              Future.delayed(Duration(seconds: 5))
                                  .then((_) => Navigator.of(context).pop());
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  settings: RouteSettings(),
                                  builder: (context) =>
                                      DeviceDetailPage(device: addedDevice)));
                            }
                          },
                          buttonColor: Colors.transparent,
                          borderWidth: 2.0,
                          bottomMargin: 1.0,
                          height: 50.0,
                          width: 200,
                        )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget nextButton() {
    return new RoundedButton(
      buttonName: AppTranslations.of(context).text("common.next").toUpperCase(),
      onTap: () => nextPage(),
      buttonColor: Colors.transparent,
      borderWidth: 2.0,
      bottomMargin: 1.0,
      height: 50.0,
      width: 100,
    );
  }

  nextPage() {
    var currentPage = controller.page + 1;
    controller.animateToPage(currentPage.round(),
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
