import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/Details/Details.dart';

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
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new Details()),
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