

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tcc/assets/keys.dart';

class Weather{ 
  Dio _dio;

  getWeather(String city, String country) async {
    try{
      var result = await  _dio.get('api.openweathermap.org/data/2.5/weather?q=$city,$country&appid=$weatherAPIKey');
      return jsonDecode(result.data)['main']['tempo'];
    } catch (e){
      return e;
    }
    

  }
  
}