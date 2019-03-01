import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/Details/Details.dart';

class Collect extends StatefulWidget {
  @override
  _CollectState createState() {
    return _CollectState();
  }
}
class _CollectState extends State<Collect> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('我的收藏'),
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child:ListView(
          children: <Widget>[
            CollectbodyMaterial(),
          ],
        )
      ),
    );
  }
}

class CollectbodyMaterial extends StatefulWidget {
  @override
  _DCollectbodyMaterialState createState() {
    return _DCollectbodyMaterialState();
  }
}
class _DCollectbodyMaterialState extends State<CollectbodyMaterial> {
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
                child:Collectbody(),
              ),
            ),
          );
        }
      )
    );
  }
}

class Collectbody extends StatefulWidget {
  @override
  _CollectbodyState createState() {
    return _CollectbodyState();
  }
}
class _CollectbodyState extends State<Collectbody> {
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("眼镜厂废料眼镜厂废料眼镜厂废料眼镜厂废料眼镜厂废料",style: TextStyle(fontSize: 16.0,),overflow: TextOverflow.ellipsis,maxLines: 3,),
                      ],
                    )
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