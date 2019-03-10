import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'dart:async';
import 'package:metal/pages/message/chat.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:metal/data/global_home.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:metal/pages/Details/video.dart';
import 'package:metal/pages/my/user.dart';

bool type = true;
bool typeoffer = true;
var varietys = "";

class Details extends StatefulWidget {
  Details({Key key, this.index}) : super(key: key); 
  final int index;

  @override
  _DetailsState createState() {
    return _DetailsState();
  }
}
class _DetailsState extends State<Details> {
  fluwx.WeChatScene scene = fluwx.WeChatScene.SESSION;
  String _result = "无";
  _initFluwx() async{
    await fluwx.register(appId: "wxf0d41be8d1e4189a", doOnAndroid: true, doOnIOS: true, enableMTA: false);
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");
  }
  void initState() { 
    super.initState();
    // setState(() {
    //   cons["pid"] = "2";
    //   print(cons);
    //   if (homePageContent["list"][this.widget.index]["tid"]=="1") {
    //     type=true;
    //   }else{
    //     type=false;
    //   }
    //   if (homePageContent["offer"]!=null) {
    //     typeoffer=true;
    //   }else{
    //     typeoffer=false;
    //   }
    // });
    _initFluwx();
    fluwx.responseFromAuth.listen((data) {
      setState(() {
        _result = "${data.errCode}";
      });
    });
    // List<Widget>.generate(
    //   homePageContent["variety"].length, (int index) {
    //     if(homePageContent["variety"][index]["id"]==homePageContent["list"][this.widget.index]["variety"]){
    //       varietys = homePageContent["variety"][index]["name"];
    //     }
    //   }
    // );
  }

  String _text = "share text from fluwx";
  void _shareText() {
    fluwx
        .share(fluwx.WeChatShareTextModel(
            text: _text,
            transaction: "text${DateTime.now().millisecondsSinceEpoch}",
            scene: scene))
        .then((data) {
      print(data);
    });
  }

  void handleRadioValueChanged(fluwx.WeChatScene scene) {
    setState(() {
      this.scene = scene;
    });
  }

  bool imgorvideo = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,     
        title: new Text('需求详情'),
        actions: <Widget>[
          new IconButton(icon: new Icon(IconData(0xe653,fontFamily: "Schylers"),size: 25,), onPressed:(){
            fluwx.share(fluwx.WeChatShareTextModel(
                text: "text from fluwx",
                transaction: "transaction}",//仅在android上有效，下同。
                scene: scene
              ));
          }),
        ],
      ),
      body: 
        Container(
          color: Color(0xFFEEEEEE),
          child:ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  imgorvideo?Video():SwiperPages(index: this.widget.index,),
                  Positioned(
                    left: 90.0,
                    child: Row(
                      children: <Widget>[
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: Text("图片"),
                              color: imgorvideo?Colors.grey:Color(0xFF245399),
                              textColor: Colors.white,
                              onPressed: (){
                                setState(() {
                                  imgorvideo=false;
                                });
                              },
                            ),
                            FlatButton(
                              child: Text("视频"),
                              color: imgorvideo?Color(0xFF245399):Colors.grey,
                              textColor: Colors.white,
                              onPressed: (){
                                setState(() {
                                  imgorvideo=true;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    )
                  ),
                ]
              ),
              Detailsheader(index: this.widget.index,),
              Interval_space(),
              DetailsMore(index: this.widget.index,),
              Interval_space(),
              DetailsMoreTwo(index: this.widget.index,),
              typeoffer?
              new FutureBuilder(
                future: getHomePageContent(urls,cons),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DetailsTable();
                  } else if (snapshot.hasError) {
                    return new Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner
                  return new Center(
                    child:CircularProgressIndicator()
                  );
                }
              )
              :Container(),
            ],
          )
        ),
      bottomNavigationBar: DemoBottomAppBar()
    );
  }
}

class DemoBottomAppBar extends StatefulWidget {
  @override
  _DemoBottomAppBarState createState() {
    return _DemoBottomAppBarState();
  }
}
class _DemoBottomAppBarState extends State<DemoBottomAppBar> {
  static Icon collectionBefor = Icon(Icons.star_border,size: 24.0,);
  static Icon collectionAfter = Icon(Icons.star,size: 24.0,color: Color(0xFF245399),);
  static Icon collection = collectionBefor;

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowContents = <Widget> [
      Container(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        width: MediaQuery.of(context).size.width,
        // color: Colors.blue,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Icon(Icons.chat,size: 24.0,),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('聊天',style: new TextStyle(fontSize: 11.0),)
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute(builder: (context) => new ChatRoom(index: 3,)),
                      );
                    },
                  ),
                  IconButton(
                    icon: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Icon(Icons.phone,size: 24.0,),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('电话',style: new TextStyle(fontSize: 11.0),)
                        )
                      ],
                    ),
                    onPressed: () {
                      showDialog<Null>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                        return new AlertDialog(
                          title: new Text('确定要拨打客服电话吗？', style: new TextStyle(fontSize: 17.0)),
                          actions: <Widget>[
                          new FlatButton(
                            child: new Text('取消'),
                            onPressed: (){
                              print("取消");
                              Navigator.of(context).pop();
                            },
                          ),
                          new FlatButton(
                            child: new Text('确定'),
                            onPressed: (){
                              _launch();
                              Navigator.of(context).pop();
                            },
                          )
                          ],
                        );
                        }
                      );
                    },
                  ),
                  IconButton(
                    icon: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: collection,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('收藏',style: new TextStyle(fontSize: 11.0),)
                        )
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        if (collection!=collectionAfter) {
                          collection = collectionAfter;
                        }else{
                          collection = collectionBefor;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            type?BuyButton():SellButton(),
          ],
        ),
      )
    ];
    return BottomAppBar(
      color: Colors.white,
      child: Row(children: rowContents),
    );
  }
  _launch() async {
    const tel = "tel:+1 555 010 999";
    if (await canLaunch(tel)) {
      await launch(tel);
    } else {
      throw 'Could not launch $tel';
    }
  }
}

class BuyButton extends StatefulWidget {
  @override
  _BuyButtonState createState() {
    return _BuyButtonState();
  }
}
class _BuyButtonState extends State<BuyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:FlatButton(
        color: Color(0xFF245399),
        child: Container(
          padding: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
          child: Text("报价",style: new TextStyle(fontSize: 18.0,color: Colors.white),),
        ),
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) => new DBodyhigh()),
          );
        },
      ),
    );
  }
}

class SellButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:FlatButton(
        color: Color(0xFF245399),
        child: Container(
          padding: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
          child: Text("下单",style: new TextStyle(fontSize: 18.0,color: Colors.white),),
        ),
        onPressed: () {
          Future(() => showModalBottomSheet(
            context: context,
            builder: (context) {
            return ModalBottomSheet();
          }));
        },
      ),
    );
  }
}

class ModalBottomSheet extends StatefulWidget {
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet>
with SingleTickerProviderStateMixin {
  var heightOfModalBottomSheet = 100.0;
  var aa = "a";

  Widget build(BuildContext context) {
    return Container(
      height: heightOfModalBottomSheet,
      child: RaisedButton(
      child: Text(aa),
      onPressed: () {
      setState(() {aa = "bb";});
      }),
    );
  }
}

class Detailsheader extends StatefulWidget {
  Detailsheader({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _DetailsheaderState createState() {
    return _DetailsheaderState();
  }
}
class _DetailsheaderState extends State<Detailsheader> {
  @override
  Widget build(BuildContext context) {
    Paint pg = Paint();
    pg.color = Colors.green;
    Paint tui = Paint();
    tui.color = Colors.blue;
    return new Container(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
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
                            text: ' 收购一切含铜废料购80%以上联系收购一切含铜废料购80%以上联系收购一切含铜废料购80%以上联系收购一切含铜废料购80%以上联系收购一切含铜废料购80%以上联系',
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
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('意向价格 ',style: TextStyles.TextStyle4(),),
                    Text("¥100元/吨",style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.red),),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              children: <Widget>[
                Text("已经",style: TextStyles.TextStyle4(),),
                Text("1",style: new TextStyle(fontSize: 14.0,color: Colors.blue,fontWeight: FontWeight.bold),),
                Text("位报价",style: TextStyles.TextStyle4(),),
                Padding(padding: EdgeInsets.fromLTRB(6, 0, 0, 0),),
                Text("还需",style: TextStyles.TextStyle4(),),
                Expanded(
                  child: Container(
                    child: Text("5吨",style: new TextStyle(fontSize: 14.0,color: Colors.green,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.people,color: Color(0xFFdbdbdb),size: 15.0,),
                        Text(' 浏览: 10',style: TextStyles.TextStyle4(),)
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(height: 15,width: 15,child: Image.asset("images/地址.png"),),
                        Text(' 浙江 台州',style: TextStyles.TextStyle4(),)
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(height: 15,width: 15,child: Image.asset("images/时间.png"),),
                        Text(' 19/01/27',style: TextStyles.TextStyle4(),)
                      ],
                    ),
                  )
                ),
              ],
            )
          ),
          new Divider(height: 0,),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Icon(IconData(0xe648,fontFamily: "Schylers"),size: 40,color: Color(0xFF757575),),
                        Text("信息已审查",style: TextStyle(fontSize: 13,color:Color(0xFF757575) ),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: Icon(IconData(0xe602,fontFamily: "Schylers"),size: 40,color: Color(0xFF757575),),
                        ),
                        Text("企业会员",style: TextStyle(fontSize: 13,color:Color(0xFF757575) ),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Icon(IconData(0xe649,fontFamily: "Schylers"),size: 40,color: Color(0xFF757575),),
                        Text("1人供应",style: TextStyle(fontSize: 13,color:Color(0xFF757575) ),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Icon(IconData(0xe907,fontFamily: "Schylers"),size: 40,color: Color(0xFF757575),),
                        Text("需要检验",style: TextStyle(fontSize: 13,color:Color(0xFF757575) ),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Icon(IconData(0xe614,fontFamily: "Schylers"),size: 40,color: Color(0xFF757575),),
                        Text("电话联系",style: TextStyle(fontSize: 13,color:Color(0xFF757575) ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsMoreTwo extends StatefulWidget {
  DetailsMoreTwo({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _DetailsMoreTwoState createState() {
    return _DetailsMoreTwoState();
  }
}
class _DetailsMoreTwoState extends State<DetailsMoreTwo> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Divider(height: 0,),
          Container(
            height: 25.0,
            child: Row(
              children: <Widget>[
                Container(color:Color(0xFF245399),width: 4.0,),
                Container(
                  padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                  child: Text('产品详情',style: TextStyles.TextStyle2(),),
                ),
              ],
            ),
          ),
          new Divider(height: 0,),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0,10.0),
                  child:Wrap(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Text(
                        // homePageContent["list"][this.widget.index].toString(),
                        "需要满80%以后收购",
                        style: new TextStyle(fontSize: 15.0,color: Color(0XFF424242)),
                        overflow:TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      // Text(
                      //   homePageContent["list"][this.widget.index]["click"].toString(),
                      //   // homePageContent["list"][this.widget.index]["content_word"]==null?"":homePageContent["list"][this.widget.index]["content_word"],
                      //   style: new TextStyle(fontSize: 15.0,color: Color(0XFF424242)),
                      //   // overflow:TextOverflow.ellipsis,
                      //   // maxLines: 3,
                      // ),
                    ],
                  )
                ),
                new Divider(height: 0,),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child:Wrap(
                    direction: Axis.horizontal,
                    children: List<Widget>.generate(
                      2
                      , (int index) {
                      return Image.network(
                        "$urler${homePageContent["ad"][index]["pathname"].toString()}",
                      );
                      },
                    ).toList(),
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

class DetailsMore extends StatefulWidget {
  DetailsMore({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _DetailsMoreState createState() {
    return _DetailsMoreState();
  }
}
class _DetailsMoreState extends State<DetailsMore> {
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
      color:Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Divider(height: 0,),
          Container(
            height: 25.0,
            child: Row(
              children: <Widget>[
                Container(color:Color(0xFF245399),width: 4.0,),
                Container(
                  padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                  child: Text('产品说明',style: TextStyles.TextStyle2(),),
                ),
              ],
            ),
          ),
          new Divider(height: 0,),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0.0),
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
                          child: Text('品种',style: new TextStyle(fontSize: 15,color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Text("铜废料",style: new TextStyle(fontSize: 15.0,color: Color(0xFF616161)),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                new Divider(height: 15,),
                Container(
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('品名',style: new TextStyle(fontSize: 15,color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Text("金属",style: new TextStyle(fontSize: 15.0,color: Color(0xFF616161)),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                new Divider(height: 15,),
                Container(
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('品位',style: new TextStyle(fontSize: 15,color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Text("废铜",style: new TextStyle(fontSize: 15.0,color: Color(0xFF616161)),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                new Divider(height: 15,),
                Container(
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('意向价格',style: new TextStyle(fontSize: 15,color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Text("¥100元/吨",style: new TextStyle(fontSize: 15.0,color: Color(0xFF616161)),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                new Divider(height: 15,),
                Container(
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('需求数量',style: new TextStyle(fontSize: 15,color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Text('100吨',style: new TextStyle(fontSize: 15.0,color: Color(0xFF616161)),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                new Divider(height: 15,),
                Container(
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('截止时间',style: new TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Text("19/05/27 10:10",style: new TextStyle(fontSize: 15.0,color: Color(0xFF616161),fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                new Divider(height: 15,),
                Container(
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('发布时间',style: new TextStyle(fontSize: 15,color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Text("19/01/27 10:10",style: new TextStyle(fontSize: 15.0,color: Color(0xFF616161)),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                new Divider(height: 15,),
                Container(
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('交货地点',style: new TextStyle(fontSize: 15,color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Text('浙江省 台州市 椒江区',style: new TextStyle(fontSize: 15.0,color: Color(0xFF616161)),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                new Divider(height: 15,),
                Material(
                  // color: Colors.white,
                  child: Ink(
                    child: InkWell(
                      onTap: (){
                        Navigator.push<String>(
                          context,
                          new PageRouteBuilder(pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                                // 跳转的路由对象
                                return new Users(index: 1,);
                          }, transitionsBuilder: (
                            BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child,
                          ) {
                            return _DetailsMoreState
                                .createTransition(animation, child);
                          })
                        );
                      },
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child:new CircleAvatar(
                                      backgroundImage: new NetworkImage("https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58",),
                                    ),
                                  ),
                                  Container(
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          child: Text("蒋家欣",style: TextStyle(fontSize: 15,color: Colors.black),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10, 4, 0, 0),
                                          child: Text("适能旗舰店",style: TextStyle(fontSize: 13.0,color: Colors.black),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_right,color: Color(0xFFE0E0E0),size: 20,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),)
              ],
            )
          ),
        ],
      ),
    );
  }
}

class DetailsTable extends StatefulWidget {
  @override
  _DetailsTableState createState() {
    return _DetailsTableState();
  }
}
class _DetailsTableState extends State<DetailsTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Interval_space(),
          Container(
            height: 25.0,
            child: Row(
              children: <Widget>[
                Container(color:Color(0xFF245399),width: 4.0,),
                Container(
                  padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                  child: Text('报价列表',style: TextStyles.TextStyle2(),),
                ),
              ],
            ),
          ),
          new Divider(height: 0,),
          new Container(
            child: new ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true, 
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        child: Ink(
                          child: InkWell(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          height: 35,
                                          width: 35,
                                          child:new CircleAvatar(
                                            backgroundImage: new NetworkImage("https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58",),
                                          ),
                                        ),
                                        Container(
                                          child:Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                child: Text("蒋家欣",style: TextStyle(fontSize: 13,color: Colors.black),),
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(10, 4, 0, 0),
                                                child: Text("适能旗舰店",style: TextStyle(fontSize: 11.0,color: Colors.black),),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          child: Row(
                                            children: <Widget>[
                                              Text("供应",style: TextStyle(fontSize: 13,color: Colors.black),),
                                              Text("5",style: TextStyle(fontSize: 13,color: Colors.blue),),
                                              Text("吨",style: TextStyle(fontSize: 13,color: Colors.black),),
                                            ],
                                          )
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10, 4, 0, 0),
                                          child: Text("19/10/01 10:10",style: TextStyle(fontSize: 11.0,color: Colors.black),),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    child: Text("已检验",style: TextStyle(fontSize: 14,color: Colors.white),),
                                    color: Colors.green,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                new Divider(height: 0,),
                new Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        child: Ink(
                          child: InkWell(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          height: 35,
                                          width: 35,
                                          child:new CircleAvatar(
                                            backgroundImage: new NetworkImage("https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58",),
                                          ),
                                        ),
                                        Container(
                                          child:Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                child: Text("任一腾",style: TextStyle(fontSize: 13,color: Colors.black),),
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(10, 4, 0, 0),
                                                child: Text("新能源公司",style: TextStyle(fontSize: 11.0,color: Colors.black),),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          child: Row(
                                            children: <Widget>[
                                              Text("供应",style: TextStyle(fontSize: 13,color: Colors.black),),
                                              Text("10",style: TextStyle(fontSize: 13,color: Colors.blue),),
                                              Text("吨",style: TextStyle(fontSize: 13,color: Colors.black),),
                                            ],
                                          )
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10, 4, 0, 0),
                                          child: Text("19/10/01 10:12",style: TextStyle(fontSize: 11.0,color: Colors.black),),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    child: Text("未检验",style: TextStyle(fontSize: 14,color: Colors.white),),
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}

final _controllerbj = TextEditingController();
final _controllerkc = TextEditingController();
final _controllersm = TextEditingController();

class DBodyhigh extends StatefulWidget {
  @override
  _DBodyhighState createState() {
    return _DBodyhighState();
  }
}
class _DBodyhighState extends State<DBodyhigh> {
    Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("填写报价信息"),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Text("提交"),
            onPressed: (){
              if (_controllerbj.text=="") {
                gosubit("报价不能为空",context);
              }else{
                if (_controllerkc.text=="") {
                  gosubit("库存不能为空",context);
                }else{
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new Details()),
                  );
                }
              }
            },
          )
        ],
      ),
      body:DBody()
    );
    }
}

class DBody extends StatefulWidget {
  @override
  _DBodyState createState() {
    return _DBodyState();
  }
}
class _DBodyState extends State<DBody> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true, 
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Container(
                // padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: new Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: _controllerbj,
                              keyboardType: TextInputType.number,
                              onChanged: (String text){
                                setState(() {
                                });
                              },
                              decoration: const InputDecoration(
                                prefixIcon:Icon(IconData(0xe604,fontFamily: "Schylers"),size: 24,),
                                labelText: '报价',
                                labelStyle: TextStyle(fontSize: 15.0),
                                border: InputBorder.none,
                              ),
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: new Text("元/吨",style: new TextStyle(fontSize: 16,color: Colors.grey),)
                          )
                        ],
                      ),
                    ),
                    new Divider(height: 0,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: TextField(
                              controller: _controllerkc,
                              keyboardType: TextInputType.number,
                              onChanged: (String text){
                                setState(() {
                                });
                              },
                              decoration: const InputDecoration(
                                prefixIcon:Icon(IconData(0xe88f,fontFamily: "Schylers"),size: 26,),
                                labelText: '库存',
                                labelStyle: TextStyle(fontSize: 15.0),
                                border: InputBorder.none,
                              ),
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: new Text("吨",style: new TextStyle(fontSize: 16,color: Colors.grey),)
                          )
                        ],
                      ),
                    ),
                    new Divider(height: 0,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                      child: TextField(
                        controller: _controllersm,
                        maxLength: 30,
                        maxLines: 2,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon:Icon(Icons.more),
                          labelText: '说明',
                          labelStyle: TextStyle(fontSize: 15.0),
                          border: InputBorder.none,
                        ),
                        onChanged: (text){
                          setState(() {
                          //  moreValue = text; 
                          });
                        },
                      ),
                    ),
                    new Divider(height: 0,),
                  ]
                ),
              ),
              ],
            ),
          )
        ]
      )
    );
  }
}
