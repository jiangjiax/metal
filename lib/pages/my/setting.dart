import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';

class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SettingPagerState();
  }
}

class SettingPagerState extends State<Setting> {
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