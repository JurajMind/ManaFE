import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

class MButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onPressed;
  final bool uploading;
  final double width;
  final double maxWidth;
  const MButton({
    Key key,
    this.icon,
    this.label,
    this.onPressed,
    this.iconColor = Colors.white,
    this.uploading,
    this.width,
    this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shape = new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0));
    var side = BorderSide(color: onPressed != null ? Colors.white : Colors.grey, width: 2);

    if (uploading ?? false)
      return OutlineButton(
          shape: shape, borderSide: side, onPressed: onPressed, child: Padding(padding: const EdgeInsets.all(8.0), child: CircularProgressIndicator()));

    if (icon == null)
      return OutlineButton(
          shape: shape,
          borderSide: side,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              constraints: BoxConstraints(minWidth: width ?? 0, maxWidth: maxWidth ?? double.infinity),
              child: Text(
                AppTranslations.of(context).text(label),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ));

    return Container(
      child: OutlineButton.icon(
        shape: shape,
        borderSide: side,
        icon: Icon(
          icon,
          color: iconColor,
        ),
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints(minWidth: width ?? 0, maxWidth: maxWidth ?? double.infinity),
            child: Text(
              AppTranslations.of(context).text(label),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
