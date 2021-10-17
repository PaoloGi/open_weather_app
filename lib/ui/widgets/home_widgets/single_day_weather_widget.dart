import 'package:flutter/material.dart';
import 'package:weather_excercise/ui/theme/weather_app_colors.dart';

///A small day widget for viewing temp, day of the week and a weather icon
class SingleDayWeatherWidget extends StatelessWidget {

  final bool isSelected;
  final double temp;
  final String day;
  final IconData iconData;
  final Function() onTap;

  const SingleDayWeatherWidget({
    Key? key,
    required this.isSelected,
    required this.temp,
    required this.day,
    required this.onTap,
    required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSelected ? null : onTap,
      child: Container(
        width: 90,
        height: 150,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
                color: getColor(),
                width: 2
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(day, style: TextStyle(color: getColor(), fontSize: 13),),
            Icon(iconData, color: getColor()),
            Text("$temp C°", style: TextStyle(color: getColor())),
          ],
        ),
      ),
    );
  }

  Color getColor(){
    return isSelected ? WeatherAppColors.appColor : WeatherAppColors.appColor.shade50;
  }
}
