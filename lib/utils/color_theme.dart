import 'package:flutter/material.dart';

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  primary: Color(0xFF81C784),
  onPrimary: Color(0xFFE0E0E0), // Soft Gray (Text Contrast)
  primaryContainer: Color(0xFF2C2C2C), // Dark Charcoal (Secondary Layer)
  onPrimaryContainer: Color(0xFFFAFAFA), // Off-White (Subtle Text)

  secondary: Color(0xFF424242), // Graphite Gray (UI Highlights)
  onSecondary: Color(0xFFBDBDBD), // Cool Silver (Accent Text)
  secondaryContainer: Color(0xFF616161), // Steel Gray (Button Backgrounds)
  onSecondaryContainer: Color(0xFFF5F5F5),

  tertiary: Color(0xFFFFFFFF), // Slate Gray (UI Elements)
  // Soft White (Readable Text)
  // background: Color(0xFF121212), // True Black (Deep Background)
  // onBackground: Color(0xFFE0E0E0), // Light Gray (High Readability)
  surface: Color(0xFF1A1A1A), // Deep Matte Black (Base UI Layer)
  onSurface: Color(0xFFCFCFCF), // Subtle Gray (Smooth Contrast)

  error: Color(0xFFCF6679), // Muted Red (Warnings)
  onError: Color(0xFFB00020),
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  primary: Color(0xFF2C2C2C), // Soft Green (Base Primary)
  onPrimary: Color(0xFFFFFFFF), // White for text contrast
  primaryContainer: Color(0xFFC8E6C9), // Light Pastel Green (Backgrounds)
  onPrimaryContainer: Color(0xFF1B5E20), // Deep Green for accents

  secondary: Color(0xFF66BB6A), // Leafy Green (UI Highlights)
  onSecondary: Color(0xFFFFFFFF), // White for clarity
  secondaryContainer: Color(0xFFAED581), // Muted Lime Green (Buttons & Cards)
  onSecondaryContainer: Color(0xFF33691E), // Earthy Green (Strong Contrast)

  tertiary: Color(0xFF21212B), // Bright Green (UI Elements)
  // background: Color(0xFFF1F8E9), // Very Light Green (Softest Background)
  // onBackground: Color(0xFF2E7D32), // Strong Green Text
  surface: Color(0xFFDCEDC8), // Gentle Green Tone (Cards & UI elements)
  onSurface: Color(0xFF388E3C), // Medium Green (Readable Text)

  error: Color(0xFFD32F2F), // Red for alerts
  onError: Color(0xFFFFFFFF), // White for readability
);
