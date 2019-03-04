import 'package:flutter/material.dart';

class LeadingIcon extends StatelessWidget {
  final Widget child;
  final IconData icon;
  final EdgeInsetsGeometry padding;
  const LeadingIcon({Key key, this.child, this.icon, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 8.0),
      child: new Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black,
          ),
          child
        ],
      ),
    );
  }
}
