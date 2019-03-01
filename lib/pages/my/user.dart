import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/my/login.dart';
import 'package:metal/pages/Details/Details.dart';
import 'package:metal/pages/my/follows.dart';
import 'package:metal/pages/message/chat.dart';

class Users extends StatefulWidget {
  Users({Key key, this.index}) : super(key: key);
  final int index;

  @override
  State<StatefulWidget> createState() {
    return new UsersPagerState();
  }
}

class UsersPagerState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      ),
      body:ListView(
        children: <Widget>[
          UserHeader(indexH: this.widget.index,),
          UserBody(indexB: this.widget.index,),
          UserPull(),
          new Divider(height: 0,),
          UserPullbody(),
          new Divider(height: 0,),
        ]
      )
    );
  }
}

class UserHeader extends StatefulWidget {
  UserHeader({Key key, this.indexH}) : super(key: key);
  final int indexH;

  @override
  State<StatefulWidget> createState() {
    return new UserHeaderState();
  }
}

class UserHeaderState extends State<UserHeader> {
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
                    backgroundImage: new AssetImage(GlobalMy.myFollow[this.widget.indexH].image),
                    radius: 35,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(GlobalMy.myFollow[this.widget.indexH].name,style: TextStyle(fontSize: 16.0),),
                  ),
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

class UserBody extends StatefulWidget {
  UserBody({Key key, this.indexB}) : super(key: key);
  final int indexB;

  @override
  State<StatefulWidget> createState() {
    return new UserBodyState();
  }
}

class UserBodyState extends State<UserBody> {
  static Icon collectionBefor = Icon(Icons.star_border,size: 25.0,);
  static Icon collectionAfter = Icon(Icons.star,size: 24.0,color: Colors.blue,);
  static Icon collection;

  @override
  Widget build(BuildContext context) {
    collection = GlobalMy.myFollow[this.widget.indexB].follows?collectionAfter:collectionBefor;
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
                    GlobalMy.myFollow[this.widget.indexB].follows?
                      gosub("你确定要取关${GlobalMy.myFollow[this.widget.indexB].name}吗？",true,this.widget.indexB)
                      :gosub("你确定要关注${GlobalMy.myFollow[this.widget.indexB].name}吗？",false,this.widget.indexB);
                  },
                  child:Column(
                    children: <Widget>[
                      collection,
                      Container(
                        child: Text(
                          GlobalMy.myFollow[this.widget.indexB].follows?'已关注':'关注',
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
                      new MaterialPageRoute(builder: (context) => new Follows(index: this.widget.indexB,)),
                    );
                  },
                  child:Column(
                    children: <Widget>[
                      Icon(
                        Icons.person_pin,
                        color: Colors.green,
                        size: 25.0,
                      ),
                      Container(
                        child: Text('他的粉丝', style: TextStyle(fontSize: 13.0)),
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
                      new MaterialPageRoute(builder: (context) => new ChatRoom(index:this.widget.indexB)),
                    );
                  },
                  child:Column(
                    children: <Widget>[
                      Icon(
                        Icons.chat,
                        color: Colors.orange,
                        size: 25.0,
                      ),
                      Container(
                        child: Text('私信', style: TextStyle(fontSize: 13.0)),
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
        ],
      )
    );
  }
  void gosub(String text,bool select,int index){
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
              setState(() {
                select?GlobalMy.myFollow[index].follows=false:GlobalMy.myFollow[index].follows=true;
                select?collection=collectionBefor:collection=collectionAfter;
              });
            },
          ),
          new FlatButton(
            child: new Text('取消'),
            onPressed: (){
              print("取消");
              Navigator.of(context).pop();
            },
          ),
          ],
        );
      }
    );
  }
}

class UserPull extends StatefulWidget {
  @override
  _UserPullState createState() {
    return _UserPullState();
  }
}

class _UserPullState extends State<UserPull> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      color:Colors.white,
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Container(
            height: 25.0,
            child: Row(
              children: <Widget>[
                Container(color:Colors.blue,width: 4.0,),
                Container(
                  padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                  child: Text('他发布的需求',style: TextStyles.TextStyle2(),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserPullbody extends StatefulWidget {
  @override
  _UserPullbodyState createState() {
    return _UserPullbodyState();
  }
}
class _UserPullbodyState extends State<UserPullbody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.separated(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true, 
        itemCount: 3,
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
                child:PullbodyCard(),
              ),
            ),
          );
        }
      )
    );
  }
}

class PullbodyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      // color: Colors.pink,
      alignment: Alignment.topLeft,
      height: 125.0,
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.blue,
              height: 125.0,
              // padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              child: new Image.asset(
                GlobalSwiper.images[1],
                fit:BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.blue,
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Flex(
                          direction: Axis.horizontal,
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
                                      '眼镜厂废料厂',
                                      style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 2,
                                    ), 
                                  ],
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,color: Color(0xFFE0E0E0),size: 14.0,),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('参考价格',style: TextStyles.TextStyle3(),),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                            ),
                            Text("¥300元/吨",style: new TextStyle(fontSize: 15.0,color: Colors.red),),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('共需',style: TextStyles.TextStyle3(),),
                            Padding(padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),),
                            Text("1000吨",style: new TextStyle(fontSize: 15.0),),
                            Padding(padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),),
                            Text('|',style: TextStyles.TextStyle2(),),
                            Padding(padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),),
                            Text('还需',style: TextStyles.TextStyle3(),),
                            Padding(padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),),
                            Text("500吨",style: new TextStyle(fontSize: 15.0),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('2019-01-01 19:00:00  上海',style: TextStyles.TextStyle4(),),
                      Text('采购资源',style: TextStyles.TextStyle4(),),
                    ],
                  ),
                ],
              ),
            )
          )
        ]
      ),
    );
  }
}