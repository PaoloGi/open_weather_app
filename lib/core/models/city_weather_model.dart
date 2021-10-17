// To parse this JSON data, do
//
//     final cityWeatherModel = cityWeatherModelFromMap(jsonString);

import 'dart:convert';

CityWeatherModel cityWeatherModelFromMap(String str) => CityWeatherModel.fromMap(json.decode(str));

class CityWeatherModel {
  CityWeatherModel({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
  });

  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Sys? sys;
  DateTime? dtTxt;

  factory CityWeatherModel.fromMap(Map<String, dynamic> json) => CityWeatherModel(
    dt: json["dt"],
    main: Main.fromMap(json["main"]),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
    clouds: Clouds.fromMap(json["clouds"]),
    wind: Wind.fromMap(json["wind"]),
    visibility: json["visibility"],
    pop: json["pop"] != null ? json["pop"] is int ? (json["pop"] as int).toDouble() : json["pop"] : 0,
    sys: Sys.fromMap(json["sys"]),
    dtTxt: DateTime.parse(json["dt_txt"]),
  );


  static List<CityWeatherModel> mapList(dynamic objects){
    List<CityWeatherModel> items = [];
    for(var o in objects){
      items.add(CityWeatherModel.fromMap(o));
    }
    return items;
  }

}

class Clouds {
  Clouds({
    this.all,
  });

  int? all;

  factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

}

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  factory Main.fromMap(Map<String, dynamic> json) => Main(
    temp: json["temp"].toDouble(),
    feelsLike: json["feels_like"].toDouble(),
    tempMin: json["temp_min"].toDouble(),
    tempMax: json["temp_max"].toDouble(),
    pressure: json["pressure"],
    seaLevel: json["sea_level"],
    grndLevel: json["grnd_level"],
    humidity: json["humidity"],
    tempKf: json["temp_kf"].toDouble(),
  );

}

class Sys {
  Sys({
    this.pod,
  });

  String? pod;

  factory Sys.fromMap(Map<String, dynamic> json) => Sys(
    pod: json["pod"],
  );

}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  String? main;
  String? description;
  String? icon;

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );

}

class Wind {
  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  double? speed;
  int? deg;
  double? gust;

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
    speed: json["speed"].toDouble(),
    deg: json["deg"],
    gust: json["gust"].toDouble(),
  );

}
