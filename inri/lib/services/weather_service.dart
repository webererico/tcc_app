import 'package:inri/constants/variables.dart';
import 'package:weather/weather.dart';

class WeatherService {
  WeatherFactory wf = WeatherFactory(weatherApiKey);
  double lat = -29.712258;
  double lon = -53.719705;

  Future<Weather> getWeather() async {
    return wf.currentWeatherByLocation(lat, lon);
  }
}
