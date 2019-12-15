import 'package:flutter/material.dart';

class ArrowPageIndicator extends StatelessWidget {
  final PageController pageController;
  final int itemCount;
  final int index;
  final String title;
  const ArrowPageIndicator(
      {Key key, this.pageController, this.itemCount, this.index, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 10,
          ),
          index == 0
              ? Container(
                  width: 50,
                )
              : IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    this.pageController.animateToPage(index - 1,
                        duration: new Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                ),
          Text(title),
          index == itemCount - 1
              ? Container(
                  width: 50,
                )
              : IconButton(
                  icon: Icon(
                    Icons.chevron_right,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    this.pageController.animateToPage(index + 1,
                        duration: new Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                ),
          Container(
            width: 10,
          ),
        ],
      ),
    );
  }
}
