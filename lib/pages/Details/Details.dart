import 'package:flutter/material.dart';
import 'package:metal/pages/home/swiper.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/cs.dart';

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
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child:ListView(
          children: <Widget>[
            SwiperPages(),
            Detailsheader(),
            Interval_space(),
            DetailsMore(),
            Interval_space(),
            DetailsTable(),
            new Divider(height: 0,),
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
          Scaffold.of(context).showSnackBar(
            const SnackBar(content: Text('聊天')),
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
          Scaffold.of(context).showSnackBar(
            const SnackBar(content: Text('电话')),
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
      Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 80.0, 0.0),
      ),
      RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),
        color: Colors.orange,
        onPressed: (){
          print('报价');
        },
        child: Text('报价',style: new TextStyle(fontSize: 15.0,color: Colors.white),),
      ),
    ];

    return BottomAppBar(
      color: Colors.white,
      child: Row(children: rowContents),
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
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('眼镜厂废料',style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),), 
                    Container(
                      margin: const  EdgeInsets.fromLTRB(5.0, 2.0, 0.0, 0.0),
                      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                      child: Text('供应资源',style: new TextStyle(fontSize: 12.0,color:Colors.red),),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.red)
                      ),
                    )
                  ],
                ),
                Icon(Icons.share,color: Color(0xFF424242)),
              ],
            ),
          ),
          Container(
            child: Text("¥ 300.0/吨",style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.red),),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // Icon(Icons.people,color: Color(0xFF424242),),
                        Text(' 浏览: 1000',style: TextStyles.TextStyle3(),)
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
                        // Icon(Icons.location_on,color: Color(0xFF424242),),
                        Text(' 浙江 台州',style: TextStyles.TextStyle3(),)
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
                        Text('2019-2-23',style: TextStyles.TextStyle3(),)
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
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('眼镜厂废料',style: TextStyles.TextStyle1(),),
                ),
                Container(
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
                  child:Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('供货数量: ',style: new TextStyle(fontSize: 15.0,color: Colors.black,)),
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
                Container(
                  child:Wrap(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Text('资源描述: ',style: new TextStyle(fontSize: 15.0,color: Colors.black)),
                      Text(
                        '描述一下描述一下描述一下描述一下描述一下描述一下描述一下描述一下',
                        style: new TextStyle(fontSize: 15.0,color: Colors.black),
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
                2: FixedColumnWidth(50.0),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.symmetric(
                inside: BorderSide(
                  color: Color(0xFFBDBDBD),
                  width: 1.0,
                )
              ),
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Text('名字',style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Text('报价',style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Text('报价日期',style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Text('蒋先生',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Text('¥ 1000.0元/吨',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Text('2019-2-28',style: new TextStyle(fontSize: 14.0),),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Text('眼镜片人',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Text('¥ 1999999.0元/吨',style: new TextStyle(fontSize: 14.0),),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Text('2019-2-28',style: new TextStyle(fontSize: 14.0),),
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