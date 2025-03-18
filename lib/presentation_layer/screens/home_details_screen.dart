
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voiceschooltask/business_layer/get_weather_cubit/from_local_storage/cubit.dart';
import 'package:voiceschooltask/business_layer/get_weather_cubit/from_local_storage/states.dart';
import 'package:voiceschooltask/core_layer/helpers/background_color_handler.dart';
import 'package:voiceschooltask/core_layer/helpers/convert_from_kelvin_to_celsius.dart';
import 'package:voiceschooltask/data_layer/data_models/weather_model/weather_local_model.dart';
import 'package:voiceschooltask/presentation_layer/widgets/screens_widgets/home_details_screen_widgets/error_widget.dart';
import 'package:voiceschooltask/presentation_layer/widgets/screens_widgets/home_details_screen_widgets/loading_widget.dart';
import 'package:voiceschooltask/presentation_layer/widgets/screens_widgets/home_details_screen_widgets/success_item_widget.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key,required this.cityName,this.weatherLocalModel});
  final String cityName ;
  final WeatherLocalModel? weatherLocalModel ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Full Details',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
      ),
      body: BlocProvider(
        create: (context)=> WeatherFromLocalCubit()..getWeatherDataByCityNameFromLocal(cityName),
        child: BlocBuilder<WeatherFromLocalCubit,WeatherFromLocalStates>(
          builder: (context,state){
            if(state is WeatherFromLocalStateLoading){
              return const HomeDetailsLoadingWidget();
            }
            if(state is WeatherFromLocalStateSuccess){
              return  Container(
                color: backgroundHandler(kelvinToCelsius(state.weatherLocalModel.temp)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SuccessItemWidget(newValue: state.weatherLocalModel.cityName.toString(), title: 'City',oldValue: weatherLocalModel?.cityName,),
                    const SizedBox(height: 20,),
                    SuccessItemWidget(newValue: '${kelvinToCelsius(state.weatherLocalModel.temp).toString()}°', title: 'Temperature',oldValue:weatherLocalModel?.temp!=null? '${kelvinToCelsius(weatherLocalModel?.temp).toString()}°':null,),
                    const SizedBox(height: 20,),
                    SuccessItemWidget(newValue: state.weatherLocalModel.humidity.toString(), title: 'Humidity',oldValue:weatherLocalModel?.humidity?.toString(),),
                    const SizedBox(height: 20,),
                    SuccessItemWidget(newValue: state.weatherLocalModel.windSpeed.toString(), title: 'Wind Speed',oldValue: weatherLocalModel?.windSpeed.toString(),),
                  ],
                ),
              );
            }
            if(state is WeatherFromLocalStateError){
              return HomeDetailsErrorWidget(error: state.e.toString(),);
            }
            return const SizedBox();

          },
        ),
      ),
    );
  }
}
