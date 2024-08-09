import 'package:flutter/material.dart';

class AdditionalInfoItems extends StatelessWidget {
  final IconData icon;
  final String string;
  final String data;
  const AdditionalInfoItems({
    super.key,
    required this.icon,
    required this.string,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 64,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          string,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          data,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
