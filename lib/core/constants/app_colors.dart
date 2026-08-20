import 'package:flutter/material.dart';

/// অ্যাপের সব রং এক জায়গায় — যাতে পরে পরিবর্তন করা সহজ হয়।
class AppColors {
  AppColors._();

  // Brand / primary
  static const Color primary = Color(0xFF0F766E); // teal — বিশ্বাসযোগ্য, শান্ত
  static const Color primaryDark = Color(0xFF115E59);
  static const Color primaryLight = Color(0xFF5EEAD4);

  // Semantic — বাকি/পাওনা (লাল-জাতীয়) বনাম জমা/আদায় (সবুজ-জাতীয়)
  static const Color debt = Color(0xFFDC2626); // পাওনা বাড়লে
  static const Color payment = Color(0xFF16A34A); // পরিশোধ হলে

  // Surface / background
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF1F5F9);

  // Text
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Border / divider
  static const Color border = Color(0xFFE2E8F0);

  // Status
  static const Color error = Color(0xFFDC2626);
  static const Color warning = Color(0xFFD97706);
  static const Color success = Color(0xFF16A34A);
}
