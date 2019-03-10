import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/Details/Details.dart';
import 'package:metal/data/global_home.dart';

String ckjg = "aa";

class Pullbody extends StatefulWidget {
  Pullbody({Key key, this.global}) : super(key: key);

  final String global;
  @override
  _PullbodyState createState() {
    return _PullbodyState();
  }
}
class _PullbodyState extends State<Pullbody> {

  @override
  void initState() {
    super.initState();
    eventBus.on().listen((event) {
      lyb();
    });
  }

  void lyb(){
    if(mounted) {
      setState(() {
        // print("lyb");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: getHomePageContent(urls,cons),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            // child: homePageContent["list"]==null?PullbodyNO():PullBodyYes(),
            child: PullBodyYes(),
          );
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }

        // By default, show a loading spinner
        return new Center(
          child:CircularProgressIndicator()
        );
      }
    );
  }
}

class PullbodyNO extends StatefulWidget {
  @override
  _PullbodyNOState createState() {
    return _PullbodyNOState();
  }
}
class _PullbodyNOState extends State<PullbodyNO> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Center(
        child: Text("目前暂无此类需求",style: TextStyles.TextStyle3(),),
      ),
    );
  }
}

class PullBodyYes extends StatefulWidget {
  @override
  _PullBodyYesState createState() {
    return _PullBodyYesState();
  }
}
class _PullBodyYesState extends State<PullBodyYes> {
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
      child:ListView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true, 
        // separatorBuilder: (BuildContext context, int index) => new Divider(height: 0,color: Color(0xFFBDBDBD),),
        // itemCount: homePageContent["list"].length,
        children: List<Widget>.generate(
          10, (int index) {
          return new Material( 
            color: Colors.white,
            child: Ink(
              child: InkWell(
                onTap: (){
                  setState(() {
                    // cons["pid"] = homePageContent["list"][index]["id"]; 
                  });
                  Navigator.push<String>(
                    context,
                    new PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                          // 跳转的路由对象
                          return new Details(index: index,);
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return _PullBodyYesState
                          .createTransition(animation, child);
                    })
                  );
                },
                child:PullbodyCard(index:index),
              ),
            ),
          );
        }).toList(),
      )
    );
  }
}

class PullbodyCard extends StatelessWidget {
  PullbodyCard({Key key, this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    Paint pg = Paint();
    pg.color = Colors.green;
    Paint tui = Paint();
    tui.color = Colors.blue;
    return new Container(
      alignment: Alignment.topLeft,
      height: 200.0,
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 2,
            child:Container(
              alignment: Alignment.topLeft,
              child:Container(
                height: 120,
                child:Image.asset(
                  "images/star.jpg",
                  fit: BoxFit.cover,
                ),
                decoration: new BoxDecoration(
                  border: new Border.all(width: 1.0, color: Color(0xFFBDBDBD)),
                ),
              )
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child:Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[               
                        Expanded(
                          child:Container(
                            child:RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' 采购 ',
                                    style: TextStyle(fontSize: 13.0,color: Colors.white,background: pg),
                                  ),
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(fontSize: 13.0,color: Colors.white),
                                    children:[
                                      TextSpan(
                                        text: ' 推荐 ',
                                        style: TextStyle(fontSize: 13.0,color: Colors.white,background: tui),
                                      )
                                    ]
                                  ),
                                  TextSpan(
                                    text: ' 收购一切含铜废料购80%以上联系',
                                    style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),
                                  ),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,maxLines: 2
                            )
                          )
                        ),
                      ],
                    )
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 25,
                          width: 25,
                          child:new CircleAvatar(
                            backgroundImage: new NetworkImage("https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58",),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text("蒋家欣",style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold,color: Colors.black),),
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Image.asset(
                            "images/企业认证.png"
                          )
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Text("意向",style: TextStyle(fontSize: 14.0,color: Color(0xFF757575)),),
                        Text("10000.0元/吨",style: new TextStyle(fontSize: 14.0,color: Colors.black,fontWeight: FontWeight.bold),),
                        Padding(padding: EdgeInsets.fromLTRB(6, 0, 0, 0),),
                        Text("需求",style: TextStyle(fontSize: 14.0,color: Color(0xFF757575)),),
                        Expanded(
                          child: Container(
                            child: Text("10吨",style: new TextStyle(fontSize: 14.0,color: Colors.orange,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text("已经",style: TextStyle(fontSize: 14.0,color: Color(0xFF757575)),),
                        Text("1",style: new TextStyle(fontSize: 14.0,color: Colors.blue,fontWeight: FontWeight.bold),),
                        Text("位报价",style: new TextStyle(fontSize: 14.0,color: Color(0xFF757575)),),
                        Padding(padding: EdgeInsets.fromLTRB(6, 0, 0, 0),),
                        Text("还需",style: TextStyle(fontSize: 14.0,color: Color(0xFF757575)),),
                        Expanded(
                          child: Container(
                            child: Text("5吨",style: new TextStyle(fontSize: 14.0,color: Colors.green,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex:3,
                          child:Container(
                            child: Row(
                              children: <Widget>[
                                Container(height: 15,width: 15,child: Image.asset("images/类目.png"),),
                                Expanded(
                                  child:Text(" 不锈钢",style: TextStyle(fontSize: 12.0,color: Color(0xFF757575)),overflow: TextOverflow.ellipsis,),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex:4,
                          child:Container(
                            child: Row(
                              children: <Widget>[
                                Container(height: 15,width: 15,child: Image.asset("images/钱.png"),),
                                Text(" 意向",style: TextStyle(fontSize: 12.0,color: Color(0xFF757575)),),
                                Expanded(
                                  child:Text("10000.0元/吨",style: TextStyle(fontSize: 12.0,color: Color(0xFF757575)),overflow: TextOverflow.ellipsis,),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding:EdgeInsets.fromLTRB(0, 4, 0, 15),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex:3,
                          child:Container(
                            child: Row(
                              children: <Widget>[
                                Container(height: 15,width: 15,child: Image.asset("images/地址.png"),),
                                Expanded(
                                  child:Text(" 浙江 台州",style: TextStyle(fontSize: 12.0,color: Color(0xFF757575)),overflow: TextOverflow.ellipsis,),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex:4,
                          child:Container(
                            child: Row(
                              children: <Widget>[
                                Container(height: 15,width: 15,child: Image.asset("images/时间.png"),),
                                Expanded(
                                  child:Text(" 19/01/27 10:10",style: TextStyle(fontSize: 12.0,color: Color(0xFF757575)),overflow: TextOverflow.ellipsis,),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Divider(height: 0,)
                ],
              ),
            )
          ),
        ]
      ),
    );
  }
}