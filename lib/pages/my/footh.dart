import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/Details/Details.dart';

class Footh extends StatefulWidget {
  @override
  _FoothState createState() {
    return _FoothState();
  }
}
class _FoothState extends State<Footh> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('我的足迹'),
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child:ListView(
          children: <Widget>[
            FoothbodyMaterial(),
          ],
        )
      ),
    );
  }
}

class FoothbodyMaterial extends StatefulWidget {
  @override
  _FoothbodyMaterialState createState() {
    return _FoothbodyMaterialState();
  }
}
class _FoothbodyMaterialState extends State<FoothbodyMaterial> {
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
                    new MaterialPageRoute(builder: (context) => new Details()),
                  );
                },
                child:Foothbody(),
              ),
            ),
          );
        }
      )
    );
  }
}

class Foothbody extends StatefulWidget {
  @override
  _FoothbodyState createState() {
    return _FoothbodyState();
  }
}
class _FoothbodyState extends State<Foothbody> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("采购资源",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
          Container(
            height: 90,
            child:Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  child: Image.asset(
                    "images/sea.png",
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
                                  '眼镜厂废料厂眼镜厂废料厂眼镜厂废料厂眼镜厂废料厂眼镜厂废料厂眼镜厂废料厂眼镜厂废料厂',
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
                          child: Text('2019-01-01 19:00:00',style: TextStyles.TextStyle4(),),
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