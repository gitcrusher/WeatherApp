import 'dart:ui';

import 'package:flutter/material.dart';

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
            )
          ],
        ),
      ),
    );
  }
}

class HourlyForecastItems extends StatelessWidget {
  const HourlyForecastItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Text(
              '03:00',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              Icons.cloud,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '300.12',
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
