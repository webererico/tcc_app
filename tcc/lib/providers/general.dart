

import 'package:flutter/material.dart';
import 'package:tcc/services/weather.dart';

class General extends ChangeNotifier{


    getCurrentWeather(){
      Weather().getWeather('Santa Maria', 'br');
    }
}