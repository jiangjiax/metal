import 'package:flutter/material.dart';

class Value {
  String text;
  bool color;
  String image;
  Color backcolor;

  Value({this.text, this.color, this.image, this.backcolor});
}

class GlobalSearch {
  static List<String> hot = <String>[
    'iron',
    '磷铜',
    '镍铁',
  ];
  static List<String> history = <String>[
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
//  更浅的灰色更小字
  static TextStyle4() {return new TextStyle(fontSize: 12.0,color: Color(0xFF616161));}
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
      text: '供应资源',
      color: false,
    ),
    Value(
      text: '采购资源',
      color: false,
    ),
  ];
}

List<Value> metals = <Value>[
    Value(
      text: '电线电缆',
      color: true,
      image:  "images/电线.png",
      backcolor: Colors.blue,
    ),
    Value(
      text: '贵金属',
      color: false,
      image:  "images/金条.png",
      backcolor: Colors.pink,
    ),
    Value(
      text: '线路板',
      color: false,
      image:  "images/线路.png",
      backcolor: Colors.green,
    ),
    Value(
      text: '电池',
      color: false,
      image:  "images/电池.png",
      backcolor: Colors.purple,
    ),
    Value(
      text: '可再利用料',
      color: false,
      image:  "images/循环.png",
      backcolor: Colors.red,
    ),
    Value(
      text: '二手良品',
      color: false,
      image:  "images/二手设备.png",
      backcolor: Colors.blueAccent,
    ),
    Value(
      text: '不锈钢',
      color: false,
      image:  "images/不锈钢.png",
      backcolor: Colors.blueGrey,
    ),
    Value(
      text: '纺织废料',
      color: false,
      image:  "images/纺织.png",
      backcolor: Colors.lime,
    ),
    Value(
      text: '铜',
      color: false,
      image:  "images/铜.png",
      backcolor: Colors.orange,
    ),
    Value(
      text: '其他',
      color: false,
      image:  "images/其他.png",
      backcolor: Colors.teal,
    ),
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

class Followvalue {
  String name;
  bool follows;
  String image;

  Followvalue({this.name, this.follows, this.image});
}
class Examinevalue {
  String listindex;
  String name;
  String image;
  //1：等待付款中；2：已付款，平台正在检验中；3：检验失败，请等待客服联系；4：检验成功；
  int state;

  Examinevalue({this.listindex, this.name, this.image, this.state});
}

class GlobalMy {
  static List<Followvalue> myFollow = <Followvalue>[
      Followvalue(
        name: '阿辉',
        follows: true,
        image:  "images/电线.png",
      ),
      Followvalue(
        name: '哈哈',
        follows: true,
        image:  "images/其他.png",
      ),
      Followvalue(
        name: '电线电缆',
        follows: true,
        image:  "images/电池.png",
      ),
      Followvalue(
        name: '能适旗舰店',
        follows: true,
        image:  "images/电池.png",
      ),
  ];
  static List<Examinevalue> myex = <Examinevalue>[
      Examinevalue(
        listindex: 'B111000',
        name: '眼镜厂废料',
        image:  "images/star.jpg",
        state: 1
      ),
      Examinevalue(
        listindex: 'B111001',
        name: '铜废料',
        image:  "images/star.jpg",
        state: 2
      ),
      Examinevalue(
        listindex: 'B111002',
        name: '线管废料',
        image:  "images/star.jpg",
        state: 3
      ),
      Examinevalue(
        listindex: 'B111002',
        name: '线管废料',
        image:  "images/star.jpg",
        state: 4
      ),
  ];
}

class Listvalue {
  String listindex;
  String name;
  String image;
  //1：等待付款中；2：已付款，等待平台确认；3：订单已完成；
  //1：已报价，等待确认；2：等待付款中；3：已付款，等待平台确认；4：订单已完成；
  int state;
  String number;

  Listvalue({this.listindex, this.name, this.image, this.state, this.number});
}

class GlobalList {
  static List<Listvalue> myList = <Listvalue>[
      Listvalue(
        listindex: 'A111000',
        name: '眼镜厂废料',
        image:  "images/star.jpg",
        state: 1,
        number:"15555555555",
      ),
      Listvalue(
        listindex: 'A111001',
        name: '铜废料',
        image:  "images/star.jpg",
        state: 2,
        number:"15555555555",
      ),
      Listvalue(
        listindex: 'A111002',
        name: '线管废料',
        image:  "images/star.jpg",
        state: 3,
        number:"15555555555",
      ),
  ];
  static List<Listvalue> youList = <Listvalue>[
      Listvalue(
        listindex: 'A111000',
        name: '眼镜厂废料',
        image:  "images/star.jpg",
        state: 1
      ),
      Listvalue(
        listindex: 'A111001',
        name: '铜废料',
        image:  "images/star.jpg",
        state: 2
      ),
      Listvalue(
        listindex: 'A111002',
        name: '线管废料',
        image:  "images/star.jpg",
        state: 3
      ),
      Listvalue(
        listindex: 'A111002',
        name: '线管废料',
        image:  "images/star.jpg",
        state: 4
      ),
  ];
}

  void gosubit(String text,context){
    showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text(text, style: new TextStyle(fontSize: 17.0)),
        actions: <Widget>[
        new FlatButton(
          child: new Text('确定'),
          onPressed: (){
            print("确定");
            Navigator.of(context).pop();
          },
        ),
        ],
      );
      }
    );
  }