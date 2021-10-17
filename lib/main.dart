import 'package:flutter/material.dart';
import 'package:weather_excercise/ui/screens/home_screen.dart';
import 'package:weather_excercise/ui/theme/weather_app_colors.dart';
import 'package:weather_excercise/utils/custom_scroll_behavior.dart';
import 'package:weather_excercise/utils/navigator_utils.dart';

import 'ui/screens/wizard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      title: 'Weather App',
      navigatorKey: NavigatorUtils.navState,
      theme: ThemeData(
        primarySwatch: WeatherAppColors.appColor,
      ),
      routes: {
        '/': (context) => WizardScreen(),
        '/home_screen' : (context) => HomeScreen(),
      }
    );
  }
}


