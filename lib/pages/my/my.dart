import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/my/setting.dart';
import 'package:metal/pages/my/login.dart';
import 'package:metal/pages/my/collect.dart';
import 'package:metal/pages/my/Follow.dart';
import 'package:metal/pages/my/footh.dart';
import 'package:metal/pages/my/list.dart';
import 'package:metal/pages/my/Release.dart';
import 'package:metal/pages/my/wallet.dart';
import 'package:metal/pages/my/follows.dart';
import 'package:metal/pages/my/examine.dart';
import 'package:metal/pages/my/company.dart';
import 'package:metal/pages/my/help.dart';

class My extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PersonPagerState();
  }
}

class PersonPagerState extends State<My> {
  @override
  void initState() { 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) => new Setting()),
            );
          },
        ),
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
          MyHeader(),
          MyBody(),
        ]
      )
    );
  }
}

class MyHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyHeaderState();
  }
}

class MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:Alignment.center, 
      children: <Widget>[
        Container(height: 90,),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          height: 45,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF64B5F6),
                Color(0xFF1976D2),
              ],
            ),
          ), 
        ),
        Positioned(
          top: 0,
          child: Ink(
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => new LoginPage()),
                );
              },
            child:Container(
              child: Column(
                children: <Widget>[
                  new CircleAvatar(
                    backgroundImage: new AssetImage("images/at.jpg"),
                    radius: 35,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text('请登录',style: TextStyle(fontSize: 16.0),),
                  )
                ],
              ),
            )
            )
          ),
        ),
      ],
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyBodyState();
  }
}

class MyBodyState extends State<MyBody> {
  static SlideTransition createTransition(
    Animation<double> animation, Widget child) {
      return new SlideTransition(
          position: new Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: const Offset(0.0, 0.0),
      ).animate(animation),
          child: child,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(top: 20.0, bottom: 1.0),
      child: new Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Material( 
                child: Ink(
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => new Collect()),
                    );
                  },
                  child:Column(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.redAccent,
                        size: 25.0,
                      ),
                      Container(
                        child: Text(
                          '收藏',
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ),
                      ]
                    )
                  )
                ),
              ),
              new Material( 
                child: Ink(
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => new Follow()),
                    );
                  },
                  child:Column(
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        color: Colors.green,
                        size: 25.0,
                      ),
                      Container(
                        child: Text('关注', style: TextStyle(fontSize: 13.0)),
                      ),
                    ],
                  ),
                  )
                ),
              ),
              new Material( 
                child: Ink(
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => new Footh()),
                    );
                  },
                  child:Column(
                    children: <Widget>[
                      Icon(
                        Icons.watch_later,
                        color: Color(0xFF4DD0E1),
                        size: 25.0,
                      ),
                      Container(
                        child: Text('足迹', style: TextStyle(fontSize: 13.0)),
                      ),
                    ],
                  ),
                  )
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20),),
          new Divider(height: 0,),
          Material( 
            color: Colors.white,
            child: Ink(
              child: InkWell(
                onTap: (){
                  Navigator.push<String>(
                    context,
                    new PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                          // 跳转的路由对象
                          return new Release();
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return MyBodyState
                          .createTransition(animation, child);
                    })
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 60,
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child:Row(children: <Widget>[
                          Icon(Icons.line_style,size: 30,color: Colors.teal,),
                          Text(" 我的发布",style:TextStyle(fontSize: 16.0))
                        ],)
                      ),
                      Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.teal,),
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
                  Navigator.push<String>(
                    context,
                    new PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                          // 跳转的路由对象
                          return new List();
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return MyBodyState
                          .createTransition(animation, child);
                    })
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 60,
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child:Row(children: <Widget>[
                          Icon(Icons.list,size: 30,color: Colors.orange,),
                          Text(" 我的订单",style:TextStyle(fontSize: 16.0))
                        ],)
                      ),
                      Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.orange,),
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
                  Navigator.push<String>(
                    context,
                    new PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                          // 跳转的路由对象
                          return new Wallet();
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return MyBodyState
                          .createTransition(animation, child);
                    })
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 60,
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child:Row(children: <Widget>[
                          Icon(Icons.account_balance_wallet,size: 30,color: Colors.pink,),
                          Text(" 我的钱包",style:TextStyle(fontSize: 16.0))
                        ],)
                      ),
                      Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.pink,),
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
                    new MaterialPageRoute(builder: (context) => new Followsme()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 60,
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child:Row(children: <Widget>[
                          Icon(Icons.person_pin,size: 30,color: Colors.purpleAccent,),
                          Text(" 我的粉丝",style:TextStyle(fontSize: 16.0))
                        ],)
                      ),
                      Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.purpleAccent,),
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
                  Navigator.push<String>(
                    context,
                    new PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                          // 跳转的路由对象
                          return new Examine();
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return MyBodyState
                          .createTransition(animation, child);
                    })
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child:Row(children: <Widget>[
                          Icon(Icons.mail,size: 30,color: Colors.lime),
                          Text(" 我的检验",style:TextStyle(fontSize: 16.0))
                        ],)
                      ),
                      Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.lime,),
                    ],
                  ),
                ),
              ),
            ),
          ),
          new Divider(height: 0,),
          Interval_space(),
          Material( 
            color: Colors.white,
            child: Ink(
              child: InkWell(
                onTap: (){
                  Navigator.push<String>(
                    context,
                    new PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                          // 跳转的路由对象
                          return new Company();
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return MyBodyState
                          .createTransition(animation, child);
                    })
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 60,
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child:Row(children: <Widget>[
                          Icon(Icons.featured_play_list,size: 30,color: Colors.blueGrey,),
                          Text(" 企业认证",style:TextStyle(fontSize: 16.0))
                        ],)
                      ),
                      Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.blueGrey,),
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
                  Navigator.push<String>(
                    context,
                    new PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                          // 跳转的路由对象
                          return new Help();
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return MyBodyState
                          .createTransition(animation, child);
                    })
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 60,
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child:Row(children: <Widget>[
                          Icon(Icons.live_help,size: 30,color: Colors.blue,),
                          Text(" 联系客服",style:TextStyle(fontSize: 16.0))
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
        ],
      )
    );
  }
}