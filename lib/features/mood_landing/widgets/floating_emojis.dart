import 'package:flutter/material.dart';

class FloatingEmojis extends StatelessWidget {
  const FloatingEmojis({super.key});

  Widget _buildFloatingEmoji(
    String assetPath,
    double top,
    double left,
    double rotationAngle,
    BuildContext context,
  ) {
    return Positioned(
      top: MediaQuery.of(context).size.height * top,
      left: MediaQuery.of(context).size.width * left,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 0.5),
        duration: const Duration(seconds: 5),
        builder: (context, double value, child) {
          return Transform.rotate(
            angle: rotationAngle,
            child: Opacity(opacity: value, child: child),
          );
        },
        child: Image.asset(
          assetPath,
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.width * 0.45,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildFloatingEmoji(
          'assets/images/overwhelmed.png',
          0.1,
          0.6,
          -0.4,
          context,
        ),
        _buildFloatingEmoji(
          'assets/images/angry.png',
          0.8,
          -0.1,
          -0.3,
          context,
        ),
        _buildFloatingEmoji('assets/images/money.png', 0.6, 0.7, -0.5, context),
        _buildFloatingEmoji('assets/images/sad.png', 0.2, -0.1, 0.5, context),
      ],
    );
  }
}
