import 'package:app/components/Common/labeled_value.dart';
import 'package:app/const/theme.dart';
import 'package:app/pages/SmokeSession/Experimental/smoke_timer_page.dart';
import 'package:flutter/material.dart';

class ExperimentalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Experiments'),
          centerTitle: true,
        ),
        backgroundColor: AppColors.bgBlack,
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 2,
          // Generate 100 Widgets that display their index in the List
          children: [
            new ExperimentItem(
              bgColor: AppColors.colors[0],
              text: 'Smoke timer',
              icon: Icons.plus_one,
              pageWidget: SmokeTimerPage(),
            ),
            new ExperimentItem(
              bgColor: AppColors.colors[1],
              text: 'T-Rex',
              icon: Icons.games,
            )
          ],
        ));
  }
}

class ExperimentItem extends StatelessWidget {
  final Color bgColor;
  final String text;
  final IconData icon;
  final Widget pageWidget;
  const ExperimentItem({
    Key key,
    this.bgColor,
    this.text,
    this.icon,
    this.pageWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => pageWidget == null
            ? {}
            : Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => pageWidget)),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: bgColor,
              boxShadow: [
                new BoxShadow(
                  color: Colors.black,
                  blurRadius: 20.0,
                ),
              ]),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 40,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.display1,
              )
            ],
          )),
        ),
      ),
    );
  }
}
