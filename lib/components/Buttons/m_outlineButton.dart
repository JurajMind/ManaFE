import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../app/app.dart';

class MButton extends StatelessWidget {
  final IconData? icon;
  final bool dark;

  final Color iconColor;
  final String? label;
  final VoidCallback? onPressed;
  final bool? uploading;
  final double? width;
  final double? maxWidth;
  const MButton({
    Key? key,
    this.icon,
    this.label,
    this.onPressed,
    this.iconColor = Colors.white,
    this.uploading,
    this.width,
    this.maxWidth,
    this.dark = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (App.appType == AppType.freya) {
      return _buildFreyaButton(context);
    }
    var shape = new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0));
    var side = BorderSide(color: onPressed != null ? Colors.white : Colors.grey, width: 2);

    if (uploading ?? false)
      return OutlinedButton(
          style: OutlinedButton.styleFrom(shape: shape, side: side),
          onPressed: onPressed,
          child: Padding(padding: const EdgeInsets.all(8.0), child: CircularProgressIndicator()));

    if (icon == null)
      return OutlinedButton(
          style: OutlinedButton.styleFrom(shape: shape, side: side),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              constraints: BoxConstraints(minWidth: width ?? 0, maxWidth: maxWidth ?? double.infinity),
              child: Text(
                AppTranslations.of(context)!.text(label),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ));

    return Container(
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(shape: shape, side: side),
        icon: Icon(
          icon,
          color: iconColor,
        ),
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints(minWidth: width ?? 0, maxWidth: maxWidth ?? double.infinity),
            child: Text(
              AppTranslations.of(context)!.text(label),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildFreyaButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: NeumorphicButton(
        style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
            depth: 2,
            lightSource: LightSource.topLeft,
            color: dark ? Color(0xff0e0f12) : Colors.white),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints(minWidth: width ?? 0, maxWidth: maxWidth ?? double.infinity),
            child: Text(AppTranslations.of(context)!.text(label),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: dark ? Colors.white : Colors.black)),
          ),
        ),
      ),
    );
  }
}
