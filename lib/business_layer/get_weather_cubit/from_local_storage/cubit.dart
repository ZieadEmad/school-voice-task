
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voiceschooltask/business_layer/get_weather_cubit/from_local_storage/states.dart';
import 'package:voiceschooltask/data_layer/data_models/weather_model/weather_local_model.dart';
import 'package:voiceschooltask/domain_layer/local_source/hive_helper.dart';

class WeatherFromLocalCubit extends Cubit<WeatherFromLocalStates> {
  WeatherFromLocalCubit() : super(WeatherFromLocalStateInitial());
  static WeatherFromLocalCubit get(context) => BlocProvider.of(context);
  late WeatherLocalModel weatherLocalModel;
//this function to get weather data from hive database we use it in home details screen
getWeatherDataByCityNameFromLocal(String cityName)async{
  emit(WeatherFromLocalStateLoading());
  var weather = await HiveHelper.getData(boxName: 'weathers', key: cityName);
  if(weather!=null){
    weatherLocalModel = WeatherLocalModel.fromJson((weather as Map).cast<String, dynamic>());
    emit(WeatherFromLocalStateSuccess(weatherLocalModel));
  }
  else{
   emit(WeatherFromLocalStateNotFound());
  }
}

}