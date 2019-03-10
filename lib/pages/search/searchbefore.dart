import 'package:flutter/material.dart';
import 'package:metal/data/global_config.dart';
import 'package:metal/pages/search/searchafter.dart';

class SearchBefore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Text("热门搜索", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
            alignment: Alignment.topLeft,
          ),
          new Container(
            child: HotSeachers(),
          ),
          new Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text("搜索历史", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                Icon(Icons.delete_forever,color: Color(0xFFBDBDBD),)
              ],
            ),
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            alignment: Alignment.topLeft,
          ),
          new Container(
            child: HistorySeachers(),
          ),
        ],
      ),
    );
  }
}

class HotSeachers extends StatelessWidget {
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
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child:Wrap(
        alignment: WrapAlignment.start,
        spacing: 6.0,
        runSpacing: 6.0,
        children: List<Widget>.generate(
          GlobalSearch.hot.length, (int index) {
            return Ink(
              width: 85.0,
              height: 40.0,
              child:InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new SearchAfter(search:GlobalSearch.hot[index])),
                  );
                  // Navigator.push<String>(
                  //   context,
                  //   new PageRouteBuilder(pageBuilder: (BuildContext context,
                  //       Animation<double> animation,
                  //       Animation<double> secondaryAnimation) {
                  //         // 跳转的路由对象
                  //         return new SearchAfter(search:GlobalSearch.hot[index]);
                  //   }, transitionsBuilder: (
                  //     BuildContext context,
                  //     Animation<double> animation,
                  //     Animation<double> secondaryAnimation,
                  //     Widget child,
                  //   ) {
                  //     return HotSeachers
                  //         .createTransition(animation, child);
                  //   })
                  // );
                },
                child: Container(
                  alignment: Alignment.center,
                  child:new Text(
                    GlobalSearch.hot[index],
                    overflow: TextOverflow.ellipsis,
                    style:new TextStyle(
                      fontSize: 15.0,
                    )
                  ),
                  decoration: BoxDecoration(
                    color:Color(0xFFF0EFF5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )
            );
          },
        ).toList(),
      ),
    );
  }
}

class HistorySeachers extends StatelessWidget {
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
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child:Wrap(
        alignment: WrapAlignment.start,
        spacing: 6.0,
        runSpacing: 6.0,
        children: List<Widget>.generate(
          GlobalSearch.history.length, (int index) {
            return Ink(
              width: 85.0,
              height: 40.0,
              child:InkWell(
                onTap: () {
                  Navigator.push<String>(
                    context,
                    new PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                          // 跳转的路由对象
                          return new SearchAfter(search:GlobalSearch.history[index]);
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return HotSeachers
                          .createTransition(animation, child);
                    })
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child:new Text(
                    GlobalSearch.history[index],
                    overflow: TextOverflow.ellipsis,
                    style:new TextStyle(
                      fontSize: 15.0,
                    )
                  ),
                  decoration: BoxDecoration(
                    color:Color(0xFFF0EFF5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )
            );
          },
        ).toList(),
      ),
    );
  }
}