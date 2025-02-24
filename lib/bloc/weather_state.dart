import 'package:api_practice/model/weather/current_weather/current_weather_model.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState{}
class WeatherLoadingState extends WeatherState{}
class WeatherLoadedState extends WeatherState{
  CurrentWeatherModel responseData;
  WeatherLoadedState({required this.responseData});
}
class WeatherErrorState extends WeatherState{
  String erroMessage;
  WeatherErrorState({required this.erroMessage});
}