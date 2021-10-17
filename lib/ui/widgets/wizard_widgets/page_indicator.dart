import 'package:flutter/material.dart';
import 'package:weather_excercise/ui/theme/weather_app_colors.dart';

class PageIndicator extends StatelessWidget {
  final bool active;
  const PageIndicator({Key? key, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return
      Container(
      decoration: BoxDecoration(
          color: active ? WeatherAppColors.appColor : WeatherAppColors.appColor.shade100,
          borderRadius: BorderRadius.all(Radius.circular(60))
      ),
      margin: EdgeInsets.only(left: 5, right: 5),
      width:  active ? _screenWidth / 20 : _screenWidth / 40,
      height: 6,
    );
  }
}
