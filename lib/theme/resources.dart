import 'package:flutter/painting.dart';

class Resources {
  static AppColors color = AppColors();
}

class AppColors {
  // neutral color
  Color neutral50 = const Color(0xFFFFFFFF);
  Color neutral100 = const Color(0xFFF3F4F6);
  Color neutral200 = const Color(0xFFE5E7EB);
  Color neutral300 = const Color(0xFFD2D5DA);
  Color neutral400 = const Color(0xFF9CA3AF);
  Color neutral500 = const Color(0xFF6D7280);
  Color neutral600 = const Color(0xFF4B5563);
  Color neutral700 = const Color(0xFF374151);
  Color neutral800 = const Color(0xFF1F2937);
  Color neutral900 = const Color(0xFF111827);

  // indigo color
  Color indigo10 = const Color(0xFFD9D9D9);
  Color indigo50 = const Color(0xFFECE6F7);
  Color indigo100 = const Color(0xFFD8CCEE);
  Color indigo200 = const Color(0xFFC5B3E6);
  Color indigo300 = const Color(0xFFB299DE);
  Color indigo400 = const Color(0xFF9E80D6);
  Color indigo500 = const Color(0xFF8B67CD);
  Color indigo600 = const Color(0xFF774DC5);
  Color indigo700 = const Color(0xFF663BB6);
  Color indigo800 = const Color(0xFF59349F);
  Color indigo900 = const Color(0xFF4D2C88);

  // state color
  Color statePositive = const Color(0xFF2DCC70);
  Color stateNegative = const Color(0xFFE84C3D);
  Color stateWarning = const Color(0xFFFB9E2E);

  // shadow color
  Color shadowColor = const Color(0xFF9E80D6);

  // gradient color
  Gradient gradient600to800 = const RadialGradient(
    colors: <Color>[
      Color(0xFF59349F),
      Color(0xFF774DC5),
    ],
    radius: 0.35,
    center: Alignment.topCenter,
  );
  Gradient gradient500to700 = const LinearGradient(
    colors: <Color>[
      Color(0xFF663BB6),
      Color(0xFF8B67CD),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  Gradient gradientNeutral200to300 = const LinearGradient(
    colors: <Color>[
      Color(0xFFE5E7EB),
      Color(0xFFD2D5DA),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
