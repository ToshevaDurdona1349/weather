import 'package:dio/dio.dart';

import '../modal/model_class.dart';
//http://api.weatherapi.com/v1/current.json?key=22c51a5c93cb4155994174721230511&q=Tashkent&aqi=yes
//&q=Tashkent&aqi=yes QueryParametrni ichiga kirib ketadi
class NetServiced{
  Dio _dio=Dio();
  Future<CurrentWeatherData> getCurrWeath(String shaxar)async{
    Response response= await _dio.get("http://api.weatherapi.com/v1/current.json?key=22c51a5c93cb4155994174721230511",
    queryParameters: {
      'q': shaxar,
      'aqi':'yes'
    });

    CurrentWeatherData currentWeatherData=CurrentWeatherData();
    currentWeatherData=await CurrentWeatherData.fromJson(response.data);
    // ModelClassdan olingan abectimizga internetdan kelgan jsonni tenglaymiz
    return currentWeatherData;

  }
}