
import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 3',
      debugShowCheckedModeBanner: false,
      home: const WeatherPage(),
    );
  }
}

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: const Text(
          'Activity 3 - A2(ILGX3)_YTAC_SHIELA ACHELLE MAE',
        ),
        backgroundColor: const Color(0xFFFFF8F0),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weather header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF795708),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.white,
                    size: 60,
                  ),
                  SizedBox(width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cabadbaran City',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Sunny, 31°C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Weather statistics
            Row(
              children: [
                Expanded(
                  child: StatBox(
                    icon: Icons.water_drop,
                    label: 'Humidity',
                    value: '70%',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatBox(
                    icon: Icons.air,
                    label: 'Wind',
                    value: '12 km/h',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatBox(
                    icon: Icons.umbrella,
                    label: 'Rain',
                    value: '10%',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatBox(
                    icon: Icons.thermostat,
                    label: 'Feels like',
                    value: '35°',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // Hourly forecast
            const Text(
              'Next Hours',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HourForecast(
                  time: '1 PM',
                  icon: Icons.wb_sunny,
                  temperature: '32°',
                ),
                HourForecast(
                  time: '2 PM',
                  icon: Icons.cloud,
                  temperature: '31°',
                ),
                HourForecast(
                  time: '3 PM',
                  icon: Icons.thunderstorm,
                  temperature: '28°',
                ),
                HourForecast(
                  time: '4 PM',
                  icon: Icons.cloud,
                  temperature: '27°',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable weather statistics box
class StatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const StatBox({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF7E1BA),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFF795708),
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// Reusable hourly forecast item
class HourForecast extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;

  const HourForecast({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(time),
        const SizedBox(height: 10),
        Icon(icon, size: 30),
        const SizedBox(height: 10),
        Text(
          temperature,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
