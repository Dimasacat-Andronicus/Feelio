import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, textAlign: TextAlign.center),
      backgroundColor: color,
      duration: Duration(seconds: 1),
    ),
  );
}
