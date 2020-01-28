import 'package:app/const/theme.dart';
import 'package:app/Helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();
  }

  void onDonePress() {
    redirect(context, 'auth/cross');
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      colorActiveDot: Colors.white,
      nameDoneBtn: "GOT IT!",
      slides: [
        new Slide(
          widgetTitle: Text(
            "Set your mood!",
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          centerWidget: Container(height: 300, width: 300, child: Image.asset("assets/intro_1.png", alignment: Alignment.center, fit: BoxFit.contain)),
          description:
              "Light your hookah up with vibrant colors and playful animations that react to your activity and set the perfect mood for every occasion.… ",
          backgroundColor: AppColors.bgBlack,
        ),
        new Slide(
          widgetTitle: Text(
            "Track smart!",
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          centerWidget: Container(height: 300, width: 300, child: Image.asset("assets/intro_2.png", alignment: Alignment.center, fit: BoxFit.contain)),
          description:
              "How long is your average session, or how many puffs did you take? Keep track of your gear and stats, create and share your custom tobacco mixes!",
          backgroundColor: AppColors.bgBlack,
        ),
        new Slide(
          widgetTitle: Text(
            "Challenge your friends!",
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          centerWidget: Container(height: 300, width: 300, child: Image.asset("assets/intro_3.png", alignment: Alignment.center, fit: BoxFit.contain)),
          description: "Challenge your friends to a longest inhale competition to see whose lungs are the mightiest and share your activity on social media!",
          backgroundColor: AppColors.bgBlack,
        ),
      ],
      onDonePress: this.onDonePress,
    );
  }
}
