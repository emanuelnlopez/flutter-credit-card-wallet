import 'dart:math';

import 'package:flutter/widgets.dart';

class AppColors {
  static final Color appLightBackground = Color(0xFFF1F1E6);
  static final Color errorColor = Color(0xFFB00020);
  static final Color hydrogenGradientEnd = Color(0xFF0082C8);
  static final Color hydrogenGradientStart = Color(0xFF667DB6);
  static final Color orageCoralGradientEnd = Color(0xFFFF5E62);
  static final Color orageCoralGradientStart = Color(0xFFFF9966);
  static final Color orageFunGradientEnd = Color(0xFFF7B733);
  static final Color orageFunGradientStart = Color(0xFFFC4A1A);
  static final Color primaryColor = Color(0xFF006064);
  static final Color purPinkGradientEnd = Color(0xFFE100FF);
  static final Color purPinkGradientStart = Color(0xFF7F00FF);
  static final Color secondaryColor = Color(0xFFFF8945);
  static final Color viceCityGradientEnd = Color(0xFF3494E6);
  static final Color viceCityGradientStart = Color(0xFFEC6EAD);

  static final LinearGradient hydrogenGradient = LinearGradient(
    colors: [
      hydrogenGradientStart,
      hydrogenGradientEnd,
      hydrogenGradientEnd,
      hydrogenGradientStart,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final LinearGradient orangeCoralGradient = LinearGradient(
    colors: [
      orageCoralGradientStart,
      orageCoralGradientEnd,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final LinearGradient orangeFunGradient = LinearGradient(
    colors: [
      orageFunGradientStart,
      orageFunGradientEnd,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final LinearGradient purPinkGradient = LinearGradient(
    colors: [
      purPinkGradientStart,
      purPinkGradientEnd,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final LinearGradient viceCityGradient = LinearGradient(
    colors: [
      viceCityGradientStart,
      viceCityGradientEnd,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static List<LinearGradient> get gradients => [
        hydrogenGradient,
        orangeCoralGradient,
        orangeFunGradient,
        purPinkGradient,
        viceCityGradient,
      ];

  static LinearGradient get randomGradient {
    final index = Random().nextInt(gradients.length - 1);
    return gradients[index];
  }

  /// Helper function to translate from a standard 3, 6 or 8 digit HTML hex
  /// string.  The leading '#' is optional.  This supports RGB and ARGB hex
  /// values.
  ///
  /// For example, the color red could be expressed as any of:
  /// ```
  ///   aaa
  ///   ff0000
  ///   #ff0000
  ///   ffff0000
  ///   #ffff0000
  /// ```
  static Color fromHex(
    String hex, [
    Color? defaultColor,
  ]) {
    var color = defaultColor;
    try {
      var i = 0;

      if (hex.startsWith('#') == true) {
        hex = hex.substring(1);
      }

      // Convert the three character `aaa` to `aaaaaa`.
      if (hex.length == 3) {
        hex = hex.substring(0, 1) +
            hex.substring(0, 1) +
            hex.substring(1, 2) +
            hex.substring(1, 2) +
            hex.substring(2, 3) +
            hex.substring(2, 3);
      }

      if (hex.length == 6 || hex.length == 8) {
        i = int.parse(hex, radix: 16);

        if (hex.length != 8) {
          i = 0xff000000 + i;
        }

        color = Color(i);
      } else {
        throw Exception('Invalid color: $hex');
      }
    } catch (e) {
      if (color == null) {
        rethrow;
      }
    }

    return color;
  }
}
