import 'package:flutter/material.dart';

class ErrorMoodWidget extends StatelessWidget {
  const ErrorMoodWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Text(
          errorMessage,
          style: const TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
    );
  }
}
