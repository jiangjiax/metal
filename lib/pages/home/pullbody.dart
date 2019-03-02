import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/Details/Details.dart';

class Pullbody extends StatefulWidget {
  @override
  _PullbodyState createState() {
    return _PullbodyState();
  }
}
class _PullbodyState extends State<Pullbody> {
  static SlideTransition createTransition(
    Animation<double> animation, Widget child) {
      return new SlideTransition(
          position: new Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: const Offset(0.0, 0.0),
      ).animate(animation),
          child: child,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.separated(
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
                  Navigator.push<String>(
                    context,
                    new PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                          // 跳转的路由对象
                          return new Details();
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return _PullbodyState
                          .createTransition(animation, child);
                    })
                  );
                },
                child:PullbodyCard(),
              ),
            ),
          );
        }
      )
    );
  }
}

class PullbodyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      // color: Colors.pink,
      alignment: Alignment.topLeft,
      height: 125.0,
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.blue,
              height: 125.0,
              // padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              child: new Image.asset(
                GlobalSwiper.images[1],
                fit:BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.blue,
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Flex(
                          direction: Axis.horizontal,
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
                                      '眼镜厂废料厂',
                                      style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 2,
                                    ), 
                                  ],
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,color: Color(0xFFE0E0E0),size: 14.0,),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('参考价格',style: TextStyles.TextStyle3(),),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                            ),
                            Text("¥300元/吨",style: new TextStyle(fontSize: 15.0,color: Colors.red),),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('共需',style: TextStyles.TextStyle3(),),
                            Padding(padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),),
                            Text("1000吨",style: new TextStyle(fontSize: 15.0),),
                            Padding(padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),),
                            Text('|',style: TextStyles.TextStyle2(),),
                            Padding(padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),),
                            Text('还需',style: TextStyles.TextStyle3(),),
                            Padding(padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),),
                            Text("500吨",style: new TextStyle(fontSize: 15.0),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('2019-01-01 19:00:00  上海',style: TextStyles.TextStyle4(),),
                      Text('采购资源',style: TextStyle(fontSize: 12.0,color: Color(0xFF616161),fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
            )
          )
        ]
      ),
    );
  }
}