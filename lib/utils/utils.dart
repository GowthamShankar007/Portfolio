import 'package:flutter/material.dart';

class Utils {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static String getFormattedUSDomesticString(String value) {
    String result = "";
    List<String> list = value.split("");
    for (int i = 0; i < list.length; i++) {
      if (list.length > 3 && i == 0) {
        result = "(" + list[i];
      } else if (list.length > 3 && i == 2) {
        result = result + list[i] + ")";
      } else if (list.length > 6 && i == 5) {
        result = result + list[i] + "-";
      } else {
        result = result + list[i];
      }
    }
    return result;
  }

  static String removeSpecialChars(String value) {
    RegExp exp = RegExp(r"[^\s\w]");
    return value.replaceAll(exp, '');
  }
}
