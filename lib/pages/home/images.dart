import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/data/global_home.dart';
import 'package:metal/pages/search/searchafter.dart';
import 'package:metal/pages/home/home.dart';
import 'dart:math';

class Images extends StatefulWidget {
  Images({Key key, this.globals}) : super(key: key);

  final GlobalKey<ScaffoldState> globals;
  
  @override
  _ImagesState createState() {
    return _ImagesState();
  }
}

class _ImagesState extends State<Images> {
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
    return new Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
      height: 180,
      // alignment: Alignment.center,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            // color: Colors.pink,
            // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 80,
            child:ListView(
              scrollDirection: Axis.horizontal,
              children: List<Widget>.generate(
                (metals.length/2).toInt(), (int index) {
                  return Container(
                    width: 75,
                    child: new ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          child:Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: metals[index].backcolor,
                                radius: 20,
                                child:IconButton(
                                  icon: new Image.asset(
                                    metals[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                  onPressed: (){
                                    Navigator.of(context).push(
                                      new MaterialPageRoute(builder: (context) => new SearchAfter(search:metals[index].text)),
                                    );
                                    // Navigator.push<String>(
                                    //   context,
                                    //   new PageRouteBuilder(pageBuilder: (BuildContext context,
                                    //       Animation<double> animation,
                                    //       Animation<double> secondaryAnimation) {
                                    //         // 跳转的路由对象
                                    //         return new SearchAfter(search:metals[index].text);
                                    //   }, transitionsBuilder: (
                                    //     BuildContext context,
                                    //     Animation<double> animation,
                                    //     Animation<double> secondaryAnimation,
                                    //     Widget child,
                                    //   ) {
                                    //     return _ImagesState
                                    //         .createTransition(animation, child);
                                    //   })
                                    // );
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text(metals[index].text,style:new TextStyle(fontSize: 13.0,),),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              )
                            ],
                          )
                        )
                      ],
                    )
                  );
                },
              ).toList(),
            ),
          ),
          Container(
            // color: Colors.pink,
            // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 80,
            child:ListView(
              scrollDirection: Axis.horizontal,
              children: List<Widget>.generate(
                (metals.length/2).toInt(), (int index) {
                  return Container(
                    width: 75,
                    child: new ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          child:Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: metals[(metals.length/2).toInt() + index].backcolor,
                                radius: 20,
                                child:IconButton(
                                  icon: new Image.asset(
                                    metals[(metals.length/2).toInt() + index].image,
                                    fit: BoxFit.fill,
                                  ),
                                  onPressed: (){
                                    Navigator.of(context).push(
                                      new MaterialPageRoute(builder: (context) => new SearchAfter(search:metals[index].text)),
                                    );
                                    // Navigator.push<String>(
                                    //   context,
                                    //   new PageRouteBuilder(pageBuilder: (BuildContext context,
                                    //       Animation<double> animation,
                                    //       Animation<double> secondaryAnimation) {
                                    //         // 跳转的路由对象
                                    //         return new SearchAfter(search:metals[(metals.length/2).toInt() + index].text);
                                    //   }, transitionsBuilder: (
                                    //     BuildContext context,
                                    //     Animation<double> animation,
                                    //     Animation<double> secondaryAnimation,
                                    //     Widget child,
                                    //   ) {
                                    //     return _ImagesState
                                    //         .createTransition(animation, child);
                                    //   })
                                    // );
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text(metals[(metals.length/2).toInt() + index].text,style:new TextStyle(fontSize: 13.0,),),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              )
                            ],
                          )
                        )
                      ],
                    )
                  );
                },
              ).toList(),
            ),
          )
        ],
      )
    );
  }
}