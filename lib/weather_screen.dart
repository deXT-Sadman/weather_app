import "dart:ui";
import "package:flutter/material.dart";
import "package:weather_app/additional_info.dart";
import "package:weather_app/hourly_forcast.dart";

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App", style: TextStyle(fontSize: 25)),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Padding(
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
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "300°K",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Icon(Icons.cloud, size: 64),
                          SizedBox(height: 16),
                          Text("Rain", style: TextStyle(fontSize: 20)),
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
