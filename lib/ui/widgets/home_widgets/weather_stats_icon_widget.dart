import 'package:flutter/material.dart';
import 'package:weather_excercise/ui/theme/theme_settings.dart';
import 'package:weather_excercise/ui/theme/weather_app_colors.dart';

class WeatherStatsIconWidget extends StatelessWidget {

  final IconData icon;
  final String text;

  const WeatherStatsIconWidget({Key? key, required this.icon, required this.text}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        children: [
          Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                color: WeatherAppColors.appColor.shade50,
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Icon(icon, color: WeatherAppColors.appColor, size: 28),
          ),
          Text(text, style: TextStyle(color: WeatherAppColors.appColor))
        ],
      ),
    );
  }
}
