import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';

class ListGo extends StatefulWidget {
  @override
  _ListGoState createState() {
    return _ListGoState();
  }
}
class _ListGoState extends State<ListGo> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('充值'),
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child:ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextField(
                      controller: _controller,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: '¥ 请输入充值金额',
                        labelStyle: TextStyle(fontSize: 15.0),
                        border: InputBorder.none,
                      ),
                      onChanged: (String text){
                        setState(() {
                        });
                      },
                    ),
                  ),
                  new Divider(height: 0,),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child:Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child:FlatButton(
                            onPressed: (){
                              if (_controller.text=="") {
                                gosubit("请输入充值金额",context);
                              }
                            },
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  "images/zfb.png",
                                  height: 55,
                                ),
                                Container(
                                  child: Text("使用支付宝支付",style: TextStyles.TextStyle4(),),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child:FlatButton(
                            onPressed: (){
                              if (_controller.text=="") {
                                gosubit("请输入充值金额",context);
                              }
                            },
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  "images/wx.png",
                                  height: 55,
                                ),
                                Container(
                                  child: Text("使用微信支付",style: TextStyles.TextStyle4(),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: new Divider(height: 0,),
            )
          ],
        )
      ),
    );
  }
}