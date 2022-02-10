import 'package:flutter/material.dart';

class AppColors {
  
  static final MaterialColor PRIMARY_COLOR = _factoryColor(0xff2B3340);

  
  static final MaterialColor BLUE = _factoryColor(0xff007eb8);

  
  static final MaterialColor BLUE_LIGHT = _factoryColor(0xffE9f0f8);

  
  static final MaterialColor RED = _factoryColor(0xffff0000);

  
  static final MaterialColor RED_LIGHT = _factoryColor(0xffF9edfb);

  
  static final MaterialColor VIOLET = _factoryColor(0xff964c99);

  
  static final MaterialColor WHITE = _factoryColor(0xffffffff);

  
  static final MaterialColor LIGHT_WHITE = _factoryColor(0xffe7e9ee);

  
  static final MaterialColor GREY = _factoryColor(0xFF424242);

  
  static final MaterialColor LIGHT_GREY = _factoryColor(0xff808080);

  
  static final MaterialColor DARK = _factoryColor(0xff3a3a3a);

  
  static final MaterialColor BLACK = _factoryColor(0xff000000);

  
  static final MaterialColor GREEN = _factoryColor(0xff2abf46);

  
  static final MaterialColor LIGHT_GREEN = _factoryColor(0xff3AB54A);

  
  static final MaterialColor SHADOW = _factoryColor(0xffE7EAF0);

  static MaterialColor hex(String hex) =>
      AppColors._factoryColor(AppColors._getColorHexFromStr(hex));

  static MaterialColor _factoryColor(int color) {
    return MaterialColor(color, <int, Color>{
      50: Color(color),
      100: Color(color),
      200: Color(color),
      300: Color(color),
      400: Color(color),
      500: Color(color),
      600: Color(color),
      700: Color(color),
      800: Color(color),
      900: Color(color),
    });
  }

  static int _getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        val = 0xFFFFFFFF;
      }
    }
    return val;
  }
}
