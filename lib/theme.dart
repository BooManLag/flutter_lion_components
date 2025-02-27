import 'package:flutter/material.dart';

/// Custom ThemeData based on Lion Web Components design tokens.
class AppTheme {
  // **Color Tokens** – as Flutter Color constants
  static const Color primaryColor    = Color(0xFF1976D2); // Primary brand color (blue)&#8203;:contentReference[oaicite:12]{index=12}
  static const Color secondaryColor  = Color(0xFF9C27B0); // Secondary brand color (purple)
  static const Color backgroundColor = Color(0xFFFFFFFF); // Background surface color (white)
  static const Color surfaceColor    = Color(0xFFFFFFFF); // Surface color for cards, etc. (also white here)
  static const Color textColorPrimary   = Color(0xDE000000); // Primary text on background (87% black)&#8203;:contentReference[oaicite:13]{index=13}
  static const Color textColorSecondary = Color(0x8A000000); // Secondary text on background (54% black)
  static const Color textColorOnPrimary = Color(0xFFFFFFFF); // Text color on primary (white)&#8203;:contentReference[oaicite:14]{index=14}

  // **Typography Tokens** – font family and sizes
  static const String fontFamilyBase = "Roboto"; // Base font family (e.g. Roboto or any sans-serif)
  static const double fontSizeH1   = 32.0; // Heading 1 size
  static const double fontSizeH2   = 24.0; // Heading 2 size
  static const double fontSizeBody = 16.0; // Body text size
  static const double fontSizeSmall= 14.0; // Small text (caption/button)

  // **Spacing Tokens** – spacing scale (in logical pixels)
  static const double spacingXS = 4.0;
  static const double spacingSM = 8.0;
  static const double spacingMD = 16.0;
  static const double spacingLG = 24.0;
  static const double spacingXL = 32.0;

  /// Constructed ThemeData using the above tokens
  static ThemeData get themeData {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: textColorOnPrimary,
        secondary: secondaryColor,
        onSecondary: textColorPrimary,
        background: backgroundColor,
        onBackground: textColorPrimary,
        surface: surfaceColor,
        onSurface: textColorPrimary,
        error: Colors.redAccent,
        onError: Colors.white,
      ),
      fontFamily: fontFamilyBase,  // Set base font family for TextTheme (Flutter uses this for all text styles)
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: fontSizeH1, fontWeight: FontWeight.w700, fontFamily: fontFamilyBase, color: textColorPrimary),
        displayMedium: TextStyle(fontSize: fontSizeH2, fontWeight: FontWeight.w700, fontFamily: fontFamilyBase, color: textColorPrimary),
        bodyLarge: TextStyle(fontSize: fontSizeBody, fontWeight: FontWeight.w400, fontFamily: fontFamilyBase, color: textColorPrimary),
        bodyMedium: TextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.w400, fontFamily: fontFamilyBase, color: textColorSecondary),
        // Other text styles (subtitle, caption, etc.) can be defined similarly...
      ),
    );
  }
}
