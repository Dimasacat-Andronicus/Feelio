import 'package:flutter/material.dart';

Color getMoodColor(String mood) {
  switch (mood) {
    case 'Happy':
      return Colors.yellow[700]!;
    case 'Sad':
      return Colors.blue[800]!;
    case 'Angry':
      return Colors.red[800]!;
    case 'Nervous':
      return Colors.orange[800]!;
    case 'Sleepy':
      return Colors.purple[800]!;
    case 'Curious':
      return Colors.green[800]!;
    case 'Overthinking':
      return Colors.brown[800]!;
    case 'Wow':
      return Colors.teal[800]!;
    case 'Cool':
      return Colors.cyan[800]!;
    default:
      return Colors.grey[800]!;
  }
}