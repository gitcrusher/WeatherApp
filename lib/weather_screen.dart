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
                    child: Padding(
                      padding: const EdgeInsets.only(
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
                          const SizedBox(
                            height: 16,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          const SizedBox(
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  //first card ------------>

                  //second card --------------->

                  HourlyForecastItems(),

                  //third card --------------->

                  HourlyForecastItems(),

                  //fourth card --------------->

                  HourlyForecastItems(),

                  // fifth card --------------->

                  HourlyForecastItems(),

                  //sixth card --------------->

                  HourlyForecastItems(),

                  //seventh card --------------->

                  HourlyForecastItems()
                ],
              ),
            ),
            SizedBox(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItems(),
                AdditionalInfoItems(),
                AdditionalInfoItems(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
