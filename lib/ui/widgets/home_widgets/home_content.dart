import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:weather_excercise/core/viewmodels/home_content_viewmodel.dart';
import 'package:weather_excercise/ui/theme/weather_icons.dart';
import 'package:weather_excercise/ui/widgets/home_widgets/today_weather_widgets.dart';
import 'package:weather_excercise/ui/widgets/home_widgets/weather_stats_icon_widget.dart';
import 'package:weather_excercise/utils/nominatim_utils.dart';
import 'package:weather_excercise/utils/temp_utils.dart';
import '../error_dialog.dart';
import '../weather_location_autocomplete.dart';
import 'five_day_weather_widget.dart';
import 'gauge_temperature.dart';

class HomeContent extends StatefulWidget {
  HomeContent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeContentState();
}

class HomeContentState extends State<HomeContent> {

  final TextEditingController ctrlCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<HomeContentViewModel>(
          create: (context) => HomeContentViewModel()..init(),
          child:
            Consumer(builder: (ctx, HomeContentViewModel provider, _) {
              ctrlCity.text = NominatimUtils.getCityAndCountryToStringFromPlace(provider.placeSelected);
              return Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.only(top: 0.0),
                  children: [
                    WeatherLocationAutocomplete(
                      controller: ctrlCity,
                      onSuggestionSelected: (selected) => provider.get5DayWeatherForecast(selected)
                    ),
                    if(provider.isLoading)
                      loading()
                    else if(provider.fiveDaysForeCast.length > 0)
                      Column(
                        children: [
                          TodayWeatherWidgets(),
                          Divider(thickness: 1, indent: 20, endIndent: 20, height: 60),
                          FiveDayWeatherWidget()
                        ],
                      )

                    else
                      loading()
                  ],
                ),
              );
          }));
  }


  Widget loading(){
    return Center(
      child: Container(
        margin: EdgeInsets.all(16),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
