import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/Hourly_forecast.dart';
import 'package:weather_app/additional_info.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // main card -------->

            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      child: Column(
                        children: [
                          Text(
                            '300°F',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Rain',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //weather forecast cards -------->

            const Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItems(time: '09:00', value: '301.17'),
                  HourlyForecastItems(time: '12:00', value: '301.54'),
                  HourlyForecastItems(time: '15:00', value: '301.11'),
                  HourlyForecastItems(time: '18:00', value: '301.95'),
                  HourlyForecastItems(time: '20:00', value: '301.03'),
                  HourlyForecastItems(time: '22:00', value: '301.34')
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            //additional information -------->
            const Text(
              'Additional Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AdditionalInfoItems(
                    icon: Icons.water_drop,
                    string: 'Humidity',
                    data: '91',
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  AdditionalInfoItems(
                    icon: Icons.air,
                    string: 'Wind Speed',
                    data: '7.67',
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  AdditionalInfoItems(
                    icon: Icons.beach_access,
                    string: 'Pressure',
                    data: '1006',
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  AdditionalInfoItems(
                    icon: Icons.sunny,
                    string: 'Day Temp.',
                    data: '34',
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  AdditionalInfoItems(
                    icon: Icons.nightlight,
                    string: 'Night Temp',
                    data: '23',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
