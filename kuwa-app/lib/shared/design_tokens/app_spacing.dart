import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılan spacing değerleri
class AppSpacing {
  // Private constructor to prevent instantiation
  const AppSpacing._();

  /// Extra small spacing (4.0)
  static const double xs = 4.0;

  /// Small spacing (8.0)
  static const double sm = 8.0;

  /// Medium spacing (16.0)
  static const double md = 16.0;

  /// Large spacing (24.0)
  static const double lg = 24.0;

  /// Extra large spacing (32.0)
  static const double xl = 32.0;

  /// Extra extra large spacing (48.0)
  static const double xxl = 48.0;

  /// Extra extra extra large spacing (64.0)
  static const double xxxl = 64.0;

  // Commonly used edge insets
  static const edgeInsetsXS = EdgeInsets.all(xs);
  static const edgeInsetsSM = EdgeInsets.all(sm);
  static const edgeInsetsMD = EdgeInsets.all(md);
  static const edgeInsetsLG = EdgeInsets.all(lg);
  static const edgeInsetsXL = EdgeInsets.all(xl);
  static const edgeInsetsXXL = EdgeInsets.all(xxl);

  // Horizontal spacing
  static const edgeInsetsHorizontalXS = EdgeInsets.symmetric(horizontal: xs);
  static const edgeInsetsHorizontalSM = EdgeInsets.symmetric(horizontal: sm);
  static const edgeInsetsHorizontalMD = EdgeInsets.symmetric(horizontal: md);
  static const edgeInsetsHorizontalLG = EdgeInsets.symmetric(horizontal: lg);
  static const edgeInsetsHorizontalXL = EdgeInsets.symmetric(horizontal: xl);

  // Vertical spacing
  static const edgeInsetsVerticalXS = EdgeInsets.symmetric(vertical: xs);
  static const edgeInsetsVerticalSM = EdgeInsets.symmetric(vertical: sm);
  static const edgeInsetsVerticalMD = EdgeInsets.symmetric(vertical: md);
  static const edgeInsetsVerticalLG = EdgeInsets.symmetric(vertical: lg);
  static const edgeInsetsVerticalXL = EdgeInsets.symmetric(vertical: xl);
}
