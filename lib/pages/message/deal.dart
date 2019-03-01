import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/Details/Details.dart';

class Deals extends StatefulWidget {
  @override
  _DealsState createState() {
    return _DealsState();
  }
}
class _DealsState extends State<Deals> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('交易消息'),
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child:ListView(
          children: <Widget>[
            Interval_space(),
            DealsbodyMaterial(),
          ],
        )
      ),
    );
  }
}

class DealsbodyMaterial extends StatefulWidget {
  @override
  _DealsbodyMaterialState createState() {
    return _DealsbodyMaterialState();
  }
}
class _DealsbodyMaterialState extends State<DealsbodyMaterial> {
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
                child:Dealsbody(),
              ),
            ),
          );
        }
      )
    );
  }
}

class Dealsbody extends StatefulWidget {
  @override
  _DealsbodyState createState() {
    return _DealsbodyState();
  }
}
class _DealsbodyState extends State<Dealsbody> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("报价/下单成功",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
              Text("2019-2-11",style: TextStyle(fontSize: 12.0,color: Color(0XFF9E9E9E),)),
            ],
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
                        Text("眼镜厂废料",style: TextStyle(fontSize: 16.0,),overflow: TextOverflow.ellipsis,),
                        Text("订单编号： A111111",style: TextStyle(fontSize: 13.0,color: Color(0XFF9E9E9E),)),
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