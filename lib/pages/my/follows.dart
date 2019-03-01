import 'package:flutter/material.dart';
import 'package:metal/pages/my/user.dart';
import 'package:metal/data/global_config.dart';

class Follows extends StatefulWidget {
  Follows({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _FollowsState createState() {
    return _FollowsState();
  }
}
class _FollowsState extends State<Follows> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('${GlobalMy.myFollow[this.widget.index].name}的粉丝'),
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child:ListView(
          children: <Widget>[
            FollowsbodyMaterial(),
            new Divider(height: 0,)
          ],
        )
      ),
    );
  }
}

class FollowsbodyMaterial extends StatefulWidget {
  @override
  _FollowsbodyMaterialState createState() {
    return _FollowsbodyMaterialState();
  }
}
class _FollowsbodyMaterialState extends State<FollowsbodyMaterial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true, 
        itemCount: GlobalMy.myFollow.length,
        separatorBuilder: (BuildContext context, int index) => new Divider(height: 0,color: Color(0xFFBDBDBD),),
        itemBuilder: (context, index) {
          return new Material( 
            color: Colors.white,
            child: Ink(
              child: InkWell(
                onTap: (){
                  print(index);
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new Users(index:index)),
                  );
                },
                child:Container(
                  padding: new EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 40,
                        child:Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            new CircleAvatar(
                              backgroundImage: new AssetImage(GlobalMy.myFollow[index].image),
                              radius: 15,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(GlobalMy.myFollow[index].name,style: TextStyle(fontSize: 16.0,),overflow: TextOverflow.ellipsis,maxLines: 3,),
                                  ],
                                )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ),
            ),
          );
        }
      )
    );
  }
}

class Followsme extends StatefulWidget {
  Followsme({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _FollowsmeState createState() {
    return _FollowsmeState();
  }
}
class _FollowsmeState extends State<Followsme> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('我的粉丝'),
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child:ListView(
          children: <Widget>[
            FollowsbodyMaterial(),
            new Divider(height: 0,)
          ],
        )
      ),
    );
  }
}

class FollowsmebodyMaterial extends StatefulWidget {
  @override
  _FollowsmebodyMaterialState createState() {
    return _FollowsmebodyMaterialState();
  }
}
class _FollowsmebodyMaterialState extends State<FollowsmebodyMaterial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true, 
        itemCount: GlobalMy.myFollow.length,
        separatorBuilder: (BuildContext context, int index) => new Divider(height: 0,color: Color(0xFFBDBDBD),),
        itemBuilder: (context, index) {
          return new Material( 
            color: Colors.white,
            child: Ink(
              child: InkWell(
                onTap: (){
                  print(index);
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new Users(index:index)),
                  );
                },
                child:Container(
                  padding: new EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 40,
                        child:Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            new CircleAvatar(
                              backgroundImage: new AssetImage(GlobalMy.myFollow[index].image),
                              radius: 15,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(GlobalMy.myFollow[index].name,style: TextStyle(fontSize: 16.0,),overflow: TextOverflow.ellipsis,maxLines: 3,),
                                  ],
                                )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ),
            ),
          );
        }
      )
    );
  }
}