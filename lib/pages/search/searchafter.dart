import 'package:flutter/material.dart';
import 'package:metal/pages/home/home.dart';
import 'package:metal/pages/home/filterbar.dart';
import 'package:metal/pages/home/pullbody.dart';
import 'package:metal/pages/home/Drawer.dart';

class SearchAfter extends StatefulWidget {
  SearchAfter({Key key, this.search}) : super(key: key);
  final String search;

  @override
  _SearchAfterState createState() {
    return _SearchAfterState();
  }
}
class _SearchAfterState extends State<SearchAfter> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  var _globalKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
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
      key: _globalKey,
      endDrawer: FilterDrawer(),
      appBar: new AppBar(
        elevation: 0.0,
        title: BarSearch(value:this.widget.search),
      ),
      body: CustomScrollView( 
        controller: _controller,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Filterbar(globals: _globalKey),
              new Divider(height: 0,color: Color(0xFFBDBDBD),),
              Pullbody(),
            ]),
          )
        ],
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          backgroundColor: Colors.orange,
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

class SearchAfterNo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color(0xFFEEEEEE),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.favorite,color: Colors.blue,size: 30.0),
            Padding(padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),),
            new Text("目前暂无此类金属需求",style: new TextStyle(fontSize: 20.0),)
          ],
        )
      )
    );
  }
}