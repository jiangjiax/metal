import 'package:flutter/material.dart';
import 'package:metal/pages/my/user.dart';
import 'package:metal/data/global_config.dart';

class Follow extends StatefulWidget {
  @override
  _FollowState createState() {
    return _FollowState();
  }
}
class _FollowState extends State<Follow> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('我的关注'),
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child:ListView(
          children: <Widget>[
            FollowbodyMaterial(),
            new Divider(height: 0,)
          ],
        )
      ),
    );
  }
}

class FollowbodyMaterial extends StatefulWidget {
  @override
  _FollowbodyMaterialState createState() {
    return _FollowbodyMaterialState();
  }
}
class _FollowbodyMaterialState extends State<FollowbodyMaterial> {
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
                        height: 55,
                        child:Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            new CircleAvatar(
                              backgroundImage: new AssetImage(GlobalMy.myFollow[index].image),
                              radius: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(GlobalMy.myFollow[index].name,style: TextStyle(fontSize: 16.0,),overflow: TextOverflow.ellipsis,maxLines: 3,),
                                    Container(
                                      child: Ink(
                                        width: 90.0,
                                        height: 80.0,
                                        child:InkWell(
                                          onTap: () {
                                            GlobalMy.myFollow[index].follows?
                                              gosub("你确定要取关${GlobalMy.myFollow[index].name}吗？",true,index)
                                              :gosub("你确定要关注${GlobalMy.myFollow[index].name}吗？",false,index);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            child:new Text(
                                              GlobalMy.myFollow[index].follows?"已关注":"关注",
                                              overflow: TextOverflow.ellipsis,
                                              style:new TextStyle(
                                                fontSize: 15.0,
                                                color: GlobalMy.myFollow[index].follows?Colors.black:Colors.white,
                                              )
                                            ),
                                            decoration: BoxDecoration(
                                              color:GlobalMy.myFollow[index].follows?Color(0xFFEEEEEE):Colors.blue,
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                          ),
                                        )
                                      ),
                                    ),
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