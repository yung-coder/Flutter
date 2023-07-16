import 'package:flutter/material.dart';

class Forcast extends StatelessWidget {
  final String time;
  final String tempearture;
  final IconData icon;
  const Forcast({
    super.key,
    required this.time,
    required this.tempearture,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              tempearture,
            ),
          ],
        ),
      ),
    );
  }
}
