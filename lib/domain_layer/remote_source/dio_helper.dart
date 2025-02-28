//this class made with singleton logic to get one object of ( Dio ) in start point of our app in main
//this script made to Call all apis and talk with server side

import 'package:voiceschooltask/domain_layer/end_points/end_points.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();
  static Future init() async{
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout:  const Duration(seconds: 30),
      ),
    );
  }
  static Map<String,CancelToken> cancelTokens={};
  //this function to get data from apis
  static Future<Response>  getData({
    required String path,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token = '',
    bool isForceUpdate = false,
    CancelToken? cancelToken,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ',
      'Content-Type': 'application/json',
    };
    return await dio.get(
        path,
        queryParameters: query,
        cancelToken: cancelToken??cancelTokens[path]
    );
  }

  //this function to post data to apis
  static Future<Response> postData({
    required String path,
    required dynamic data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token = '',
    url,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ',
      'Accept': 'application/json',
    };

    return await dio.post(
      path,
      data: data,
      queryParameters: query,
    );
  }

  //this function to post data to apis
  static Future<Response> deleteData({
    required String path,
    required dynamic data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token = '',
    url,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ',
      'Accept': 'application/json',
    };

    return await dio.delete(
      path,
      data: data,
      queryParameters: query,
    );
  }


  //this function to put data to apis
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token = '',
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ',
      'Content-Type': 'application/json',
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }





}


