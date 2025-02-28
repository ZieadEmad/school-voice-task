import 'package:voiceschooltask/data_layer/data_models/weather_model/weather_api_model.dart';
import 'package:voiceschooltask/data_layer/data_models/weather_model/weather_local_model.dart';


//this helper made for compare data of 2 models first one get from apis | second one get from local database
bool compareDataFromApiWithLocal({required WeatherApiModel weatherApiModel,required WeatherLocalModel weatherLocalModel}){
  if (weatherApiModel.weatherData?.humidity != weatherLocalModel.humidity){return true;}
  else if (weatherApiModel.weatherData?.temp != weatherLocalModel.temp){return true;}
  else if (weatherApiModel.wind?.speed != weatherLocalModel.windSpeed){return true;}
  else {
    return false;
  }
}