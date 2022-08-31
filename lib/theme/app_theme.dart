import 'package:flutter/material.dart';
import 'package:notesgram/theme/resources.dart';

class AppTheme {
  static ThemeData buildThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.dark(
        primary: Resources.color.indigo700,
        onPrimary: Resources.color.indigo700,
        secondary: Resources.color.indigo100,
        onSecondary: Resources.color.indigo100,
        error: Resources.color.stateNegative,
        onError: Resources.color.stateNegative,
        outline: Resources.color.indigo700,
      ),
    );
  }
}
