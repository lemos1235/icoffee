//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/22
//

import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF7f451c);
  static const Color bgWhite = Color(0xFFFCFBFB);
  static const Color deactivatedText = Color(0xFF767676);

  static const MaterialColor brown = MaterialColor(
    _brownPrimaryValue,
    <int, Color>{
      50: Color(0xFFEFEBE9),
      100: Color(0xFFD7CCC8),
      200: Color(0xFFBCAAA4),
      300: Color(0xFFA1887F),
      400: Color(0xFF8D6E63),
      500: Color(_brownPrimaryValue),
      600: Color(0xFF6D4C41),
      700: Color(0xFF5D4037),
      800: Color(0xFF4E342E),
      900: Color(0xFF3E2723),
    },
  );
  static const int _brownPrimaryValue = 0xFF7f451c;
}
