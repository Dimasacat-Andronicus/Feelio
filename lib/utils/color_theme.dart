import 'package:flutter/material.dart';

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  primary: Color(0xFFFFFFFF),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF1A1A1A),
  onPrimaryContainer: Color(0xFFE0E0E0), // Soft Gray (Subtle Text)

  secondary: Color(0xFF8D8D8D), // Charcoal Black (UI Highlights)
  onSecondary: Color(0xFFF5F5F5), // Off-White (Accent Text)
  secondaryContainer: Color(0xFF424242), // Graphite Gray (Button Backgrounds)
  onSecondaryContainer: Color(0xFFD0D0D0), // Muted Gray

  tertiary: Color(0xFFFF4343), // Pure White (UI Elements)
  surface: Color(0xFF121212), // Deep Matte Black (Base UI Layer)
  onSurface: Color(0xFFCFCFCF), // Subtle Gray (Smooth Contrast)

  error: Color(0xFFB00020), // Muted Red (Warnings)
  onError: Color(0xFFFFFFFF), // White for readability
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  primary: Color(0xFF000000),
  onPrimary: Color(0xFF000000), // True Black for contrast
  primaryContainer: Color(0xFFE0E0E0), // Soft Gray (Backgrounds)
  onPrimaryContainer: Color(0xFF1A1A1A), // Charcoal Black (Accents)

  secondary: Color.fromARGB(255, 136, 136, 136), // Muted Silver (UI Highlights)
  onSecondary: Color(0x28282B), // Black for clarity
  secondaryContainer: Color(0xFFDADADA), // Pale Gray (Buttons & Cards)
  onSecondaryContainer: Color(0xFF262626), // Deep Gray for Strong Contrast

  tertiary: Color(0xFFFF4343), // Dark Gray (UI Elements)
  surface: Color(0xFFF5F5F5), // Soft White (Cards & UI elements)
  onSurface: Color(0xFF121212), // Black (Readable Text)

  error: Color(0xFFD32F2F), // Red for alerts
  onError: Color(0xFFFFFFFF), // White for readability
);
