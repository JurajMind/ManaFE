import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

class NumberDialog extends StatefulWidget {
  final String? label;
  final int? initCount;
  final int? step;
  final String? stepLabel;

  const NumberDialog(
      {Key? key, this.label, this.initCount, this.step, this.stepLabel})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _NumberDialogState();
}

class _NumberDialogState extends State<NumberDialog> {
  int? count;
  String? stepLabel;
  @override
  void initState() {
    stepLabel = "${widget.step} ${widget.stepLabel}";
    super.initState();
    count = widget.initCount;
    controller = TextEditingController(text: count.toString());
  }

  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      content: Container(
        child: Column(
          children: <Widget>[
            Text(widget.label!),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              controller: controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlatButton(
                  child: Text('- $stepLabel'),
                  onPressed: () => setCount(widget.step! * -1),
                ),
                new FlatButton(
                  child: Text('+ $stepLabel'),
                  onPressed: () => setCount(widget.step!),
                )
              ],
            )
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: Text(
              AppTranslations.of(context)!.text("common.save").toUpperCase()),
          onPressed: () => Navigator.of(context).pop(count),
        ),
        new FlatButton(
          child: Text(
              AppTranslations.of(context)!.text("common.cancel").toUpperCase()),
          onPressed: () => Navigator.of(context).pop(-1),
        )
      ],
    );
  }

  void setCount(int addition) {
    var newCount = count! + addition;
    if (newCount <= 0) {
      newCount = 0;
    }
    return setState(() {
      count = newCount;
      controller!.text = newCount.toString();
    });
  }
}
