import "dart:convert";
import "dart:ui";
import "package:flutter/material.dart";
import "package:weather_app/additional_info.dart";
import "package:weather_app/hourly_forcast.dart";
import "package:http/http.dart" as http;
import "package:weather_app/secrets.dart";

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    try {
      String cityName = "Dhaka";
      final res = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherMapApiKey",
        ),
      );

      final data = jsonDecode(res.body);

      if (data['cod'] != "200") {
        throw "An unexpected error occurred while fetching weather data. Please try again later.";
      }

      setState(() {
        temp = data['list'][0]['main']['temp'];
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App", style: TextStyle(fontSize: 25)),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: temp == 0
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  "${temp.toStringAsFixed(2)}°K",
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Icon(Icons.cloud, size: 64),
                                const SizedBox(height: 16),
                                Text(
                                  "Rain",
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Weather Forcasting",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HourlyForcastItems(
                          time: "03.00",
                          temperature: "301.12",
                          icon: Icons.cloud,
                        ),
                        HourlyForcastItems(
                          time: "04.00",
                          temperature: "302.45",
                          icon: Icons.cloud,
                        ),
                        HourlyForcastItems(
                          time: "05.00",
                          temperature: "303.78",
                          icon: Icons.cloud,
                        ),
                        HourlyForcastItems(
                          time: "06.00",
                          temperature: "305.11",
                          icon: Icons.cloud,
                        ),
                        HourlyForcastItems(
                          time: "07.00",
                          temperature: "306.44",
                          icon: Icons.cloud,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Additional Information",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInfo(
                        icon: Icons.water_drop,
                        label: "Humidity",
                        value: "94",
                      ),
                      AdditionalInfo(
                        icon: Icons.air,
                        label: "Wind Speed",
                        value: "15",
                      ),
                      AdditionalInfo(
                        icon: Icons.beach_access,
                        label: "Pressure",
                        value: "1000",
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
