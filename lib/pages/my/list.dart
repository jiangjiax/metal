import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/Details/Details.dart';
import 'package:metal/pages/my/user.dart';

class List extends StatefulWidget {
  @override
  _ListState createState() {
    return _ListState();
  }
}
class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
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
          title: Text('我的订单'),
          bottom: new TabBar(
            tabs: [
              new Tab(text: "供应订单"),
              new Tab(text: "采购订单"),
            ],
          ),
        ),
        body: new TabBarView(
          children: [
            Container(
              color: Color(0xFFEEEEEE),
              child:ListView(
                children: <Widget>[
                  ListbodyMaterial(),
                  new Divider(height: 0,)
                ],
              )
            ),
            Container(
              color: Color(0xFFEEEEEE),
              child:ListView(
                children: <Widget>[
                  ListbodyMaterialto(),
                  new Divider(height: 0,)
                ],
              )
            ),
          ]
        ),
      ),
    );
  }
}

class ListbodyMaterial extends StatefulWidget {
  @override
  _ListbodyMaterialState createState() {
    return _ListbodyMaterialState();
  }
}
class _ListbodyMaterialState extends State<ListbodyMaterial> {
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
      color: Colors.white,
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true, 
        itemCount: GlobalList.myList.length,
        separatorBuilder: (BuildContext context, int index) => new Divider(height: 0,color: Color(0xFFBDBDBD),),
        itemBuilder: (context, index) {
          return new Material( 
            color: Colors.white,
            child: Ink(
              child: InkWell(
                onTap: (){
                  print(index);
                  Navigator.push<String>(
                    context,
                    new PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                          // 跳转的路由对象
                          return new Listmore(index:index);
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return _ListbodyMaterialState
                          .createTransition(animation, child);
                    })
                  );
                },
                child:Listbody(index: index,),
              ),
            ),
          );
        }
      )
    );
  }
}

class Listbody extends StatefulWidget {
  Listbody({Key key, this.index}) : super(key: key);
  final int index;
  @override
  _ListbodyState createState() {
    return _ListbodyState();
  }
}
class _ListbodyState extends State<Listbody> {
  Widget states=Text("等待付款中……",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),);
  void statespull(){
    if (GlobalList.youList[this.widget.index].state==1) {
      states = Text("等待付款中……",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),);
    }
    if (GlobalList.youList[this.widget.index].state==2) {
      states = Text("已付款，等待平台确认……",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),);
    }
    if (GlobalList.youList[this.widget.index].state==3) {
      states = Text("订单已完成",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.green),);
    }
  }
  @override
  Widget build(BuildContext context) {
    statespull();
    return new Container(
      padding: new EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                states,
                Icon(Icons.keyboard_arrow_right,color: Color(0xFFE0E0E0),size: 20.0),
              ],
            ),
          ),
          Container(
            height: 90,
            child:Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  child: Image.asset(
                    GlobalList.myList[this.widget.index].image,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    alignment: Alignment.topLeft,
                    child:Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment:Alignment.topLeft,
                            child:Wrap(
                              // alignment: WrapAlignment.end,
                              children: <Widget>[
                                Text(
                                  GlobalList.myList[this.widget.index].name,
                                  style: new TextStyle(fontSize: 15.0),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 2,
                                ), 
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text("订单号: ${GlobalList.myList[this.widget.index].listindex}",style: TextStyles.TextStyle4(),),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ListbodyMaterialto extends StatefulWidget {
  @override
  _ListbodyMaterialtoState createState() {
    return _ListbodyMaterialtoState();
  }
}
class _ListbodyMaterialtoState extends State<ListbodyMaterialto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true, 
        itemCount: GlobalList.youList.length,
        separatorBuilder: (BuildContext context, int index) => new Divider(height: 0,color: Color(0xFFBDBDBD),),
        itemBuilder: (context, index) {
          return new Material( 
            color: Colors.white,
            child: Ink(
              child: InkWell(
                onTap: (){
                  print(index);
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new Details()),
                  );
                },
                child:Listbodyto(index: index,),
              ),
            ),
          );
        }
      )
    );
  }
}

class Listbodyto extends StatefulWidget {
  Listbodyto({Key key, this.index}) : super(key: key);
  final int index;
  @override
  _ListbodytoState createState() {
    return _ListbodytoState();
  }
}
class _ListbodytoState extends State<Listbodyto> {
  Widget states=Text("已报价，等待确认……",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),);
  void statespull(){
    if (GlobalList.youList[this.widget.index].state==1) {
      states = Text("已报价，等待确认……",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),);
    }
    if (GlobalList.youList[this.widget.index].state==2) {
      states = Text("等待付款中……",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),);
    }
    if (GlobalList.youList[this.widget.index].state==3) {
      states = Text("已付款，等待平台确认……",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),);
    }
    if (GlobalList.youList[this.widget.index].state==4) {
      states = Text("订单已完成……",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.green),);
    }
  }
  @override
  Widget build(BuildContext context) {
    statespull();
    return new Container(
      padding: new EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                states,
                Icon(Icons.keyboard_arrow_right,color: Color(0xFFE0E0E0),size: 20.0),
              ],
            ),
          ),
          Container(
            height: 90,
            child:Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 70,
                  child: Image.asset(
                    GlobalList.youList[this.widget.index].image,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    alignment: Alignment.topLeft,
                    child:Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment:Alignment.topLeft,
                            child:Wrap(
                              // alignment: WrapAlignment.end,
                              children: <Widget>[
                                Text(
                                  GlobalList.youList[this.widget.index].name,
                                  style: new TextStyle(fontSize: 15.0),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 2,
                                ), 
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text("订单号: ${GlobalList.youList[this.widget.index].listindex}",style: TextStyles.TextStyle4(),),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Listmore extends StatefulWidget {
  Listmore({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _ListmoreState createState() {
    return _ListmoreState();
  }
}
class _ListmoreState extends State<Listmore> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Text("订单详情"),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Interval_space(),
          ListmoreBody(index:this.widget.index)
        ],
      )
    );
  }
}

class ListmoreBody extends StatefulWidget {
  ListmoreBody({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _ListmoreBodyState createState() {
    return _ListmoreBodyState();
  }
}
class _ListmoreBodyState extends State<ListmoreBody> {
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
    return new Container(
      child: Column(
        children: <Widget>[
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
                          return new Users(index: this.widget.index,);
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return _ListmoreBodyState
                          .createTransition(animation, child);
                    })
                  );
                },
                child:Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("适能旗舰店",style: TextStyle(fontSize: 13.0 ),),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child:Icon(Icons.keyboard_arrow_right,color: Color(0xFFE0E0E0),size: 25.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                          return new Details();
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return _ListmoreBodyState
                          .createTransition(animation, child);
                    })
                  );
                },
                child:Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  height: 90,
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 70,
                        height: 70,
                        child: Image.asset(
                          GlobalList.myList[this.widget.index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          alignment: Alignment.topLeft,
                          child:Flex(
                            direction: Axis.vertical,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment:Alignment.topLeft,
                                  child:Wrap(
                                    // alignment: WrapAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        GlobalList.myList[this.widget.index].name,
                                        style: new TextStyle(fontSize: 15.0),
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        maxLines: 2,
                                      ), 
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text("订单号: ${GlobalList.myList[this.widget.index].listindex}",style: TextStyles.TextStyle4(),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        alignment: Alignment.bottomRight,
                        child: OutlineButton(
                          child: Text("删除订单",style: TextStyle(fontSize: 14),),
                          onPressed: (){},
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
          Container(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),color: Colors.white,),
          new Divider(height: 0,),
          ListmoreBodyMore(),
          new Divider(height: 0,),
        ],
      ),
    );
  }
}


class ListmoreBodyMore extends StatefulWidget {
  @override
  _ListmoreBodyMoreState createState() {
    return _ListmoreBodyMoreState();
  }
}
class _ListmoreBodyMoreState extends State<ListmoreBodyMore> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('类型: ',style: new TextStyle(fontSize: 14.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('供应资源',style: new TextStyle(fontSize: 15.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('订单总价: ',style: new TextStyle(fontSize: 14.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('¥ 100.0',style: new TextStyle(fontSize: 15.0,color: Colors.red),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('实付金额: ',style: new TextStyle(fontSize: 14.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('¥ 100.0',style: new TextStyle(fontSize: 15.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('品种: ',style: new TextStyle(fontSize: 14.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('不锈钢类',style: new TextStyle(fontSize: 15.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('数量: ',style: new TextStyle(fontSize: 14.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('20吨',style: new TextStyle(fontSize: 15.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('下单时间: ',style: new TextStyle(fontSize: 14.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('2019-10-25 10:11:45',style: new TextStyle(fontSize: 15.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('交货地点: ',style: new TextStyle(fontSize: 14.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('浙江省 宁波市',style: new TextStyle(fontSize: 15.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('资源性质: ',style: new TextStyle(fontSize: 14.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('回收商废料',style: new TextStyle(fontSize: 15.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}