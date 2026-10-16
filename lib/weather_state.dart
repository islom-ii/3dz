enum TemperatureUnit { celsius, fahrenheit, kelvin }

class WeatherState {
  final TemperatureUnit unit;

  const WeatherState({this.unit = TemperatureUnit.celsius});

  static double convert(double celsius, TemperatureUnit unit) {
    switch (unit) {
      case TemperatureUnit.celsius:
        return celsius;
      case TemperatureUnit.fahrenheit:
        return (celsius * 9 / 5) + 32;
      case TemperatureUnit.kelvin:
        return celsius + 273;
    }
  }

  static String getUnitSymbol(TemperatureUnit unit) {
    switch (unit) {
      case TemperatureUnit.celsius:
        return '°C';
      case TemperatureUnit.fahrenheit:
        return '°F';
      case TemperatureUnit.kelvin:
        return 'K';
    }
  }
}
