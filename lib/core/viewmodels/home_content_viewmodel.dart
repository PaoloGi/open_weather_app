import 'package:geolocator/geolocator.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:weather_excercise/core/models/city_weather_model.dart';
import 'package:weather_excercise/core/services/open_weather_service.dart';
import 'package:weather_excercise/utils/extended_changenotifier.dart';
import 'package:weather_excercise/utils/geolocator_wrapper.dart';
import 'package:weather_excercise/utils/nominatim_utils.dart';

class HomeContentViewModel  extends ExtendedChangeNotifier {
  ///the location selected by the user (or the gps)
  Place? placeSelected;
  ///the 5 day weather forecast
  List<CityWeatherModel> fiveDaysForeCast = [];
  ///the main forecast selected from the 5 day forecast
  CityWeatherModel? selectedWeather;

  setSelectedWeather(CityWeatherModel cityWeatherModel){
    selectedWeather = cityWeatherModel;
    notifyListeners();
  }

  ///get the 5 day forecast and automatically select the first one as the selectedWeather
  get5DayWeatherForecast(Place newPlaceSelected) {
    errorHandlingRest(() async {
      placeSelected = newPlaceSelected;
      fiveDaysForeCast = await OpenWeatherService
          .get5DayWeatherForecast(
          NominatimUtils.getCityToStringFromPlace(placeSelected));
      selectedWeather = fiveDaysForeCast[0];
      notifyListeners();
    });
  }

  ///check if the location permissions are granted, get the location and the call the 5DayWeatherForecast
  void init() {
    errorHandlingRest(() async {
      Position? currentPosition = await GeolocatorWrapper.getCurrentPosition();
      if(currentPosition != null){
        placeSelected = await Nominatim.reverseSearch(lat: currentPosition.latitude, lon: currentPosition.longitude);
        get5DayWeatherForecast(placeSelected!);
      }
    });
  }




}