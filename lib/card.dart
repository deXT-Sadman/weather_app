import 'package:flutter/material.dart';

class HourlyForcastItems extends StatelessWidget {
  const HourlyForcastItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: EdgeInsets.all(8),
        child: const Column(
          children: [
            Text(
              "03.00",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Icon(Icons.cloud, size: 32),
            SizedBox(height: 8),
            Text("301.12"),
          ],
        ),
      ),
    );
  }
}
