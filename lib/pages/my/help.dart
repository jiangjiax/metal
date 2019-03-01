import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HelpState();
  }
}

class HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("联系客服"),
        elevation: 0.0,
      ),
      body:ListView(
        children: <Widget>[
          Interval_space(),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child:Column(
              children: <Widget>[
                Container(
                  child:Text("公司简介"),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child:Text("……"),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child:Text("……"),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child:Text("……"),
                ),
              ],
            )
          ),
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
                                Text("客服微信号",style:TextStyle(fontSize: 16.0))
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
                      onTap: (){
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
                      child: Container(
                        height: 60,
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child:Row(children: <Widget>[
                                Text("客服手机号",style:TextStyle(fontSize: 16.0))
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
                                Text("客服公众号",style:TextStyle(fontSize: 16.0))
                              ],)
                            ),
                            Text("XXXXXXXX",style:TextStyle(fontSize: 15.0,color: Color(0xFFBDBDBD))),
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
  _launch() async {
    const tel = "tel:+1 555 010 999";
    if (await canLaunch(tel)) {
      await launch(tel);
    } else {
      throw 'Could not launch $tel';
    }
  }
}