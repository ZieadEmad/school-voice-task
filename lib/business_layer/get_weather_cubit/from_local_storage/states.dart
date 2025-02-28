import 'package:voiceschooltask/data_layer/data_models/weather_model/weather_local_model.dart';

abstract class WeatherFromLocalStates{}

class WeatherFromLocalStateInitial extends WeatherFromLocalStates{}
class WeatherFromLocalStateLoading extends WeatherFromLocalStates{}
class WeatherFromLocalStateSuccess extends WeatherFromLocalStates{
  late WeatherLocalModel weatherLocalModel;

  WeatherFromLocalStateSuccess(this.weatherLocalModel);
}
class WeatherFromLocalStateNotFound extends WeatherFromLocalStates{
  String? message;
  WeatherFromLocalStateNotFound({this.message});
}
class WeatherFromLocalStateError extends WeatherFromLocalStates{
  String? e;
  WeatherFromLocalStateError({this.e});
}
