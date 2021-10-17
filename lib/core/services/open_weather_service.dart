

import 'package:weather_excercise/core/models/city_weather_model.dart';
import 'package:weather_excercise/utils/network_util.dart';

class OpenWeatherService {

  /// Get 5 day forecast by city name, with an interval of 3h
  static Future<List<CityWeatherModel>> get5DayWeatherForecast(String cityName) async {
    List<CityWeatherModel> responseList = [];
    var response = await NetworkUtil.get(
      url: Uri.https(BASE_URL, API+"/forecast", {"q": cityName, "appid": API_KEY}),
    );
    if(response["list"] != null){
      responseList = get5DayForecastFromList(CityWeatherModel.mapList(response["list"]));
    }
    return responseList;
  }

  ///Reduce the forecasts to one forecast for the 5 days
  static List<CityWeatherModel> get5DayForecastFromList(List<CityWeatherModel> list){
    List<CityWeatherModel> responseList = [];
    responseList.add(list[0]);
    responseList.add(list.firstWhere((element) => element.dtTxt! == list[0].dtTxt!.add(Duration(days: 1))));
    responseList.add(list.firstWhere((element) => element.dtTxt! == list[0].dtTxt!.add(Duration(days: 2))));
    responseList.add(list.firstWhere((element) => element.dtTxt! == list[0].dtTxt!.add(Duration(days: 3))));
    responseList.add(list[list.length-1]);
    return responseList;
  }
}