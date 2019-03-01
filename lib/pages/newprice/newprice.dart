import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/newprice/chart.dart';

class NewPrice extends StatefulWidget {
  @override
  _NewPriceState createState() {
    return _NewPriceState();
  }
}
class _NewPriceState extends State<NewPrice> {
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
        title: new Text('行情'),
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child:ListView(
          children: <Widget>[
            Select(),
            Interval_space(),
            Price(),
            new Divider(height: 0,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            )
          ],
        )
      ),
    );
  }
}

class Select extends StatefulWidget {
  @override
  _SelectState createState() {
    return _SelectState();
  }
}
class _SelectState extends State<Select> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Divider(height: 0),
          Container(
            height: 25.0,
            child: Row(
              children: <Widget>[
                Container(color:Colors.blue,width: 4.0,),
                Container(
                  padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                  child: Text('选择品种，查看行情',style: TextStyles.TextStyle2(),),
                ),
              ],
            ),
          ),
          new Divider(height: 0,),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            // alignment: Alignment.center,
            child: SelectMetalsOptions(),
          )
        ],
      ),
    );
  }
}

//品种
class SelectMetalsOptions extends StatefulWidget {

  SelectMetalsOptions({Key key, this.callback})
    :super(key: key);
  final callback;

  @override
  _SelectMetalsOptionsState createState() => _SelectMetalsOptionsState();
}
class _SelectMetalsOptionsState extends State<SelectMetalsOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
        child:Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: List<Widget>.generate(
            metals.length, (int index) {
              return Ink(
                width: 85.0,
                height: 40.0,
                child:InkWell(
                  onTap: () {
                    setState(() {
                      List<Widget>.generate(
                        metals.length, (int index) {
                          metals[index].color = false;
                        }
                      ).toList();
                      if (metals[index].color == false) {
                        metals[index].color = true;
                      }
                    });
                    widget.callback(metals[index].text);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child:new Text(
                      metals[index].text,
                      overflow: TextOverflow.ellipsis,
                      style:new TextStyle(
                        fontSize: 14.0,
                        color: metals[index].color==true?Colors.blue:Colors.black,
                      )
                    ),
                    decoration: BoxDecoration(
                      color:Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                )
              );
            },
          ).toList(),
        )
    );
  }
}

class Price extends StatefulWidget {
  @override
  _PriceState createState() {
    return _PriceState();
  }
}
class _PriceState extends State<Price> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 25.0,
            child: Row(
              children: <Widget>[
                Container(color:Colors.blue,width: 4.0,),
                Container(
                  padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                  child: Text('电线电缆',style: new TextStyle(fontSize: 15.0,color: Color(0xFF424242),fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
          new Divider(height: 0,),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child:Column(
                          children: <Widget>[
                            Container(
                              child: Container(
                                child: Text('均价(万元/吨)',style: TextStyles.TextStyle3(),),
                              ),
                            ),
                            Padding(padding: new EdgeInsets.fromLTRB(0, 2, 0, 0),),
                            Container( 
                              child: Container(
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('4.42',style: new TextStyle(fontSize: 20,color: Colors.black),overflow:TextOverflow.ellipsis,),
                                  ],
                                )
                              )
                            ),
                          ],  
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child:Column(
                          children: <Widget>[
                            Container(
                              child: Container(
                                child: Text('涨跌',style: TextStyles.TextStyle3(),),
                              ),
                            ),
                            Padding(padding: new EdgeInsets.fromLTRB(0, 2, 0, 0),),
                            Container( 
                              child: Container(
                                child: Text('-500',style: new TextStyle(fontSize: 20.0,color: Colors.red),overflow:TextOverflow.ellipsis,),
                              )
                            ),
                          ],  
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child:Column(
                          children: <Widget>[
                            Container(
                              child: Container(
                                child: Text('成交量(万元)',style: TextStyles.TextStyle3(),),
                              ),
                            ),
                            Padding(padding: new EdgeInsets.fromLTRB(0, 2, 0, 0),),
                            Container( 
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('200',style: new TextStyle(fontSize: 20.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                                ],
                              )
                            ),
                          ],  
                        )
                      )
                    ],
                  )
                ),
                new Divider(height: 0,),
                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),
                Text("均价(¥)走势",style: TextStyles.TextStyle3(),),
                Container(
                  alignment: Alignment.center,
                  height: 220.0,
                  child:new OrdinalComboBarLineChart.withSampleData()
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),
                new Divider(height: 0,),
                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),
                Text("月成交量(¥)",style: TextStyles.TextStyle3(),),
                Container(
                  // color: Colors.blue,
                  alignment: Alignment.center,
                  height: 220.0,
                  child:new HorizontalBarLabelChart.withSampleData()
                ),
              ],
            )
          ),
          new Divider(height: 0,color: Color(0xFFBDBDBD),),
        ],
      ),
    );
  }
}