import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/Details/Details.dart';
import 'package:metal/data/global_home.dart';

String ckjg = "aa";

class Pullbody extends StatefulWidget {
  Pullbody({Key key, this.global}) : super(key: key);

  final String global;
  @override
  _PullbodyState createState() {
    return _PullbodyState();
  }
}
class _PullbodyState extends State<Pullbody> {

  @override
  void initState() {
    super.initState();
    eventBus.on().listen((event) {
      lyb();
    });
  }

  void lyb(){
    if(mounted) {
      setState(() {
        // print("lyb");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: getHomePageContent(urls,cons),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: homePageContent["list"]==null?PullbodyNO():PullBodyYes(),
          );
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }

        // By default, show a loading spinner
        return new Center(
          child:CircularProgressIndicator()
        );
      }
    );
  }
}

class PullbodyNO extends StatefulWidget {
  @override
  _PullbodyNOState createState() {
    return _PullbodyNOState();
  }
}
class _PullbodyNOState extends State<PullbodyNO> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Center(
        child: Text("目前暂无此类需求",style: TextStyles.TextStyle3(),),
      ),
    );
  }
}

class PullBodyYes extends StatefulWidget {
  @override
  _PullBodyYesState createState() {
    return _PullBodyYesState();
  }
}
class _PullBodyYesState extends State<PullBodyYes> {
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
        itemCount: homePageContent["list"].length,
        separatorBuilder: (BuildContext context, int index) => new Divider(height: 0,color: Color(0xFFBDBDBD),),
        itemBuilder: (context, index) {
          return new Material( 
            color: Colors.white,
            child: Ink(
              child: InkWell(
                onTap: (){
                  setState(() {
                    cons["pid"] = homePageContent["list"][index]["id"]; 
                  });
                  Navigator.push<String>(
                    context,
                    new PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                          // 跳转的路由对象
                          return new Details(index: index,);
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return _PullBodyYesState
                          .createTransition(animation, child);
                    })
                  );
                },
                child:PullbodyCard(index:index),
              ),
            ),
          );
        }
      )
    );
  }
}

class PullbodyCard extends StatelessWidget {
  PullbodyCard({Key key, this.index}) : super(key: key);
  final int index;

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
              child:Image.network(
                "$urler${homePageContent["list"][index]["imgs"][0]["pathname"].toString()}",
                fit: BoxFit.cover,
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
                                      homePageContent["list"][index]["title"],
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
                            Text("意向价格",style: TextStyles.TextStyle3(),),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                            ),
                            Text("${homePageContent["list"][index]["price"]}元/吨",style: new TextStyle(fontSize: 15.0,color: Colors.red),),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("交货地点",style: TextStyles.TextStyle3(),),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                            ),
                            Text("${homePageContent["list"][index]["province"]} ${homePageContent["list"][index]["city"]}",style: new TextStyle(fontSize: 15.0),),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('需求数量',style: TextStyles.TextStyle3(),),
                            Padding(padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),),
                            Text("${homePageContent["list"][index]["number"]}${homePageContent["list"][index]["unit"]}",style: new TextStyle(fontSize: 15.0),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('${homePageContent["list"][index]["atime"]}',style: TextStyles.TextStyle4(),),
                      Text(homePageContent["list"][index]["tid"]=="1"?'采购资源':'供应资源',style: TextStyle(fontSize: 12.0,color: Color(0xFF616161),fontWeight: FontWeight.bold),),
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