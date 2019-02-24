import 'package:flutter/material.dart';
import 'package:metal/pages/home/swiper.dart';
import 'package:metal/pages/search/search.dart';
import 'package:metal/pages/home/filterbar.dart';
import 'package:metal/pages/home/images.dart';
import 'package:metal/pages/home/pullbody.dart';

class HomePages extends StatefulWidget {
  HomePages({Key key, this.global}) : super(key: key);

  final GlobalKey<ScaffoldState> global;

  @override
  _HomePagesState createState() {
    return _HomePagesState();
  }
}
class _HomePagesState extends State<HomePages> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      // print(_controller.offset); //打印滚动位置
      if (_controller.offset < 10 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 10 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }
  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Color(0xFFEEEEEE),
        child:CustomScrollView(
          controller: _controller,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                SwiperPage(),
                Images(),
                Filterbar(globals: this.widget.global),
                Pullbody(),
              ]),
            )
          ],
        )
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          heroTag: 'Tag2',
          onPressed: () {
            // 返回到顶部时执行动画
            _controller.animateTo(.0,
                duration: Duration(milliseconds: 200),
                curve: Curves.ease
            );
          }
      ),
    );
  }
}

Widget HomeAppbar() {
  return new AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF42A5F5),
            Color(0xFF1976D2),
          ],
        ),
      ),
    ),
    titleSpacing:0,
    leading: new IconButton(
      icon: new Icon(
        Icons.android,
        color: Colors.white,
      ),
      onPressed: () {},
    ),
    title:BarSearch(),
  );
}
//搜索条
class BarSearch extends StatefulWidget{
  @override
  _BarSearchState createState() {
    return _BarSearchState();
  }
}
class _BarSearchState extends State<BarSearch>{
  Widget build(BuildContext context) {
    return new Container(
      child: new FlatButton(
        child: new Row(
          children: <Widget>[
            new Container(
              child: new FlatButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/search');
                },
                icon: new Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25.0
                ),
                label: new Text(
                  "搜索金属",
                  style: new TextStyle(color: Colors.white,fontSize: 18.0),
                ),
              )
            ),
          ],
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/search');
        },
      ),
      decoration: new BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
        color: Color.fromRGBO(255, 255, 255, 0.5),
      ),
    );
  }
}