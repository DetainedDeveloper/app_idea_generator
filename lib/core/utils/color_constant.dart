import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9002b = fromHex('#2b000000');

  static Color black90099 = fromHex('#99000000');

  static Color black900Dd = fromHex('#dd000000');

  static Color black900 = fromHex('#000000');

  static Color blueGray400 = fromHex('#888888');

  static Color indigoA200 = fromHex('#5d5fef');

  static Color black9003f = fromHex('#3f000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
