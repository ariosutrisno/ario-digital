import 'package:flutter/material.dart';

abstract final class SiteColors {
  // Low-saturation surfaces; restrained blue is reserved for interactive accents.
  static const brandBlue = Color(0xFF4C6178);
  static const skyBlue = Color(0xFF7D8894);
  static const cyan = Color(0xFF8A9698);
  static const highlight = Color(0xFFDDDCD5);
  static const background = Color(0xFFEEEDE9);
  static const backgroundAlt = Color(0xFFE7E6E1);
  static const surface = Color(0xFFF5F4F0);
  static const accentSurface = Color(0xFFE3E6E5);
  static const cyanSurface = Color(0xFFE8E9E5);
  static const primary = Color(0xFF465D76);
  static const secondary = Color(0xFF58616A);
  static const text = Color(0xFF35383B);
  static const muted = Color(0xFF62666A);
  static const line = Color(0xFFCFD0CA);
  static const success = Color(0xFF53665B);
  static const onPrimary = Color(0xFFF5F4F0);
}

abstract final class SiteTheme {
  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: SiteColors.background,
    fontFamily: 'DM Sans',
    colorScheme: const ColorScheme.light(
      onPrimary: SiteColors.onPrimary,
      primary: SiteColors.primary,
      secondary: SiteColors.secondary,
      surface: SiteColors.surface,
      onSurface: SiteColors.text,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w700,
        color: SiteColors.text,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w700,
        color: SiteColors.text,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w700,
        color: SiteColors.text,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w700,
        color: SiteColors.text,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w700,
        color: SiteColors.text,
      ),
      bodyLarge: TextStyle(color: SiteColors.muted, height: 1.7),
      bodyMedium: TextStyle(color: SiteColors.muted, height: 1.65),
    ),
    dividerColor: SiteColors.line,
    useMaterial3: true,
  );
}
