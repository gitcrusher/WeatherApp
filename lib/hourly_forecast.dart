import 'package:flutter/material.dart';

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
