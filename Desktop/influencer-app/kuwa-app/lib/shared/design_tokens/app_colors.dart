import 'package:flutter/material.dart';

class AppColors {
  // Primary colors - Figma design system colors
  static const Color primary = Color(0xFFA855F7);
  static const Color primaryLight = Color(0xFFC084FC);
  static const Color primaryDark = Color(0xFF7C3AED);

  // Secondary colors - Figma exact specifications
  static const Color secondary = Color(0xFF6366F1); // Indigo from Figma icons
  static const Color secondaryLight = Color(0xFF8B5CF6);
  static const Color secondaryDark = Color(0xFF5B21B6);

  // Accent colors - Figma accent system  
  static const Color accent = Color(0xFFF59E0B);
  static const Color accentLight = Color(0xFFFBBF24);

  // Dark theme colors - Figma dark theme
  static const Color dark = Color(0xFF0A0612);
  static const Color darkVariant = Color(0xFF2D1B4E);

  // Gradient colors - Figma design specifications
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFA855F7), Color(0xFF8B5CF6), Color(0xFF6366F1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFFFAF7FF), Color(0xFFF3F0FF), Color(0xFFEDE9FE)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // Semantic colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Background colors
  static const Color background = Color(0xFFFAF7FF);
  static const Color backgroundSecondary = Color(0xFFF8FAFC); // ✅ eklendi
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF8FAFC);

  // Text colors
  static const Color textPrimary = Color(0xFF0A0612);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textTertiary = Color(0xFF94A3B8);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSurface = Color(0xFF0A0612);

  // Border & divider
  static const Color border = Color(0xFFE2E8F0);
  static const Color borderFocus = Color(0xFFA855F7);
  static const Color borderVariant = Color(0xFFCBD5E1);
  static const Color divider = Color(0xFFE5E7EB); // ✅ eklendi

  // Input colors
  static const Color inputBackground = Color(0xFFFFFFFF);
  static const Color inputBorder = Color(0xFFE2E8F0);
  static const Color inputFocus = Color(0xFFA855F7);

  // Shadows
  static const Color shadow = Color(0x1A000000);
  static const Color shadowMedium = Color(0x3D000000);
}
