import 'package:flutter/material.dart';

class Value {
  String text;
  bool color;

  Value({this.text, this.color});
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
  static Color textColorBefore = Color(0xFF424242);
  static Color textColorAfter = Colors.white;

  static Color backColorBefore = Colors.white;
  static Color backColorAfter = Colors.blue;
}

class TextStyles {
//  黑字加粗
  static TextStyle1() {return new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold);}
//  灰色小字
  static TextStyle2() {return new TextStyle(fontSize: 15.0,color: Color(0xFF424242));}
//  灰色更小字
  static TextStyle3() {return new TextStyle(fontSize: 13.0,color: Color(0xFF424242));}
}

//抽屉
class Drawers {
//  地区_城市
  static List<String> City = <String>[
    '北京',
    '上海',
    '杭州',
    '长沙',
    '深圳',
    '温州',
    '南京',
    '厦门',
    '福州',
  ];

  static List<String> Province = <String>[
    '安徽',
    '福建',
    '甘肃',
    '广东',
    '广西',
    '贵州',
    '海南',
    '河北',
    '河南',
    '内蒙古',
    '青海',
    '辽宁',
    '四川',
    '云南',
  ];

  static List<Value> Cate = <Value>[
    Value(
      text: '全部',
      color: false,
    ),
    Value(
      text: '供应方',
      color: false,
    ),
    Value(
      text: '采购方',
      color: false,
    ),
  ];

  static List<Value> alignmentValues = <Value>[
    Value(
      text: '所有品种',
      color: false,
    ),
    Value(
      text: '报废车废料',
      color: false,
    ),
    Value(
      text: '可再利用料',
      color: false,
    ),
    Value(
      text: '线路板',
      color: false,
    ),
    Value(
      text: '电池',
      color: false,
    ),
    Value(
      text: '贵金属',
      color: false,
    ),
    Value(
      text: '二手良品',
      color: false,
    ),
    Value(
      text: '不锈钢',
      color: false,
    ),
    Value(
      text: '其他',
      color: false,
    ),
  ];
}

List<String> metals = <String>[
  '黄铜',
  '紫铜',
  '报废车废料',
  '可再利用料',
  '线路板',
  '电池',
  '贵金属',
  '二手良品',
  '不锈钢',
  '其他',
];

class Interval_space extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Divider(height: 0,),
        Container(
          height: 5.0,
          color: Color(0xFFEEEEEE),
        ),
        new Divider(height: 0,),
      ],
    );
  }
}
