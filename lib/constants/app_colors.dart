import 'package:flutter/material.dart';

/// Central color palette for EcoPam.
/// NOTE: the brand greens (primary/primaryDark/primaryLight) were not visible
/// in the app_colors.dart snippet you shared (it was cut off above line 12),
/// so these three are a reasonable reconstruction matching the mockup's dark
/// green headers/buttons. Everything from accentOrangeCard down matches what
/// was visible in your screenshot exactly.
class AppColors {
  // Brand
  static const Color primary = Color(0xFF1B4332);
  static const Color primaryDark = Color(0xFF14332A);
  static const Color primaryLight = Color(0xFF2D6A4F);
  static const Color accentOrange = Color(0xFFE29547);
  static const Color accentOrangeCard = Color(0xFFE29547);
  static const Color accentOrangeBg = Color(0xFFFDF4E7);

  // Backgrounds
  static const Color background = Color(0xFFF7F8F5);
  static const Color cardBg = Colors.white;
  static const Color surfaceMuted = Color(0xFFF0F3EF);

  // Status colors
  static const Color success = Color(0xFF2E7D32);
  static const Color successBg = Color(0xFFE8F5E9);
  static const Color urgent = Color(0xFFD32F2F);
  static const Color urgentBg = Color(0xFFFFEBEE);
  static const Color warning = Color(0xFFF57C00);
  static const Color warningBg = Color(0xFFFFF3E0);

  // Text
  static const Color textDark = Color(0xFF1F2937);
  static const Color textMuted = Color(0xFF6B7280);
  static const Color textLight = Color(0xFF9CA3AF);

  // Borders
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderSubtle = Color(0xFFEFEFEF);
}
