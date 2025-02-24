import 'package:api_practice/app_exceptions.dart';
import 'package:api_practice/bloc/weather_event.dart';
import 'package:api_practice/bloc/weather_state.dart';
import 'package:api_practice/model/api_helper.dart';
import 'package:api_practice/model/weather/current_weather/current_weather_model.dart';
import 'package:api_practice/urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  ApiHelper apiHelper;
  WeatherBloc({required this.apiHelper}) : super(WeatherInitialState()) {
    on<GetWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());

      try {
        var responseJson = await apiHelper.getApi(url: Urls.getWeatherUrl);
        if (responseJson != null) {
          var responseData = CurrentWeatherModel.fromJson(responseJson);
          emit(WeatherLoadedState(responseData: responseData));
        } else {
          emit(WeatherErrorState(erroMessage: 'Error Occured'));
        }
      } catch (e) {
        emit(WeatherErrorState(erroMessage: (e as AppExceptions).toErrorMessage()));
      }
  
    });
  }
}