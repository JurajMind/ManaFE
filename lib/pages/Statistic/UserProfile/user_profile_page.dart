import 'dart:math';

import 'package:app/const/theme.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:achievement_view/achievement_view.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            expandedHeight: 300.0,
            automaticallyImplyLeading: true,
            primary: true,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              title: AvatarGlow(
                startDelay: Duration(milliseconds: 1000),
                glowColor: AppColors.colors[2],
                endRadius: 100.0,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Material(
                  elevation: 8.0,
                  shape: CircleBorder(),
                  color: Colors.transparent,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar.png'),
                    radius: 50.0,
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(700, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Smoking hedgehog',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Lvl: 4',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
          ),
          new SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.star),
                      Text('450/1000 exp', style: Theme.of(context).textTheme.headline5)
                    ],
                  ),
                  Row(
                    children: <Widget>[Icon(Icons.cloud), Text('120', style: Theme.of(context).textTheme.headline5)],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Achievments 5/200',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AchievementItem(
                    text: 'Shisha messe 2019',
                    subText: 'Vidis D34 booth',
                    date: '26.4.2019',
                    icon: FontAwesomeIcons.medal,
                  ),
                  AchievementItem(
                      text: 'Perfect week',
                      subText: '7days 7 hookahs',
                      date: '20.4.2019',
                      icon: FontAwesomeIcons.calendarWeek),
                  AchievementItem(
                      text: 'CHC Romana opening',
                      subText: 'Attend opening of CHC',
                      date: '19.8.2018',
                      icon: FontAwesomeIcons.mapMarked),
                  AchievementItem(
                      text: 'Little dragon',
                      subText: 'Take 15s long puff',
                      date: '12.5.2018',
                      icon: FontAwesomeIcons.fire),
                  AchievementItem(
                    text: 'Dark side awekens',
                    subText: 'Try some Darkside tobacco',
                    date: '20.4.2018',
                    icon: FontAwesomeIcons.moon,
                  ),
                  AchievementItem(
                      text: 'Big dragon', subText: 'Take 60s long puff', have: false, icon: FontAwesomeIcons.fire),
                  AchievementItem(
                    text: 'Catch them all',
                    subText: 'Try ALL Darkside tobacco',
                    icon: FontAwesomeIcons.cloudMoon,
                    have: false,
                  ),
                  AchievementItem(
                    text: 'Perfect month',
                    subText: '30 days, 30 hookahs',
                    icon: FontAwesomeIcons.solidCalendarCheck,
                    have: false,
                  ),
                  AchievementItem(
                    text: 'Perfect year',
                    subText: '365 days, 365 hookahs',
                    icon: FontAwesomeIcons.calendar,
                    have: false,
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class AchievementItem extends StatelessWidget {
  final String? text;
  final String? date;
  final String? subText;
  final IconData? icon;
  final bool have;

  const AchievementItem({Key? key, this.text, this.date, this.subText, this.icon, this.have = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: !have ? AppColors.black : AppColors.gray,
          borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
          border: new Border.all(color: const Color.fromRGBO(221, 221, 221, 1.0), width: 2),
        ),
        child: ListTile(
          onTap: () => showAchievementView(this, context),
          leading: Icon(
            icon,
            size: 40,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[Text(text!), Text(date ?? '')],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(subText!),
              Text("${rng.nextInt(20)} exp / ${rng.nextInt(20)} c."),
            ],
          ),
        ),
      ),
    );
  }

  void showAchievementView(AchievementItem item, BuildContext context) {
    if (item.have) return;
/*
    AchievementView(context,
        title: item.text,
        subTitle: item.subText,
        //onTab: _onTabAchievement,
        icon: Icon(
          item.icon,
          color: Colors.white,
        ),
        //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
        //borderRadius: 5.0,
        color: AppColors.colors[0],
        //textStyleTitle: TextStyle(),
        //textStyleSubTitle: TextStyle(),
        alignment: Alignment.topCenter,
        duration: Duration(seconds: 3),
        isCircle: false, listener: (status) {
      print(status);
      //AchievementState.opening
      //AchievementState.open
      //AchievementState.closing
      //AchievementState.closed
    })
      ..show();*/
  }
}
