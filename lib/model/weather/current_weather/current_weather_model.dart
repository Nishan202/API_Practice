import 'package:api_practice/model/weather/clouds_model.dart';
import 'package:api_practice/model/weather/current_weather/main_model.dart';
import 'package:api_practice/model/weather/current_weather/sys_model.dart';
import 'package:api_practice/model/weather/current_weather/weather_model.dart';
import 'package:api_practice/model/weather/current_weather/wind_model.dart';

class CurrentWeatherModel {
  MainModel? main;
  WindModel? wind;
  CloudsModel? clouds;
  SysModel? sys;
  String? base;
  List<WeatherModel>? weather;
  int? cod;
  int? dt;
  int? id;
  String? name;
  int? timezone;
  int? visibility;

  CurrentWeatherModel({required this.base, required this.clouds, required this.cod, required this.dt, required this.id, required this.main, required this.name, required this.sys, required this.timezone, required this.visibility, required this.weather, required this.wind});

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json){
    List<WeatherModel> listOfWeather = [];

    // find each key&value pair of object and add those in a list
    for(Map<String, dynamic> eachParamWeather in json['weather']){
      WeatherModel mProduct = WeatherModel.fromJson(eachParamWeather);
      listOfWeather.add(mProduct);
    }

    return CurrentWeatherModel(base: json['base'], clouds: CloudsModel.fromJson(json['clouds']), cod: json['cod'], dt: json['dt'], id: json['id'], main: MainModel.fromJson(json['main']), name: json['name'], sys: SysModel.fromJson(json['sys']), timezone: json['timezone'], visibility: json['visibility'], weather: listOfWeather, wind: WindModel.fromJson(json['wind']));
  }
}