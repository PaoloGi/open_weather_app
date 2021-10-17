import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_excercise/core/viewmodels/home_content_viewmodel.dart';
import 'package:weather_excercise/ui/theme/weather_icons.dart';
import 'package:weather_excercise/ui/widgets/home_widgets/weather_stats_icon_widget.dart';
import 'package:weather_excercise/utils/open_weather_utils.dart';
import 'package:weather_excercise/utils/temp_utils.dart';

import 'gauge_temperature.dart';

class TodayWeatherWidgets extends StatelessWidget {
  const TodayWeatherWidgets({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeContentViewModel provider = context.read<HomeContentViewModel>();
    String kmHWindSpeed = OpenWeatherUtils
                          .getKmHourFromMeterSeconds(
                            provider.selectedWeather!.wind!.speed!).toStringAsFixed(1);
    return Container(
      child:
      Column(
        children: [
          GaugeTemperature(
              value: TempUtils.convertKelvinToCelsius(provider.selectedWeather!.main!.temp)
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WeatherStatsIconWidget(
                    icon: WeatherIcons.wind_icon,
                    text: "$kmHWindSpeed km/h"),
                WeatherStatsIconWidget(
                    icon: WeatherIcons.moisture_icon,
                    text: "${provider.selectedWeather!.main!.humidity} %"),
                WeatherStatsIconWidget(
                    icon: WeatherIcons.rain_icon,
                    text: "${provider.selectedWeather!.pop} %")
              ],
            ),
          )
        ],
      ),
    );
  }
}
