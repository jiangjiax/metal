import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/Details/Details.dart';

class Examine extends StatefulWidget {
  @override
  _ExamineState createState() {
    return _ExamineState();
  }
}
class _ExamineState extends State<Examine> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(     
        elevation: 0.0,
        title: Text('资源检验'),
      ),
      body: ListView(
        children: <Widget>[
          Interval_space(),
          ExamineMaterial(),
          new Divider(height: 0,)
        ],
      )
    );
  }
}

class ExamineMaterial extends StatefulWidget {
  @override
  _ExamineMaterialState createState() {
    return _ExamineMaterialState();
  }
}
class _ExamineMaterialState extends State<ExamineMaterial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true, 
        itemCount: GlobalMy.myex.length,
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
                child:Examinebody(index: index,),
              ),
            ),
          );
        }
      )
    );
  }
}

class Examinebody extends StatefulWidget {
  Examinebody({Key key, this.index}) : super(key: key);
  final int index;
  @override
  _ExaminebodyState createState() {
    return _ExaminebodyState();
  }
}
class _ExaminebodyState extends State<Examinebody> {
  Widget states= Text("等待付款中……",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),);
  void statespull(){
    if (GlobalMy.myex[this.widget.index].state==1) {
      states = Text("等待付款中……",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),);
    }
    if (GlobalMy.myex[this.widget.index].state==2) {
      states = Text("已付款，平台正在检验中……",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),);
    }
    if (GlobalMy.myex[this.widget.index].state==3) {
      states = Text("检验失败，请等待客服联系",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.red),);
    }
    if (GlobalMy.myex[this.widget.index].state==4) {
      states = Text("检验成功",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.green),);
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
                    GlobalMy.myex[this.widget.index].image,
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
                                  GlobalMy.myex[this.widget.index].name,
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
                          child: Text("检验单号: ${GlobalMy.myex[this.widget.index].listindex}",style: TextStyles.TextStyle4(),),
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