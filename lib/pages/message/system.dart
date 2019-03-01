import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';

class System extends StatefulWidget {
  @override
  _SystemState createState() {
    return _SystemState();
  }
}
class _SystemState extends State<System> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('系统消息'),
      ),
      body: Container(child: SystemNo(),)
    );
  }
}

class SystemNo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color(0xFFEEEEEE),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.more_horiz,color: Colors.blue,size: 30.0),
            Padding(padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),),
            new Text("目前暂无收到此类消息",style: new TextStyle(fontSize: 20.0),)
          ],
        )
      )
    );
  }
}