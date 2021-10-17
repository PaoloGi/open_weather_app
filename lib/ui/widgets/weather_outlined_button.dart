
import 'package:flutter/material.dart';
import 'package:weather_excercise/ui/theme/weather_app_colors.dart';

class WeatherOutlinedButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Function()? onPressed;

  const WeatherOutlinedButton({Key? key, required this.text, this.icon, this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      icon != null ?
      OutlinedButton.icon(
        icon: icon!,
        label: Text(text),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 2.0, color: WeatherAppColors.appColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      )
          :
      OutlinedButton(
        child: Text(text),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 2.0, color: WeatherAppColors.appColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      );
  }

}