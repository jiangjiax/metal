import 'package:flutter/material.dart';

class GlobalConfig {
  static bool dark = true;
  static ThemeData themeData = new ThemeData.dark();
  static Color searchBackgroundColor = Color.fromRGBO(192, 192, 192, 1);
  static Color cardBackgroundColor = new Color(0xFF222222);
  static Color fontColor = Colors.black;
}

class Search {
  final List<String> data = <String>[
    'iron',
    '磷铜',
    '镍铁',
    '硅钙合金',
    '白铜',
  ];
  final List<String> history = <String>[
    'iron',
    '磷铜',
    '镍铁',
    '硅钙合金',
    '白铜',
  ];
}