import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SettingPagerState();
  }
}

class SettingPagerState extends State<Setting> {
  List<File> imageing = [];
  int imageingl = 0;

  void images(){
    if (imageing.length==null) {
      imageingl = 0;
    }else{
      imageingl = imageing.length;
    }
    print(imageingl);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("设置"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF64B5F6),
                Color(0xFF1976D2),
              ],
            ),
          ),
        ),   
        elevation: 0.0,
      ),
      body:ListView(
        children: <Widget>[
          Interval_space(),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
                Material( 
                  color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context){
                            return new Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new ListTile(
                                  leading: new Icon(Icons.photo_camera),
                                  title: new Text("开启相机拍照"),
                                  onTap: () async {
                                    getImagecamera();
                                  },
                                ),
                                new ListTile(
                                  leading: new Icon(Icons.photo_library),
                                  title: new Text("选择相册照片"),
                                  onTap: () async {
                                    getImagegallery();
                                  },
                                ),
                              ],
                            );
                          }
                        );
                      },
                      child: Container(
                        height: 60,
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child:Row(children: <Widget>[
                                Text(" 头像",style:TextStyle(fontSize: 16.0))
                              ],)
                            ),
                            Container(
                              child:Row(children: <Widget>[
                                new CircleAvatar(
                                  backgroundImage: new AssetImage(GlobalMy.myFollow[3].image),
                                  radius: 20,
                                ),
                                Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.blue,),
                              ],)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                new Divider(height: 0,),
                Material( 
                  color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          new MaterialPageRoute(builder: (context) => new Name()),
                        );
                      },
                      child: Container(
                        height: 60,
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child:Row(children: <Widget>[
                                Text(" 名字",style:TextStyle(fontSize: 16.0))
                              ],)
                            ),
                            Container(
                              child:Row(children: <Widget>[
                                Text("lulali",style:TextStyles.TextStyle3()),
                                Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.blue,),
                              ],)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Interval_space(),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
                Material( 
                  color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          new MaterialPageRoute(builder: (context) => new Recephigh()),
                        );
                      },
                      child: Container(
                        height: 60,
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child:Row(children: <Widget>[
                                Icon(Icons.receipt,size: 30,color: Colors.blue,),
                                Text(" 发票信息",style:TextStyle(fontSize: 16.0))
                              ],)
                            ),
                            Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.blue,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Interval_space(),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
                Material( 
                  color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          new MaterialPageRoute(builder: (context) => new SettingSafe()),
                        );
                      },
                      child: Container(
                        height: 60,
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child:Row(children: <Widget>[
                                Icon(Icons.settings,size: 30,color: Colors.blue,),
                                Text(" 账号与安全",style:TextStyle(fontSize: 16.0))
                              ],)
                            ),
                            Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.blue,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                new Divider(height: 0,),
                Material( 
                  color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      onTap: (){
                      },
                      child: Container(
                        height: 60,
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child:Row(children: <Widget>[
                                Icon(Icons.power_settings_new,size: 30,color: Colors.blue,),
                                Text(" 退出登陆",style:TextStyle(fontSize: 16.0))
                              ],)
                            ),
                            Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.blue,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Divider(height: 0,),
        ]
      )
    );
  }
  Future getImagegallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageing.add(image);
      if(imageing[imageing.length-1]==null){
        imageing.removeAt(imageing.length-1);  
      }
    });
    print(image);
    print(imageing);
    images();
    print(imageingl);
  }
  Future getImagecamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      imageing.add(image);
      if(imageing[imageing.length-1]==null){
        imageing.removeAt(imageing.length-1);  
      }
    });
    images();
  }
}

class SettingSafe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SettingSafePagerState();
  }
}

class SettingSafePagerState extends State<SettingSafe> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("账号与安全"),
        elevation: 0.0,
      ),
      body:ListView(
        children: <Widget>[
          Interval_space(),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
                Material( 
                  color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 60,
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child:Row(children: <Widget>[
                                Text("账号",style:TextStyle(fontSize: 16.0))
                              ],)
                            ),
                            Text("Aaatic83225",style:TextStyle(fontSize: 15.0,color: Color(0xFFBDBDBD))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                new Divider(height: 0,),
                Material( 
                  color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 60,
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child:Row(children: <Widget>[
                                Text("手机号",style:TextStyle(fontSize: 16.0))
                              ],)
                            ),
                            Text("17777777777",style:TextStyle(fontSize: 15.0,color: Color(0xFFBDBDBD))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                new Divider(height: 0,),
              ],
            ),
          ),
          new Divider(height: 0,),
          Interval_space(),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
                Material( 
                  color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          new MaterialPageRoute(builder: (context) => new Settingmima()),
                        );
                      },
                      child: Container(
                        height: 60,
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child:Row(children: <Widget>[
                                Text("重置密码",style:TextStyle(fontSize: 16.0))
                              ],)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            )
          ),
          new Divider(height: 0,),
        ]
      )
    );
  }
}

class Settingmima extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SettingmimaPagerState();
  }
}

class SettingmimaPagerState extends State<Settingmima> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("设置密码"),
        elevation: 0.0,
        actions: <Widget>[
          new IconButton(icon: new Text("完成"), onPressed:(){}),
        ],
      ),
      body:ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
              Container(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '输入原密码',
                    labelStyle: TextStyle(fontSize: 15.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (String text){
                    setState(() {
                    });
                  },
                ),
              ),
              ],
            ),
          ),
          new Divider(height: 0,),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
              Container(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '输入新密码',
                    labelStyle: TextStyle(fontSize: 15.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (String text){
                    setState(() {
                    });
                  },
                ),
              ),
              ],
            ),
          ),
          Interval_space(),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
              Container(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '确认密码',
                    labelStyle: TextStyle(fontSize: 15.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (String text){
                    setState(() {
                    });
                  },
                ),
              ),
              ],
            ),
          ),
          new Divider(height: 0,)
        ]
      )
    );
  }
}

class Name extends StatefulWidget {
  final Widget child;

  Name({Key key, this.child}) : super(key: key);

  _NameState createState() => _NameState();
}
class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("我的名字"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: '填写名字',
                labelStyle: TextStyle(fontSize: 15.0),
                // border: InputBorder.none,
              ),
              onChanged: (String text){
                setState(() {
                });
              },
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),
            RaisedButton(
              splashColor: Colors.red,
              child: Text("完成"),
              onPressed: (){
              },
            )
          ],
        ),
      ),
    );
  }
}

class Recep extends StatefulWidget {
  final Widget child;

 Recep({Key key, this.child}) : super(key: key);

   RecepState createState() =>  RecepState();
}

class  RecepState extends State <Recep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("我的发票"),
        actions: <Widget>[
          IconButton(
            icon: Text("保存"),
            onPressed: (){},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
              Container(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '抬头',
                    labelStyle: TextStyle(fontSize: 15.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (String text){
                    setState(() {
                    });
                  },
                ),
              ),
              ],
            ),
          ),
          new Divider(height: 0,),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
              Container(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '税号',
                    labelStyle: TextStyle(fontSize: 15.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (String text){
                    setState(() {
                    });
                  },
                ),
              ),
              ],
            ),
          ),
          new Divider(height: 0,),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
              Container(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '开户银行',
                    labelStyle: TextStyle(fontSize: 15.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (String text){
                    setState(() {
                    });
                  },
                ),
              ),
              ],
            ),
          ),
          new Divider(height: 0,),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
              Container(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '银行账号',
                    labelStyle: TextStyle(fontSize: 15.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (String text){
                    setState(() {
                    });
                  },
                ),
              ),
              ],
            ),
          ),
          new Divider(height: 0,),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
              Container(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '地址',
                    labelStyle: TextStyle(fontSize: 15.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (String text){
                    setState(() {
                    });
                  },
                ),
              ),
              ],
            ),
          ),
          new Divider(height: 0,),
        ]
      )
    );
  }
}

class Recephigh extends StatefulWidget {
  final Widget child;

 Recephigh({Key key, this.child}) : super(key: key);

   RecephighState createState() =>  RecephighState();
}

class  RecephighState extends State <Recephigh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("我的发票"),
        actions: <Widget>[
          IconButton(
            icon: Text("新增"),
            onPressed: (){},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color:Colors.pink,
            child: Row(
              children: <Widget>[
              ],
            )
          )
        ]
      )
    );
  }
}