import 'package:app/const/theme.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/SmokeSession/color_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../animation_picker_page.dart';

class SessionControllRow extends StatelessWidget {
  const SessionControllRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var smokeSessionBloc = DataProvider.getData(context).smokeSessionBloc;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(              
              child: IconButton(
                color: AppColors.colors[1],
                iconSize: 50,
                icon: Icon(Icons.list),
                onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (BuildContext context) {
                      return new AnimationPickerPage();
                    })),
              ),
            ),
             Text('Animations',style: Theme.of(context).textTheme.display4.apply(color:AppColors.colors[1]),)
          ],
        ),
        StreamBuilder<StandSettings>(
               stream: smokeSessionBloc.standSettings,
          builder: (context, snapshot) {
            var color = snapshot?.data?.idle?.color?.toColor() ?? AppColors.colors[3];
            return Column(
              children: <Widget>[
                IconButton(
                  color: color,
                  iconSize: 50,
                  icon: Icon(FontAwesomeIcons.marker),
                  onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        return new ColorPickerPage();
                      })),
                ),
                    StreamBuilder<StandSettings>(
                    stream: smokeSessionBloc.standSettings,
                      builder: (context, snapshot) {
                        return Text('Colors',style: Theme.of(context).textTheme.display4.apply(color:color));
                      }
                    )
            
          
        
      ],);})]
    );
  }
}
