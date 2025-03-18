import 'package:voiceschooltask/data_layer/data_models/weather_model/weather_local_model.dart';

abstract class WeatherFromApiStates{}

class WeatherFromApiStateInitial extends WeatherFromApiStates{}
class WeatherFromApiStateLoading extends WeatherFromApiStates{}
class WeatherFromApiStateSuccessWithNoDifference extends WeatherFromApiStates{
  String? cityName;
  WeatherFromApiStateSuccessWithNoDifference({this.cityName});
}
class WeatherFromApiStateSuccessWithDifference extends WeatherFromApiStates{
  String? cityName;
  WeatherLocalModel weatherLocalModel;
  WeatherFromApiStateSuccessWithDifference({required this.cityName,required this.weatherLocalModel});
}
// class WeatherFromApiStateSuccess extends WeatherFromApiStates{
//   String? cityName;
//   WeatherFromApiStateSuccess({this.cityName});
// }
class WeatherFromApiStateNotFound extends WeatherFromApiStates{
  String? message;
  WeatherFromApiStateNotFound({this.message});
}
class WeatherFromApiStateError extends WeatherFromApiStates{
  String? e;
  WeatherFromApiStateError({this.e});
}
class WeatherFromApiStateNetworkError extends WeatherFromApiStates{
  String? e;
  WeatherFromApiStateNetworkError({this.e});
}