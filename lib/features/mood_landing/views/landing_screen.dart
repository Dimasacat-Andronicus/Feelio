import 'package:feelio/features/mood_landing/widgets/background_gradient.dart';
import 'package:feelio/features/mood_landing/widgets/floating_emojis.dart';
import 'package:feelio/features/mood_landing/widgets/slide_button.dart';
import 'package:feelio/features/mood_landing/widgets/title_text.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BackgroundGradient(),
          FloatingEmojis(),
          TitleText(),
          SlideToStartButton(),
        ],
      ),
    );
  }
}
