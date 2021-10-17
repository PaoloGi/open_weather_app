
class TempUtils {

  static double convertKelvinToCelsius(double? kelvin){
    return kelvin != null ? (kelvin - 273.15).roundToDouble() : 0;
  }
}