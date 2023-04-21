
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

class BigSelect extends StatelessWidget {
  final Map<int, String>? labels;
  final int? curentView;
  final ValueChanged<int>? onSelected;
  const BigSelect({Key? key, this.labels, this.curentView, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDialog(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            AppTranslations.of(context)!.text(labels![curentView!]),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 30,
          )
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Material(
            color: Color.fromARGB(150, 0, 0, 0),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Center(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ...labels!.map((f, _) {
                        return MapEntry(f, mixTypeSelector(context, f));
                      }).values
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  InkWell mixTypeSelector(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        onSelected!(index);
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Text(AppTranslations.of(context)!.text(labels![index]).toUpperCase(), style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
