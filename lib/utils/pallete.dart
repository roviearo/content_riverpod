import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xff212121, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xfffafafa), //10%
      100: Color(0xfff5f5f5), //20%
      200: Color(0xffeeeeee), //30%
      300: Color(0xffe0e0e0), //40%
      400: Color(0xffbdbdbd), //50%
      500: Color(0xff9e9e9e), //60%
      600: Color(0xff757575), //70%
      700: Color(0xff616161), //80%
      800: Color(0xff424242), //90%
      900: Color(0xff212121), //100%
    },
  );
}
