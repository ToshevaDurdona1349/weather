//http://api.weatherapi.com/v1/forecast.json?key=22c51a5c93cb4155994174721230511&q=Tashkent&days=1&aqi=yes&alerts=no
import 'package:dio/dio.dart';
import 'package:weather_home_work/modal/day_time_weather.dart';
//http://api.weatherapi.com/v1/forecast.json?key=22c51a5c93cb4155994174721230511&q=London&days=1&aqi=yes&alerts=no
class DayTimeNetService{
  final Dio dio=Dio();
  Future<DayTimeWeather> soatbayWeather(String city)async{
    //&q=Tashkent&days=1&aqi=yes&alerts=no
    Response response=await dio.get("http://api.weatherapi.com/v1/forecast.json?key=22c51a5c93cb4155994174721230511",
    queryParameters: {
      'q':city,
      'days':3,
      'aqi':"yes",
      'alerts':'no'
    });
    DayTimeWeather dayTimeWeather=DayTimeWeather();
    dayTimeWeather= await DayTimeWeather.fromJson(response.data);
    return dayTimeWeather;
  }
}