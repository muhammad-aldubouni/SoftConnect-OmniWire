import 'package:flutter/material.dart';

abstract class EnterpriseColors {
  /// Set to `true` for dark mode, `false` for deep, high-separation light mode.
  static bool isDark = false;

  // Base Surfaces (Muted steel-gray depth hierarchy)
  static Color get bg => isDark
      ? const Color.fromARGB(255, 21, 22, 22)
      : const Color(0xFFF8FAFC); // Soft off-white light-mode background
  static Color get surface => isDark
      ? const Color(0xFF12141A)
      : const Color.fromARGB(255, 238, 243, 250); // High-contrast cards
  static Color get panel => isDark
      ? const Color(0xFF181A22)
      : const Color.fromARGB(255, 212, 222, 233); // Clear elevated containers
  static Color get buttonColor => isDark
      ? const Color.fromARGB(255, 7, 7, 8)
      : const Color.fromARGB(
          255,
          216,
          229,
          255,
        ); // Bold dark buttons for maximum pop

  // Borders & Dividers (Heavy separation lines)
  static Color get border => isDark
      ? const Color.fromARGB(255, 22, 19, 37)
      : const Color.fromARGB(
          118,
          238,
          246,
          255,
        ); // Dark, crisp container boundaries
  static Color get operatorOr => isDark
      ? const Color.fromARGB(255, 42, 141, 133)
      : const Color(0xFF0F766E); // Dark teal for light-mode contrast

  // Typography (Ultra-sharp readability on medium surfaces)
  static Color get textPrimary => isDark
      ? const Color(0xFFC3C7D1)
      : const Color(0xFF0F172A); // Midnight blue/black text
  static Color get textBright => isDark
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF000000); // Pure black headers
  static Color get textMuted => isDark
      ? const Color(0xFF6B7280)
      : const Color(0xFF334155); // High-contrast dark gray subtext

  // Syntax & Functional Accents (Intense, deep tones)
  static Color get operatorAnd => isDark
      ? const Color.fromARGB(255, 51, 109, 233)
      : const Color.fromARGB(255, 70, 103, 209); // Deep Royal Blue
  static Color get selected => isDark
      ? const Color(0xFF7C3AED)
      : const Color(0xFF2563EB); // Strong blue for light-mode contrast
  static Color get green => isDark
      ? const Color(0xFF059669)
      : const Color(0xFF065F46); // Dark Emerald
  static Color get actionAccent =>
      isDark ? const Color(0xFFD97706) : const Color(0xFF92400E); // Burnt Amber
  static Color get paramColor => isDark
      ? const Color.fromARGB(255, 12, 170, 210)
      : const Color.fromARGB(255, 53, 132, 156); // Deep Teal
  static Color get equalColor =>
      isDark ? const Color(0xFFFF6E40) : const Color(0xFF9A3412); // Deep Rust
  static Color get glass => isDark
      ? Color.fromARGB(255, 8, 8, 8).withAlpha(185)
      : const Color.fromARGB(255, 205, 205, 211).withAlpha(140);
}
