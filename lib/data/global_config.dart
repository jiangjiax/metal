import 'package:flutter/material.dart';

class GlobalConfig {
  static bool dark = true;
  static ThemeData themeData = new ThemeData.dark();
  static Color searchBackgroundColor = Color.fromRGBO(255, 255, 255, 0.5);
  static Color appbarBackgroundColor1 = Color.fromRGBO(71, 26, 155, 1);
  static Color appbarBackgroundColor2 = Color.fromRGBO(255, 255, 255, 0.5);
  static Color appbarBackgroundColor3 = Color.fromRGBO(255, 255, 255, 0.5);
  static Color appbarBackgroundColor4 = Color.fromRGBO(255, 255, 255, 0.5);
  static Color cardBackgroundColor = new Color(0xFF222222);
  static Color fontColor = Colors.black;
  static Color fontColor1 = Colors.white;
}

class GlobalSearch {
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

class GlobalSwiper {
  static List<String> images = [
    "images/star.jpg",
    "images/sea.png",
  ];
}

class GlobalAppTitles {
  static const Titles = [
    '代办项目',
    '计划',
    '数据统计',
    '我的',
  ];
}

class GlobalButton {
  static Color textColorBefore = Colors.black;
  static Color textColorAfter = Colors.blue;
}