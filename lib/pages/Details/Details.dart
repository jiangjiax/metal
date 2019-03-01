import 'package:flutter/material.dart';
import 'package:metal/pages/home/swiper.dart';
import 'package:metal/data/global_config.dart';
import 'dart:async';
import 'package:metal/pages/message/chat.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

bool type = true;

class Details extends StatefulWidget {
  @override
  _DetailsState createState() {
    return _DetailsState();
  }
}
class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(     
        title: new Text('需求详情'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.share), onPressed:(){}),
        ],
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child:ListView(
          children: <Widget>[
            SwiperPages(),
            Detailsheader(),
            Interval_space(),
            DetailsMore(),
            type?DetailsTable():Container(),
          ],
        )
      ),
      bottomNavigationBar: DemoBottomAppBar()
    );
  }
}

class DemoBottomAppBar extends StatefulWidget {
  @override
  _DemoBottomAppBarState createState() {
    return _DemoBottomAppBarState();
  }
}
class _DemoBottomAppBarState extends State<DemoBottomAppBar> {
  static Icon collectionBefor = Icon(Icons.star_border,size: 24.0,);
  static Icon collectionAfter = Icon(Icons.star,size: 24.0,color: Colors.blue,);
  static Icon collection = collectionBefor;

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowContents = <Widget> [
      Container(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        width: MediaQuery.of(context).size.width,
        // color: Colors.blue,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Icon(Icons.chat,size: 24.0,),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('聊天',style: new TextStyle(fontSize: 11.0),)
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute(builder: (context) => new ChatRoom(index: 3,)),
                      );
                    },
                  ),
                  IconButton(
                    icon: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Icon(Icons.phone,size: 24.0,),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('电话',style: new TextStyle(fontSize: 11.0),)
                        )
                      ],
                    ),
                    onPressed: () {
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
                  ),
                  IconButton(
                    icon: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: collection,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('收藏',style: new TextStyle(fontSize: 11.0),)
                        )
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        if (collection!=collectionAfter) {
                          collection = collectionAfter;
                        }else{
                          collection = collectionBefor;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            type?BuyButton():SellButton(),
          ],
        ),
      )
    ];
    return BottomAppBar(
      color: Colors.white,
      child: Row(children: rowContents),
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

class BuyButton extends StatefulWidget {
  @override
  _BuyButtonState createState() {
    return _BuyButtonState();
  }
}
class _BuyButtonState extends State<BuyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:FlatButton(
        color: Colors.blue,
        child: Container(
          padding: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
          child: Text("报价",style: new TextStyle(fontSize: 18.0,color: Colors.white),),
        ),
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) => new DBodyhigh()),
          );
        },
      ),
    );
  }
}

class SellButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:FlatButton(
        color: Colors.blue,
        child: Container(
          padding: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
          child: Text("平台下单",style: new TextStyle(fontSize: 18.0,color: Colors.white),),
        ),
        onPressed: () {
          print('平台下单');
          Future(() => showModalBottomSheet(
            context: context,
            builder: (context) {
            return ModalBottomSheet();
          }));
        },
      ),
    );
  }
}

class ModalBottomSheet extends StatefulWidget {
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet>
with SingleTickerProviderStateMixin {
  var heightOfModalBottomSheet = 100.0;
  var aa = "a";

  Widget build(BuildContext context) {
    return Container(
      height: heightOfModalBottomSheet,
      child: RaisedButton(
      child: Text(aa),
      onPressed: () {
      setState(() {aa = "bb";});
      }),
    );
  }
}

class Detailsheader extends StatefulWidget {
  @override
  _DetailsheaderState createState() {
    return _DetailsheaderState();
  }
}
class _DetailsheaderState extends State<Detailsheader> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Container(
              child: Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  Text(
                    '眼镜厂废料眼镜厂废料眼镜厂废料眼镜厂废料眼镜厂废料眼镜厂废料',
                    style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                  ), 
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text("¥ 300.0万元/吨",style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.red),),
              ),
              type?Buy():Sell(),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.people,color: Color(0xFF616161),size: 15.0,),
                        Text(' 浏览: 1000',style: TextStyles.TextStyle4(),)
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.location_on,color: Color(0xFF616161),size: 15.0,),
                        Text(' 浙江 台州',style: TextStyles.TextStyle4(),)
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.timelapse,color: Color(0xFF616161),size: 15.0,),
                        Text(' 2019-2-23',style: TextStyles.TextStyle4(),)
                      ],
                    ),
                  )
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}

class Buy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
      child: Text('采购资源',style: new TextStyle(fontSize: 12.0,color:Colors.green),),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.green)
      ),
    );
  }
}
class Sell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
      child: Text('供应资源',style: new TextStyle(fontSize: 12.0,color:Colors.red),),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.red)
      ),
    );
  }
}

class DetailsMore extends StatefulWidget {
  @override
  _DetailsMoreState createState() {
    return _DetailsMoreState();
  }
}
class _DetailsMoreState extends State<DetailsMore> {

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
                  child: Text('详细说明',style: TextStyles.TextStyle2(),),
                ),
              ],
            ),
          ),
          new Divider(height: 0,),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Wrap(
                  direction: Axis.horizontal,
                    children: <Widget>[
                        Text(
                        '眼镜厂废料眼镜厂废料眼镜厂废料眼镜厂废料眼镜厂废料眼镜厂废料',
                        style: TextStyles.TextStyle1(),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                      ), 
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('品种: ',style: new TextStyle(fontSize: 15.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('不锈钢类',style: new TextStyle(fontSize: 15.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('需求数量: ',style: new TextStyle(fontSize: 15.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('20吨',style: new TextStyle(fontSize: 15.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('截至时间: ',style: new TextStyle(fontSize: 15.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('2019-10-25',style: new TextStyle(fontSize: 15.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('交货地点: ',style: new TextStyle(fontSize: 15.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('浙江省 宁波市',style: new TextStyle(fontSize: 15.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 10.0),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('资源性质: ',style: new TextStyle(fontSize: 15.0,color: Colors.black,)),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text('回收商废料',style: new TextStyle(fontSize: 15.0,color: Colors.black),overflow:TextOverflow.ellipsis,),
                        )
                      ),
                    ],  
                  )
                ),
                new Divider(height: 0,color: Color(0xFFBDBDBD),),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child:Wrap(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      // Text('资源描述: ',style: new TextStyle(fontSize: 15.0,color: Colors.black)),
                      Text(
                        '眼镜厂废料，长期有效，属于企业废料，紧急处理，现货资源。',
                        style: new TextStyle(fontSize: 15.0,color: Color(0XFF424242)),
                        overflow:TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ],
                  )
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}

class DetailsTable extends StatefulWidget {
  @override
  _DetailsTableState createState() {
    return _DetailsTableState();
  }
}
class _DetailsTableState extends State<DetailsTable> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Interval_space(),
          Container(
            height: 25.0,
            child: Row(
              children: <Widget>[
                Container(color:Colors.blue,width: 4.0,),
                Container(
                  padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                  child: Text('报价列表',style: TextStyles.TextStyle2(),),
                ),
              ],
            ),
          ),
          new Divider(height: 0,),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
            width: MediaQuery.of(context).size.width,
            child:Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(50.0),
                1: FixedColumnWidth(50.0),
                2: FixedColumnWidth(30.0),
                3: FixedColumnWidth(35.0),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.symmetric(
                inside: BorderSide(
                  color: Color(0xFFEEEEEE),
                  width: 1.0,
                )
              ),
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('名字',style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('报价',style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('库存',style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('报价日期',style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('蒋先生',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('1000元/吨',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('100吨',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('2019-2-28',style: new TextStyle(fontSize: 14.0),),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('眼镜片人眼镜片人眼镜片人眼镜片人眼镜片人',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('999999元/吨',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('10吨',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('2019-2-28',style: new TextStyle(fontSize: 14.0),),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('牛肉面',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('10000元/吨',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('100吨',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('2019-12-29',style: new TextStyle(fontSize: 14.0),),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('Blue',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('1000元/吨',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('100000吨',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Text('2019-2-29',style: new TextStyle(fontSize: 14.0),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          new Divider(height: 0,),
        ],
      )
    );
  }
}

final _controllerbj = TextEditingController();
final _controllerkc = TextEditingController();
final _controllersm = TextEditingController();

class DBodyhigh extends StatefulWidget {
  @override
  _DBodyhighState createState() {
    return _DBodyhighState();
  }
}
class _DBodyhighState extends State<DBodyhigh> {
    Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("填写报价信息"),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Text("提交"),
            onPressed: (){
              if (_controllerbj.text=="") {
                gosubit("报价不能为空",context);
              }else{
                if (_controllerkc.text=="") {
                  gosubit("库存不能为空",context);
                }else{
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new Details()),
                  );
                }
              }
            },
          )
        ],
      ),
      body:DBody()
    );
    }
}

class DBody extends StatefulWidget {
  @override
  _DBodyState createState() {
    return _DBodyState();
  }
}
class _DBodyState extends State<DBody> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true, 
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Container(
                // padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: new Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: _controllerbj,
                              keyboardType: TextInputType.number,
                              onChanged: (String text){
                                setState(() {
                                });
                              },
                              decoration: const InputDecoration(
                                prefixIcon:Icon(Icons.credit_card),
                                labelText: '报价',
                                labelStyle: TextStyle(fontSize: 15.0),
                                border: InputBorder.none,
                              ),
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: new Text("元/吨",style: new TextStyle(fontSize: 16,color: Colors.grey),)
                          )
                        ],
                      ),
                    ),
                    new Divider(height: 0,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: TextField(
                              controller: _controllerkc,
                              keyboardType: TextInputType.number,
                              onChanged: (String text){
                                setState(() {
                                });
                              },
                              decoration: const InputDecoration(
                                prefixIcon:Icon(Icons.inbox),
                                labelText: '库存',
                                labelStyle: TextStyle(fontSize: 15.0),
                                border: InputBorder.none,
                              ),
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: new Text("吨",style: new TextStyle(fontSize: 16,color: Colors.grey),)
                          )
                        ],
                      ),
                    ),
                    new Divider(height: 0,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                      child: TextField(
                        controller: _controllersm,
                        maxLength: 30,
                        maxLines: 2,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon:Icon(Icons.more),
                          labelText: '说明',
                          labelStyle: TextStyle(fontSize: 15.0),
                          border: InputBorder.none,
                        ),
                        onChanged: (text){
                          setState(() {
                          //  moreValue = text; 
                          });
                        },
                      ),
                    ),
                    new Divider(height: 0,),
                  ]
                ),
              ),
              ],
            ),
          )
        ]
      )
    );
  }
}