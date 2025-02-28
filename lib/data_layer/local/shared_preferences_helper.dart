import 'package:shared_preferences/shared_preferences.dart';

//this class made with singleton logic to get one object of ( Shared Preferences ) in start point of our app in main
class Preferences {
  static late final SharedPreferences instance;

//this function to assign shared preferences instance to our global variable
  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }


//this function to save api token to use it in domain layer in our script
  Future<bool> saveApiToken(String apiToken) => Preferences.instance.setString('apiToken', apiToken);

//this function to remove value of api token
  Future<bool> removeApiToken() => Preferences.instance.remove('apiToken');

//this function to get value of api token
  String? getApiTokenValue() => Preferences.instance.getString('apiToken');

}


