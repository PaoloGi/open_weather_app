import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_excercise/core/viewmodels/home_content_viewmodel.dart';
import 'package:weather_excercise/ui/theme/weather_app_colors.dart';
import 'package:weather_excercise/ui/widgets/home_widgets/single_day_weather_widget.dart';
import 'package:weather_excercise/utils/open_weather_utils.dart';
import 'package:weather_excercise/utils/temp_utils.dart';

class FiveDayWeatherWidget extends StatelessWidget {

  const FiveDayWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeContentViewModel provider = context.read<HomeContentViewModel>();
    double _screenWidth = MediaQuery.of(context).size.width;
    double leftMargin = (_screenWidth - 610 > 0 ? _screenWidth - 610 : 2) / 2;
    return Container(
      child:  Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: leftMargin+16),
              child: Text("This week", style: TextStyle(color: WeatherAppColors.appColor, fontWeight: FontWeight.bold),)
            ),
            Container(
              height: 160,
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(provider.fiveDaysForeCast.length, (index) =>
                    Container(
                      padding: EdgeInsets.all(16),
                      child: SingleDayWeatherWidget(
                          isSelected: provider.fiveDaysForeCast[index] == provider.selectedWeather!,
                          temp: TempUtils.convertKelvinToCelsius(provider.fiveDaysForeCast[index].main!.temp),
                          day: provider.fiveDaysForeCast[index].dtTxt != null ?
                                            DateFormat('EEEE').format(provider.fiveDaysForeCast[index].dtTxt!)
                                              : "???",
                          onTap: () => provider.setSelectedWeather(provider.fiveDaysForeCast[index]),
                          iconData: OpenWeatherUtils.getCustomIconDataFromWeatherCode(provider.fiveDaysForeCast[index].weather![0].icon!)
                      ),
                    )
                ),
              ),
            )
          ],
        ),
    );
  }

}
