import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: 1.0,
        child: Stack(
          children: [
            Text(
              "Feelio",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.dynaPuff().fontFamily,
                foreground:
                    Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.black,
              ),
            ),
            Text(
              "Feelio",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.dynaPuff().fontFamily,
                color: Colors.amberAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
