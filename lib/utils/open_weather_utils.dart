

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_excercise/ui/theme/weather_icons.dart';

class OpenWeatherUtils {

  static IconData getCustomIconDataFromWeatherCode(String code){
    IconData respIcon = WeatherIcons.broken_clouds;

    switch(code){
      case "01n": respIcon = WeatherIcons.clear_sky_icon; break;
      case "02n": respIcon = WeatherIcons.few_clouds_icon; break;
      case "03n": respIcon = WeatherIcons.scattered_clouds_icon; break;
      case "04n": respIcon = WeatherIcons.broken_clouds; break;
      case "09n": respIcon = WeatherIcons.shower_rain_icon; break;
      case "10n": respIcon = WeatherIcons.rain_icon; break;
      case "11n": respIcon = WeatherIcons.thunderstorm_icon; break;
      case "13n": respIcon = WeatherIcons.snow_icon; break;
      case "50n": respIcon = WeatherIcons.mist_icon; break;
    }
    return respIcon;
  }

  static double getKmHourFromMeterSeconds(double meterSeconds){
    return meterSeconds * 3.6;
  }

}
