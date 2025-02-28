class WeatherLocalModel {

  late final double? temp;
  late final num? humidity;
  late final double? windSpeed;
  late final String? cityName;

  WeatherLocalModel.fromJson(Map<String, dynamic> json){
    temp = json['temp'];
    humidity = json['humidity'];
    windSpeed = json['windSpeed'];
    cityName = json['cityName'];
  }
}



