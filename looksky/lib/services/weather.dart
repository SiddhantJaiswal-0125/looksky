import 'package:looksky/services/location.dart';
import 'package:looksky/services/networking.dart';

const apikey = 'aacd6a6cfc11b6c319910e5e2aa14ed6';
const openWeatherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  double latitude, longitute;

  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric';
    //temp in celcius
    Networkhelper _networkhelper = Networkhelper(url);
    var weatherdata = await _networkhelper.getData();
    return weatherdata;
  }

  Future<dynamic> getLocationWeather() async {
    location _location = location();
    await _location.getCurrentLocation();
    latitude = _location.latitude;
    longitute = _location.longitude;
    //temp in celcius
    Networkhelper networkhelper = Networkhelper(
        '$openWeatherMapUrl?lat=$latitude&lon=$longitute&appid=$apikey&units=metric');
    var weatherData = await networkhelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 15) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
