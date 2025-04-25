import 'package:flutter/material.dart';

Color getMoodColor(String mood) {
  switch (mood) {
    case 'Happy':
      return Colors.yellow[600]!;
    case 'Sad':
      return Colors.indigo[700]!;
    case 'Angry':
      return Colors.red[700]!;
    case 'Nervous':
      return Colors.deepOrange[600]!;
    case 'Sleepy':
      return Colors.deepPurple[600]!;
    case 'Curious':
      return Colors.lime[700]!;
    case 'Overthinking':
      return Colors.brown[600]!;
    case 'Wow':
      return Colors.amber[600]!;
    case 'Cool':
      return Colors.cyan[400]!;
    default:
      return Colors.grey[500]!;
  }
}