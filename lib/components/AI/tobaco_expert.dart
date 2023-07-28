import 'package:app/const/theme.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../main.dart';
import '../Buttons/m_outlineButton.dart';

class TobacoExpertWidget extends StatefulWidget {
  const TobacoExpertWidget({Key? key, required this.prompt, required this.lengh}) : super(key: key);
  final String prompt;
  final int lengh;

  @override
  State<TobacoExpertWidget> createState() => _TobacoExpertWidgetState();
}

class _TobacoExpertWidgetState extends State<TobacoExpertWidget> {
  String? stringReresponse;
  bool loading = false;
  bool isExpanded = false;
  bool dataLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) async {
              setState(() {
                this.isExpanded = !isExpanded;
              });
              await askAI();
            },
            children: [
              ExpansionPanel(
                  backgroundColor: AppColors.freyaBlack,
                  isExpanded: this.isExpanded,
                  headerBuilder: ((context, isExpanded) {
                    return ListTile(
                      title: Center(child: Text('Ask expert', style: Theme.of(context).textTheme.titleLarge)),
                      leading: Icon(FontAwesomeIcons.question),
                    );
                  }),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: loading ? CircularProgressIndicator() : Text(stringReresponse ?? ''),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Future<void> askAI() async {
    if (dataLoaded || loading) {
      return;
    }
    stringReresponse = null;
    setState(() {
      loading = true;
    });

    final request = ChatCompleteText(messages: [
      Messages(role: Role.user, content: widget.prompt, name: "get_current_weather"),
    ], maxToken: widget.lengh, model: GptTurboChatModel());
    var openAi = getIt.get<OpenAI>();
    final response = await openAi.onChatCompletion(request: request);

    setState(() {
      stringReresponse = response?.choices.map((e) => e.message?.content).join(" ");
      loading = false;
      dataLoaded = true;
    });
  }
}
