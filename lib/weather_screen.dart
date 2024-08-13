import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/Hourly_forecast.dart';
import 'package:weather_app/additional_info.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=$openWeatherKey',
        ),
      );
      final data = jsonDecode(res.body);

      if (int.parse(data['cod']) != 200) {
        throw 'an error occured';
      }
      return data;

      // data['list'][0]['main']['temp'];
    } catch (e) {
      throw e.toString();
    }
  }

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
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final data = snapshot.data!;

          final currentWeatherData = data['list'][0];

          final currentTemp = currentWeatherData['main']['temp'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final currentHumidity = currentWeatherData['main']['humidity'];
          final currentWindSpeed = currentWeatherData['wind']['speed'];
          final currentPressure = currentWeatherData['main']['pressure'];
          final currentSeaLevel = currentWeatherData['main']['sea_level'];
          final currentFeelsLike = currentWeatherData['main']['feels_like'];

          return Padding(
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
                          padding: EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                          ),
                          child: Column(
                            children: [
                              Text(
                                '$currentTemp K',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Icon(
                                currentSky == 'Clouds' || currentSky == 'Rain'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 64,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                currentSky,
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
                  'Hourly Forecast',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       for (int i = 0; i < 5; i++)
                //         HourlyForecastItems(
                //           time: data['list'][i + 1]['dt'].toString(),
                //           icons: data['list'][i + 1]['weather'][0]['main'] ==
                //                       'Clouds' ||
                //                   data['list'][i + 1]['weather'][0]['main'] ==
                //                       'Rain'
                //               ? Icons.cloud
                //               : Icons.sunny,
                //           temperature:
                //               data['list'][i + 1]['main']['temp'].toString() +
                //                   ' K',
                //         ),
                //     ],
                //   ),
                // ),

                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final hourlyForecast = data['list'][index + 1];
                      final hourlySky =
                          data['list'][index + 1]['weather'][0]['main'];
                      final hourlyTemperature =
                          hourlyForecast['main']['temp'].toString();
                      return HourlyForecastItems(
                        time: hourlyForecast['dt_txt'].toString(),
                        temperature: hourlyTemperature,
                        icons: hourlySky == 'Clouds' || hourlySky == 'Rain'
                            ? Icons.cloud
                            : Icons.sunny,
                      );
                    },
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AdditionalInfoItems(
                        icon: Icons.water_drop,
                        string: 'Humidity',
                        data: currentHumidity.toString(),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      AdditionalInfoItems(
                        icon: Icons.air,
                        string: 'Wind Speed',
                        data: '$currentWindSpeed',
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      AdditionalInfoItems(
                        icon: Icons.beach_access,
                        string: 'Pressure',
                        data: '$currentPressure',
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      AdditionalInfoItems(
                        icon: Icons.water,
                        string: 'Sea Level',
                        data: '$currentSeaLevel',
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      AdditionalInfoItems(
                        icon: Icons.emoji_emotions,
                        string: 'Feels Like',
                        data: '$currentFeelsLike',
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
