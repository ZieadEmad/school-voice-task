import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voiceschooltask/data_layer/local/shared_preferences_helper.dart';
import 'package:voiceschooltask/domain_layer/local_source/hive_helper.dart';
import 'package:voiceschooltask/domain_layer/remote_source/dio_helper.dart';
import 'package:voiceschooltask/presentation_layer/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.init();
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  await Future.wait([Preferences.init(),DioHelper.init()]);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Voice Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}


