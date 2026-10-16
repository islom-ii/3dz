import 'package:flutter/material.dart';

import 'weather_data.dart';
import 'weather_state.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final List<String> _cities = ['Ош', 'Бишкек', 'Нарын'];

  String _selectedCity = 'Ош';
  TemperatureUnit _currentUnit = TemperatureUnit.celsius;

  String _formatTemperature(double temp, TemperatureUnit unit) {
    final converted = WeatherState.convert(temp, unit);
    final symbol = WeatherState.getUnitSymbol(unit);
    final formattedNum = converted.toStringAsFixed(0);

    if (converted > 0) {
      return '+$formattedNum $symbol';
    }
    return '$formattedNum $symbol';
  }

  @override
  Widget build(BuildContext context) {
    final weather = WeatherData.getWeatherForCity(_selectedCity);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Погода'),
        actions: [
          PopupMenuButton<TemperatureUnit>(
            initialValue: _currentUnit,
            onSelected: (unit) {
              setState(() {
                _currentUnit = unit;
              });
            },
            itemBuilder: (context) => TemperatureUnit.values.map((unit) {
              return PopupMenuItem(
                value: unit,
                child: Text(unit.name.toUpperCase()),
              );
            }).toList(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedCity,
              isExpanded: true,
              items: _cities.map((city) {
                return DropdownMenuItem(value: city, child: Text(city));
              }).toList(),
              onChanged: (newCity) {
                if (newCity != null) {
                  setState(() {
                    _selectedCity = newCity;
                  });
                }
              },
            ),
            const SizedBox(height: 32),
            if (weather != null) ...[
              Text(
                weather.name,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _formatTemperature(weather.temperature, _currentUnit),
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8),
              Text(weather.condition, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              Text('Влажность: ${weather.humidity}%'),
            ] else ...[
              const Text('Ошибка: Данные о погоде не найдены!'),
            ],
          ],
        ),
      ),
    );
  }
}
