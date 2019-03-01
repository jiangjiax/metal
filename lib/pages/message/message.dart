import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/message/inside.dart';
import 'package:metal/pages/message/deal.dart';
import 'package:metal/pages/message/system.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() {
    return _MessageState();
  }
}
class _MessageState extends State<Message> {
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
        title: new Text('消息'),
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child:ListView(
          children: <Widget>[
            Messageheader(),
            MessagebodyMaterial(),
          ],
        )
      ),
    );
  }
}

class Messageheader extends StatefulWidget {
  @override
  _MessageheaderState createState() {
    return _MessageheaderState();
  }
}
class _MessageheaderState extends State<Messageheader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment:Alignment.center, 
        children: <Widget>[
          Container(height: 150,),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF64B5F6),
                  Color(0xFF1976D2),
                ],
              ),
            ), 
            child: Text("50条未读消息",style: TextStyle(color: Colors.white,fontSize: 15.0),),
          ),
          Positioned(
            top: 40,
            child:Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child:FlatButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          new MaterialPageRoute(builder: (context) => new Deals()),
                        );
                      },
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            child: Icon(Icons.credit_card,size: 40,color: Colors.white,),
                            backgroundColor: Color(0xFFF9A825),
                            radius: 25,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text("交易消息",style: TextStyles.TextStyle4(),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child:FlatButton(
                  //     onPressed: (){},
                  //     child:Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: <Widget>[
                  //         CircleAvatar(
                  //           child: Icon(Icons.notifications,size: 40,color: Colors.white,),
                  //           backgroundColor: Color(0xFF2E7D32),
                  //           radius: 25,
                  //         ),
                  //         Container(
                  //           padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  //           child: Text("通知消息",style: TextStyles.TextStyle4(),),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    flex: 1,
                    child:FlatButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          new MaterialPageRoute(builder: (context) => new System()),
                        );
                      },
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            child: Icon(Icons.settings,size: 40,color: Colors.white,),
                            backgroundColor: Colors.blue,
                            radius: 25,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text("系统消息",style: TextStyles.TextStyle4(),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),  
        ],
    );
  }
}

class MessagebodyMaterial extends StatefulWidget {
  @override
  _MessagebodyMaterialState createState() {
    return _MessagebodyMaterialState();
  }
}
class _MessagebodyMaterialState extends State<MessagebodyMaterial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true, 
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) => new Divider(height: 0,color: Color(0xFFBDBDBD),),
        itemBuilder: (context, index) {
          return new Material( 
            color: Colors.white,
            child: Ink(
              child: InkWell(
                onTap: (){
                  print(index);
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new Inside()),
                  );
                },
                child:Messagebody(),
              ),
            ),
          );
        }
      )
    );
  }
}

class Messagebody extends StatefulWidget {
  @override
  _MessagebodyState createState() {
    return _MessagebodyState();
  }
}
class _MessagebodyState extends State<Messagebody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 70,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child:Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                child: Image.asset(
                  "images/sea.png",
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("能适旗舰店",style: TextStyle(fontSize: 16.0,),),
                          Text("2019-02-27",style: TextStyle(fontSize: 11.0,color: Color(0XFF9E9E9E),)),
                        ],
                      ),
                      Text("[5条]你好，能适旗舰店。",style: TextStyle(fontSize: 13.0,color: Color(0XFF9E9E9E),)),
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 55,
          top: 5,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 5,
          ),
        )
      ]
    );
  }
}