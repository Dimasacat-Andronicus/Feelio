import 'package:feelio/utils/date.dart';
import 'package:flutter/material.dart';

class DateInfo extends StatelessWidget {
  const DateInfo({super.key, required this.date, required this.colorTheme});

  final DateTime date;
  final ColorScheme colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          monthName(date.month),
          style: TextStyle(
            fontSize: 14,
            color: colorTheme.tertiary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${date.day}',
          style: TextStyle(
            fontSize: 16,
            color: colorTheme.tertiary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
