import 'package:flutter/material.dart';
import 'package:weather_excercise/ui/theme/theme_settings.dart';

import '../weather_outlined_button.dart';

class WeatherMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Drawer(
        child:
            Container(
              margin: EdgeInsets.only(top: APPBAR_HEIGHT/3),
                child:
              Column(
                children: [
                  WeatherOutlinedButton(text:"Login", onPressed: () => print("login!"),),
                ],
              )
            )

    );
  }

}