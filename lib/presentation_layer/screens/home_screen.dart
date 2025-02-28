import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voiceschooltask/business_layer/get_weather_cubit/from_api/cubit.dart';
import 'package:voiceschooltask/business_layer/get_weather_cubit/from_api/states.dart';
import 'package:voiceschooltask/core_layer/helpers/navigators.dart';
import 'package:voiceschooltask/presentation_layer/screens/home_details_screen.dart';
import 'package:voiceschooltask/presentation_layer/widgets/shared_widgets/button.dart';
import 'package:voiceschooltask/presentation_layer/widgets/shared_widgets/overlay_loading.dart';
import 'package:voiceschooltask/presentation_layer/widgets/shared_widgets/show_snackbar_widget.dart';
import 'package:voiceschooltask/presentation_layer/widgets/shared_widgets/text_form_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController weatherFieldController;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    weatherFieldController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> WeatherFromApiCubit(),
      child: BlocConsumer<WeatherFromApiCubit,WeatherFromApiStates>(
        listener: (context,state){
          if(state is WeatherFromApiStateLoading){
            showLoadingOverlay(context);
          }
          if(state is! WeatherFromApiStateLoading){
            Navigator.pop(context);
          }
          if(state is WeatherFromApiStateSuccess){
            navigateTo(context, HomeDetailsScreen(cityName: state.cityName.toString()));
          }
          if(state is WeatherFromApiStateNotFound){
            return showSnackBar(context, state.message.toString());
          }
          if(state is WeatherFromApiStateError){
            return showSnackBar(context, state.e.toString());
          }
          if(state is WeatherFromApiStateNetworkError){
            return showSnackBar(context, state.e.toString());
          }
        },
        builder: (context,state){
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormFieldWidget(formFieldController: weatherFieldController,hintText: 'City Name',formKey: formKey),
                  const SizedBox(height: 32,),
                  ButtonWidget(onPress: (){
                    if(formKey.currentState!.validate()){
                      WeatherFromApiCubit.get(context).getWeatherDataByCityNameFromApi(weatherFieldController.text);
                    }
                  }, buttonColor: Colors.brown, borderRadiusValue: 8, buttonTitle: 'Get Details', buttonTitleColor:  Colors.white)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
