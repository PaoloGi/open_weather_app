

import 'package:osm_nominatim/osm_nominatim.dart';

class NominatimUtils {
  /// *
  /// Get a string of {city, country} from Place object
  static String getCityAndCountryToStringFromPlace(Place? place){
    String displayName = "";
    if(place != null && place.address != null){
      displayName = place.address!["suburb"]
          ?? place.address!["hamlet"]
          ?? place.address!["village"]
          ?? place.address!["town"]
          ?? place.address!["city"]
          ?? place.address!["county"] ?? "";
      displayName += ", " + place.address!["country"];
    }
    return displayName;
  }

  /// *
  /// Get a string of {city} from Place object
  static String getCityToStringFromPlace(Place? place){
    String displayName = "";
    if(place != null && place.address != null){
      displayName = place.address!["suburb"]
          ?? place.address!["hamlet"]
          ?? place.address!["village"]
          ?? place.address!["town"]
          ?? place.address!["city"]
          ?? place.address!["county"] ?? "";
    }
    return displayName;
  }

  /// *
  /// Get only one place where {city, country} is equal
  static List<Place?> getOnlyOneCityAndCountryFromList(List<Place?> places){
    List<Place?> returnPlaces = [];
    places.forEach((element) {
      String resString = getCityAndCountryToStringFromPlace(element);
      if(!returnPlaces.any((alreadyPlaces) => getCityAndCountryToStringFromPlace(element) == resString)){
        returnPlaces.add(element);
      }
    });
    return returnPlaces;
  }

}