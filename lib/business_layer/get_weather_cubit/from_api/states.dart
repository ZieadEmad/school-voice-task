abstract class WeatherFromApiStates{}

class WeatherFromApiStateInitial extends WeatherFromApiStates{}
class WeatherFromApiStateLoading extends WeatherFromApiStates{}
class WeatherFromApiStateSuccess extends WeatherFromApiStates{
  String? cityName;
  WeatherFromApiStateSuccess({this.cityName});
}
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