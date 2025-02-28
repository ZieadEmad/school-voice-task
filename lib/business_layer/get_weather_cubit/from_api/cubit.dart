import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voiceschooltask/business_layer/get_weather_cubit/from_api/states.dart';
import 'package:voiceschooltask/core_layer/constants/apis_fail_constants.dart';
import 'package:voiceschooltask/core_layer/helpers/compare_weather_data_api_with_local.dart';
import 'package:voiceschooltask/data_layer/data_models/weather_model/weather_api_model.dart';
import 'package:voiceschooltask/data_layer/data_models/weather_model/weather_local_model.dart';
import 'package:voiceschooltask/domain_layer/end_points/end_points.dart';
import 'package:voiceschooltask/domain_layer/local_source/hive_helper.dart';
import 'package:voiceschooltask/domain_layer/remote_source/dio_helper.dart';

class WeatherFromApiCubit extends Cubit<WeatherFromApiStates> {
  WeatherFromApiCubit() : super(WeatherFromApiStateInitial());

  static WeatherFromApiCubit get(context) => BlocProvider.of(context);

  late WeatherApiModel weatherApiModel;
  late WeatherLocalModel weatherLocalModel;
//this function to get weather data in home screen from api and insert it or update it to data base
getWeatherDataByCityNameFromApi(String cityName){
  emit(WeatherFromApiStateLoading());
  DioHelper.getData(
    path: getWeatherEndPoint,
    query: {
      "q":cityName.toLowerCase(),
      "appid":appId
    }
  ).then((value)async{
    weatherApiModel = WeatherApiModel.fromJson(value.data);
    cityName = weatherApiModel.cityName.toString();
    var weather = await HiveHelper.getData(boxName: 'weathers', key: cityName);
    if(weather!=null){
        weatherLocalModel = WeatherLocalModel.fromJson((weather).cast<String, dynamic>());
      if(compareDataFromApiWithLocal(weatherApiModel: weatherApiModel, weatherLocalModel: weatherLocalModel)){
        await HiveHelper.updateData(
          boxName: 'weathers',
          key: cityName,
          newValue: {
            'temp': weatherApiModel.weatherData?.temp,
            'humidity': weatherApiModel.weatherData?.humidity,
            'windSpeed': weatherApiModel.wind?.speed,
            'cityName': weatherApiModel.cityName,
          },
        );
      }
    }
    else{
      await HiveHelper.insertData(
        boxName: 'weathers',
        key: cityName,
        value: {
          'temp': weatherApiModel.weatherData?.temp,
          'humidity': weatherApiModel.weatherData?.humidity,
          'windSpeed': weatherApiModel.wind?.speed,
          'cityName': weatherApiModel.cityName,
        },
      );
    }
    emit(WeatherFromApiStateSuccess(cityName: cityName));
  }).catchError((e){
    if (e is DioException) {
      if (e.error is SocketException|| e.type == DioExceptionType.receiveTimeout) {
        emit(WeatherFromApiStateNetworkError(e: networkConnectionMessage));
      }
      else if (e.response?.statusCode == 404){
        emit(WeatherFromApiStateNotFound(message: countryNotFoundMessage));
      }
      else {
        emit(WeatherFromApiStateError(e:  e.toString()));
      }
    } else {
      emit(WeatherFromApiStateError(e:  e.toString()));
    }
  });
}

}

