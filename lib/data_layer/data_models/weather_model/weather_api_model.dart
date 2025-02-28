class WeatherApiModel {
  late final WeatherData? weatherData;
  late final WindData? wind;
  late final String? cityName;

  WeatherApiModel.fromJson(Map<String, dynamic> json){
    weatherData = WeatherData.fromJson(json['main']);
    wind = WindData.fromJson(json['wind']);
    cityName = json['name'];

  }
}



class WeatherData {
  late final double? temp;
  late final int? humidity;

  WeatherData.fromJson(Map<String, dynamic> json){
    temp = json['temp'] ;
    humidity = json['humidity'];

  }
}

class WindData {
  late final double? speed;
  WindData.fromJson(Map<String, dynamic> json){
    speed = json['speed'];
  }

}

