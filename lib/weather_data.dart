import 'city_model.dart';

class WeatherData {
  static final Map<String, CityWeather> _fakeData = {
    'Ош': CityWeather(
      name: 'Ош',
      country: 'Кыргызстан',
      temperature: 27.0,
      condition: 'Солнечно',
      humidity: 30,
      windSpeed: 4.0,
    ),
    'Бишкек': CityWeather(
      name: 'Бишкек',
      country: 'Кыргызстан',
      temperature: 20.0,
      condition: 'Облачно',
      humidity: 45,
      windSpeed: 5.0,
    ),
    'Нарын': CityWeather(
      name: 'Нарын',
      country: 'Кыргызстан',
      temperature: -5.0,
      condition: 'Снег',
      humidity: 70,
      windSpeed: 6.0,
    ),
  };

  static CityWeather? getWeatherForCity(String cityName) {
    return _fakeData[cityName];
  }
}
